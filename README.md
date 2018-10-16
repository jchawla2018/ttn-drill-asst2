# ToTheNew DevOps Drill (Docker)

Basic docker and dockcompose files for providing solution to below ToTheNew DevOps Drill exercises. 

Exercise 1
-------
Create an nginx Docker image and add index.html and nginx configuration file using Dockerfile.

Exercise 2
-------
Serve seperate index.html based on the environment variables passed to the docker container and change the nginx log location at run time.

  #### Solution for exercise 1 & 2:
  
    cd docker-nginx
    docker build -t submit-ttn-nginx:v1.0 .

Run the docker image and pass the values to environment variables 'ENV' (dev or prod) and 'LOG_PATH' (e.g '/var/log'). Default LOG_PATH is '/var/log/ngnix'

    docker run -it -d  --name submit-drill -p 80:80 -e ENV='prod' -e LOG_PATH='/var/log' submit-ttn-nginx:v1.0
    
Go to http://drill.com and you should see the index.html based on ENV value passed on run time. 

Exercise 3
-------
Use docker compose to run nginx and tomcat container. Use sample "hello world" war file(search google and download) to deploy in tomcat. Use health check parameter in compose. Nginx should proxypass to tomcat(using nginx'x container's hostname). Do not use default docker network.

  #### Solution for exercise 3:
  
    cd compose
    docker-compose up -d
    
Run the `docker ps` command to check the health status of the containers. 

Go to http://drill.com:5000/ and you should be able to land on tomcat application landing page. 

Destroy the stack with:

    docker-compose down 

Exercise 4
-------

Use docker swarm with docker compose to deploy repicas of both services: nginx and tomcat.

  #### Solution for exercise 4:
  
    cd swarm
    docker stack deploy --compose-file docker-swarm.yml ttn
    
Run the below commands to check the status of the stack you deployed:

    docker stack services ttn
    docker stack ps ttn
    
Go to http://drill.com:5000/ and you should land on tomcat application.

Destroy the stack with:
    
    docker stack rm ttn
   
Exercise 5
-------   

Use fluentd logging driver with docker and show logs access.log and catalina.out logs. Use containers for elasticsearch, fluentd and kibana as well. Use separate docker networks for logging system and application. Use docker volume for elasticsearch.

    cd docker-efk

A basic docker compose file that will set up Elasticsearch, Fluentd, and Kibana.

    docker-compose up -d
    
Go to http://drill.com:5601 with your browser to confirm logs from kibana. Then, you need to set up the index name pattern for Kibana. Then, go to Discover tab to seek for the logs. As you can see, logs are properly collected into Elasticsearch + Kibana, via Fluentd.

## NOTE:

Please map you public ip address to drill.com for this exercise and allow the respective ports in security group. 
