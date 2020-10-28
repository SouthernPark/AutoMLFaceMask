# AutoMLFaceMask

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

## I.DataSet For AutoML
  >(1) Where I get this data?  
    I get the picture with face mush and without face mask from Kaggle.  
  
    https://www.kaggle.com/dhruvmak/face-mask-detection  
          
  There are a lot of pictures in this dataset. However, I just use 200 pictures (100 with mask and 100 without) to reduce the time and cost used in AutoML training.   
## II.Using AutoML to train a module
  >(2) How do I upload these picture and train the module using AutoML?  
    You can look at this google tutorial or watch a youtube video for more help:  
          
    https://cloud.google.com/vision/automl/docs/containers-gcs-tutorial  
    https://www.youtube.com/watch?v=mMw1lleOeUA&t=483s  
            
   
   >(3) Use the trained module online or offLine?  
   You can either host the trained module very easily.  
   You can also download the trained the module to the gcp bucket and deploy the module to a pre-built container which is used to fit the trained module to do prediction.  
   In this project, we have achieved both methods.  
   And in the latter passage, we will mainly foucus on how to deploy the offline module because it is a little bit harder.  
   
## II.Export the trained module and Copy it to local dir
   >(1) Export the trained module to google bucket 
   After you trained the edge module, you can export it to your google cloud bucket.  
      
      Link below shows how you can export your module to a pre-defined google cloud bucket.  
      https://cloud.google.com/vision/automl/docs/containers-gcs-tutorial#export-model    
     
   >(2) copy the module to the local dir
   
      Link for gustil to grep my module:
      gs://facemaskmodule/model-export/icn/tf_saved_model-faceMaskDT2_20201027092610-2020-10-27T15:07:04.392Z/  
      To grep my file to the local:  
      gsutil cp <bucket_location> <local_dir>  
      
## III. Deploy the trained module to a pre-built CPU docker 
   >(1) Download the pre-built CPU docker image from gcp container registry    
   Google has created a docker image which can help us do prediction if we can deploy the module into the container.  
      
        export CPU_DOCKER_GCR_PATH=gcr.io/cloud-devrel-public-resources/gcloud-container-1.14.0:latest  
        sudo docker pull ${CPU_DOCKER_GCR_PATH}  
     
     
   >(2) run the docker image and put the module inside the docker container  
    
        run the docker image and name it as "serving_base":
        docker run -d --name serving_base gcr.io/cloud-devrel-public-resources/gcloud-container-1.14.0
        
        enter into the docker container:
        docker exec -it <container id>  /bin/bash
        
        make dir under the tmp dir: 
        cd tmp
        mkdir mounted_model
        mkdir 0001
        (You must make the dir one by one, or it will fail)
        
        exit from docker container:  
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
        
        Run the container:
        docker run -p 8501:8501 -t face_mask_serving &
        
        Test the container:  
        use the request.py in this github dir to do REST request.  
        You need to specify the absolute image path that you want to predict.  
        And specify the key of the image such as 1,2 ...  
        
   >(6) Close the container 
        
        docker kill <container_id>
        docker rm <container_id>
        
   >(7) push the image to the container registry of gcp
     
        Before you push your imag, you must tag it in a formal format:    
        docker tag <you_image> gcr.io/<your_project_id>/<your_image>:v0.1.0
        
        push your image:
        docker push <the_name_of_your_image>
        
        
6. 将训练好的模型部署到pre-built CPU container 容器当中  
  (2) 启动下载的container, 重新命名container为serving_base  
        docker run -d --name serving_base gcr.io/cloud-devrel-public-resources/gcloud-container-1.14.0  
  (3)  进入docker内部  
      docker exec -it <container id>  /bin/bash  
  (3)  在docker内部的tmp文件夹下建立mounted_model/0001文件夹  
      cd tmp  
      mkdir mounted_model  
      mkdir 0001  
      (必须一个个文件夹 创建, 否则无法创建)
  (3) 把训练好的model放入刚才启动的docker container当中  
       docker cp `pwd`/serving_dir/face_mask_model/1/saved_model.pb serving_base:/tmp/mounted_model/0001    
  (4) 生成face_mask_serving image  
       docker commit serving_base face_mask_serving  
  (4)  关闭之前生成serving_base container  
      docker kill <container_id>    
      docker rm <container_id>  
  (5) 运行  
      docker run -p 8501:8501 -t face_mask_serving &  
  (5) 启动docker image 测试能否prediction(tensorflow serving 通过8501端口进行RESTful API响应)  
  (5) 关闭container, 上传docker image 到gcp container registery
      a. 上传之前需要对image进行一定规则的tag  
        docker tag <you_image> gcr.io/<your_project_id>/<your_image>:v0.1.0  
      b.  上传你刚才tag的docker image  
        docker push <you-pre-taged-image>
       
      
