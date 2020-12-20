# AutoMLFaceMask
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)  

[![Alt text](https://github.com/SouthernPark/Screenshots/blob/master/faceMask.jpg)


# Overview
  This project consists the process of building a containerized machine learning face mask detection prediction model and deploy it in a scalable, and elastic platform. 
  The elastic scale-up performance is tested via Load Test with Locust, this project starts with 1 container or endpoint and verify 2 or more inference endpoints scale     up to 1K requests per second.  
  There's also a demo video showing project scaling up to 1k+ requests served by multiple endpoints that scale-up.
  Below is the overall process of this project, which consists creating a Machine Learning model, containerizing this ML model, making a docker and deploying the   docker to Kubernetes.  
  
  Load Test Video:
  
  [![Alt text](https://img.youtube.com/vi/4aFEz_v3Qdk/0.jpg)](https://www.youtube.com/watch?v=4aFEz_v3Qdk)  
  
  
  Presentation video of this project:  
  [![Alt text](https://img.youtube.com/vi/wVYh4XJ2sJU/0.jpg)](https://www.youtube.com/watch?v=wVYh4XJ2sJU)  
 
  WorkFlow of our project:  
  ![Alt text](https://github.com/SouthernPark/Screenshots/blob/master/workflow.png)  
  
## Table of Contents
- [DataSet](#dataSet)
- [Using AutoML to train a module](#Using_AutoML_to_train_a_module)
- [Export the trained module](#Export_the_trained_module_and_Copy_it_to_local_dir)
- [Containerize the trained module](#Deploy_the_trained_module_to_a_pre_built_CPU_docker)
- [Elastic your service using kubernetes](#Elastic_your_service_using_kubernetes)
- [load_test](#load_test)
- [Other commands that you might need](#Other_commands_that_you_might_need)


## DataSet
  > Where I get this data?  
    I get the picture with face mush and without face mask from Kaggle.  
  
    https://www.kaggle.com/dhruvmak/face-mask-detection  
    Dataset is stored here:  
    https://pan.baidu.com/s/1-INSHX7zRQaMzHKXL1d3tQ   
    Extraction Code: 2kdv    

          
  There are a lot of pictures in this dataset. However, I just use 200 pictures (100 with mask and 100 without) to reduce the time and cost used in AutoML training.   
## Using_AutoML_to_train_a_module
  >(2) How do I upload these picture and train the module using AutoML?  
    You can look at this google tutorial or watch a youtube video for more help:  
          
    https://cloud.google.com/vision/automl/docs/containers-gcs-tutorial  
    https://www.youtube.com/watch?v=mMw1lleOeUA&t=483s  
            
   
   >(3) Use the trained module online or offLine?  
   You can either host the trained module very easily.  
   You can also download the trained the module to the gcp bucket and deploy the module to a pre-built container which is used to fit the trained module to do prediction.  
   In this project, we have achieved both methods.  
   And in the latter passage, we will mainly foucus on how to deploy the offline module because it is a little bit harder.  
   
## Export_the_trained_module_and_Copy_it_to_local_dir
   >(1) Export the trained module to google bucket 
   After you trained the edge module, you can export it to your google cloud bucket.  
      
      Link below shows how you can export your module to a pre-defined google cloud bucket.  
      https://cloud.google.com/vision/automl/docs/containers-gcs-tutorial#export-model    
     
   >(2) copy the module to the local dir
   
      Link for gustil to grep my module:
      gs://facemaskmodule/model-export/icn/tf_saved_model-faceMaskDT2_20201027092610-2020-10-27T15:07:04.392Z/  
      To grep my file to the local:  
      gsutil cp <bucket_location> <local_dir>  
      
## Deploy_the_trained_module_to_a_pre_built_CPU_docker 
   >(1) Download the pre-built CPU docker image from gcp container registry    
   Google has created a docker image which can help us do prediction if we can deploy the module into the container.  
      
        export CPU_DOCKER_GCR_PATH=gcr.io/cloud-devrel-public-resources/gcloud-container-1.14.0:latest  
        sudo docker pull ${CPU_DOCKER_GCR_PATH}  
     
     
   >(2) run the docker image and put the module inside the docker container  
    
        a. run the docker image and name it as "serving_base":
        docker run -d --name serving_base gcr.io/cloud-devrel-public-resources/gcloud-container-1.14.0
        
        b. enter into the docker container:
        docker exec -it <container id>  /bin/bash
        
        c. make dir under the tmp dir: 
        cd tmp
        mkdir mounted_model
        mkdir 0001
        (You must make the dir one by one, or it will fail)
        
        d. exit from docker container:  
        exit
        
   >(3) put the trainer AutoML module in to the container  
    
        docker cp <you module location> serving_base:/tmp/mounted_model/0001
        For example:
        docker cp `pwd`/serving_dir/face_mask_model/1/saved_model.pb serving_base:/tmp/mounted_model/0001
        
   >(4) commit the container so that it can become an image 
    
        docker commit serving_base <name_of_you_image>
        For example:
        docker commit serving_base face_mask_serving
        
   >(5) Run the container and test
        
        a. Run the container:
        docker run -p 8501:8501 -t face_mask_serving &
        
        b. Test the container:  
        use the request.py in this github dir to do REST request.  
        You need to specify the absolute image path that you want to predict.  
        And specify the key of the image such as 1,2 ...  
        
   >(6) Close the container 
        
        docker kill <container_id>
        docker rm <container_id>
        
   >(7) push the image to the container registry of gcp
     
        a. Before you push your imag, you must tag it in a formal format:    
        docker tag <you_image> gcr.io/<your_project_id>/<your_image>:v0.1.0
        
        b. push your image:
        docker push <the_name_of_your_image>
        
## Elastic_your_service_using_kubernetes  
  In this section, we want to put deploy our docker image into k8s, so that we can elasticly scale our service.  
    
    >(1) Default setting
    
        a. firstly, you need to set your project to default:
        gcloud auth login --project <your_project_id> 
      
        b.set the defaul zone:  
        gcloud config set compute/zone us-central1-b
        
        c.if you haven't enabled your k8s API, you can find help from link below:  
        https://cloud.google.com/kubernetes-engine/docs/how-to/creating-a-zonal-cluster  
        
   >(2) Creating container cluster 
        
        a. Create a cluster with 3 nodes:
        gcloud container clusters create <give-name-to-your-cluster> --num-nodes 3
        
        b. set default cluster and get credential
        gcloud config set container/cluster <your_cluster_name>
        gcloud container clusters get-credentials <your_cluster_name>
        (you can use 'gcloud container clusters list' to look for the clusters you have created)
        
        c. create a .yaml file to specify the configuration of a deployment file 
        Here I just attached my file to this githug dir.
        You can use it for your project by change the value of 'image'. (you jsut need to copy the path of you docker image from gcp container registry)
        
        d. start the deployment using .yaml file
        kubectl create -f face_mask_k8s.yaml
        
        e. get the service url
        kubectl get services
        (you may need sometime until the external url shows up)
        
## Load_test
  >(1) download Locust python package
  
      pip install locust
      
  >(2) run the command below:
      
      locust -f load_test.py --host http://34.70.152.43:8501
      
  >(3) open the port created by locust
    
      http://0.0.0.0:8089
      
      
## Other_commands_that_you_might_need
  
  >(1)k8s
      
      delete a deployment:
      kubectl delete -f <path_of_the_yaml_file>
      
      list the cluster you have created:
      gcloud container clusters list
      
      delete one cluster you have already created:
      gcloud container clusters delete <cluster_name>
      
  >(2)Linux
      
      delete one file:
      rm <name_of_file>
      
      delete a dir:
      rm -r <name_of_dir>
      
      delete a git dir:
      rm -rf <name_of_dir>
      
  >(3)GitHub
      
      pus your project to GitHub:
      git push -u origin main
      
  >(4)install python pip and env
       
      sudo apt-get install python3-pip
      sudo pip3 install virtualenv 
      
  >(5)create and active the virtual env
  
      a. change dir to AutoMLFaceMask 
      cd AutoMLFaceMask
      
      b. create and activate
      python3 -m venv ~/.AutoMLFaceMask 
      source ~/.AutoMLFaceMask/bin/activate
      source ~/.AutoMLFaceMask/bin/activate
      

      
      
      
