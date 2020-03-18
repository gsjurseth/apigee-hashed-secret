#!/bin/bash

#curl -i -H Content-type:application/json \
#  https://api.enterprise.apigee.com/v1/o/emea-poc15/developers/gsjurseth@google.com/apps/hashed-app/keys/create -X POST -d '{ 
#  "consumerKey": "myPrettyKey", 
#  "consumerSecret": ""
#}' -u gsjurseth@google.com


#curl -i -H Content-type:application/json https://api.enterprise.apigee.com/v1/o/emea-poc15/developers/gsjurseth@google.com/apps/hashed-app/keys/myPrettyKey -X POST -d '{ "apiProducts": ["Hashed-Product"]}' -u gsjurseth@google.com

curl -i -H Content-type:application/json https://api.enterprise.apigee.com/v1/o/emea-poc15/developers/gsjurseth@google.com/apps/hashed-app/keys/KOd2MNEgUVR9kpSMenCeRdJJSb2ouy9F -X DELETE -u gsjurseth@google.com

#KOd2MNEgUVR9kpSMenCeRdJJSb2ouy9F
