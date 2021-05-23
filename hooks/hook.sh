#!/bin/bash

serverRoot="/var/www/html/"
projectDir="/var/www/html/hotel-revenue-service"
githubAuthToken="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"
githubUser="savindug"
githubRepo="hotel-revenue-service"

# First, get the zip file
cd $serverRoot && sudo curl -O -J -L -u $githubAuthToken:x-oauth-basic https://github.com/$githubUser/$githubRepo/archive/master.zip

# Second, unzip it, if the zip file exists
if [ -f $serverRoot/hotel-revenue-service-master.zip ]; then
    # Unzip the zip file
    sudo unzip -q $serverRoot/hotel-revenue-service-master.zip

    # Delete zip file
    sudo rm $serverRoot/hotel-revenue-service-master.zip

    #stop currently runnig pm2 server
    pm2 stop ratebuckets-server

    # Delete current directory
    sudo rm -rf $projectDir

    # Replace with new files
    sudo mv hotel-revenue-service-master $projectDir

    #navigate into project dir
    cd $projectDir

    #install project dependencies
    sudo npm install

    #run new build on pm2
    pm2 start --name ratebuckets-server sudo npm -- start

    #save pm2
    sudo pm2 save
fi