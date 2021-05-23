#!/bin/bash

serverRoot="/var/www/html/"
projectDir="/var/www/html/hotel-revenue-service"
githubAuthToken="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"
githubUser="savindug"
githubRepo="hotel-revenue-service"

cd /var/www/html/ && sudo curl -O -J -L -u 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:x-oauth-basic https://github.com/savindug/hotel-revenue-service/archive/master.zip


if [ -f /var/www/html//hotel-revenue-service-master.zip ]; then
    
    sudo unzip -q /var/www/html//hotel-revenue-service-master.zip

    
    sudo rm /var/www/html//hotel-revenue-service-master.zip

 
    pm2 stop ratebuckets-server

    
    sudo rm -rf /var/www/html/hotel-revenue-service

    
    sudo mv hotel-revenue-service-master /var/www/html/hotel-revenue-service

   
    cd /var/www/html/hotel-revenue-service

   
    sudo npm install

   
    pm2 start --name ratebuckets-server sudo npm -- start

    
    sudo pm2 save
fi