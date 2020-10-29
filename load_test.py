from locust import HttpUser, between, task
import base64
import io
import json
import requests
import os

#run the following in the terminal to start load testing
#locust -f load_test.py --host http://34.70.152.43:8501


image_file_path=os.getcwd() + "/with_face_mask_test.png"
with io.open(image_file_path, 'rb') as image_file:
    encoded_image = base64.b64encode(image_file.read()).decode('utf-8')

instances = {
            'instances': [
                    {'image_bytes': {'b64': str(encoded_image)},
                     'key': "1"}
            ]
    }

class WebsiteUser(HttpUser):
    wait_time = between(5, 15)

    
    @task
    def index(self):
        self.client.post("/v1/models/default:predict", data=json.dumps(instances))




