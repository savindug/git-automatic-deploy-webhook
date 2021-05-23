#!/bin/bash

serverRoot="/var/www/html/"
projectDir="/var/www/html/hotel-revenue-service"
githubAuthToken="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"
githubUser="savindug"
githubRepo="hotel-revenue-service"

cd $serverRoot && sudo curl -O -J -L -u $githubAuthToken:x-oauth-basic https://github.com/$githubUser/$githubRepo/archive/master.zip


if [ -f $serverRoot/hotel-revenue-service-master.zip ]; then
    
    sudo unzip -q $serverRoot/hotel-revenue-service-master.zip

    
    sudo rm $serverRoot/hotel-revenue-service-master.zip

 
    pm2 stop ratebuckets-server

    
    sudo rm -rf $projectDir

    
    sudo mv hotel-revenue-service-master $projectDir

   
    cd $projectDir

   
    sudo npm install

   
    pm2 start --name ratebuckets-server sudo npm -- start

    
    sudo pm2 save
fi