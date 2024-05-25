# Demo 2 - using Docker

## What's different from demo01-homebrew?

Like demo01-homebrew, this version of the demo is still using the loggerapp, and still configuring 
Alloy to read/mask/forward the log files to the Grafana Cloud account that you configure.

On the other hand, some things are different in this demo.

1) We stop (mostly) using any local configuration files, and instead pull in configuration from 
other places. (*** NOTE: this is not actually complete yet - the files are still local for the moment. More coming soon on that. ***)

2) We show a more realistic way of reading logs and adding the "fake annotation labels". This will look
much more like how Alloy tends to be configured in production environments, for example when using
[Grafana's K8s integration Helm chart](https://github.com/grafana/k8s-monitoring-helm).

3) We stop using homebrew, and instead use Docker and Docker Compose as our runtime environment.


## Instructions

All of the steps below have been tested on MacOS 14.4.

Before starting: if you haven't run through demo01, you might want to head over to that README page and at least familiarize yourself with how it works. 

As with that demo, you will need to clone the repo. Also, until this branch is merged into main, you should run 
```git switch build-demo01``` so that you are working with the correct materials.


&nbsp;  
### 1) Install Docker and Docker Compose
You are welcome to do this any way you prefer. For the testing I've done with this demo, I'm using [Docker Desktop](https://docs.docker.com/desktop/install/mac-install/), which installs both Docker and Docker Compose. If you prefer a different solution, just be sure that you can run basic "hello world" tests of both the ```docker``` and ```docker-compose``` commands.


&nbsp;  
### 2) Take a look at config.alloy

#### *** Temporary notes for this section ***
For the moment, config.alloy pulls in 2 additional files: one for setting up our logging discovery and 
labeling, the other is still our local copy of the masking moddule we used in demo01.

The next round of changes will switch over to using the import.git component, and then the next block of 
text will make more sense.

&nbsp;  
#### *** Proposed real notes, after import.git is added ***

The file is in this directory. What's very different about this file, vs. the first demo, is that it only does 2 things: 
1) Configure our logging preferences
2) Pull down our actual configuration from the GitHub-hosted version of this repository.

What this demonstrates is that Alloy can run with a very minimal local configuration file, and you can use the SCM/CICD solutions of your choice to manage your configurations remotely.

If you follow the thread of what config.alloy loads, you can see that it brings in config-main.alloy from this repo, which is where much of the logic from the first demo now lives. This is where you will also see that we are using a different mechanism for discovering and "fake labeling" our log streams.

In addition, config-alloy.main also imports the Alloy Modules directly from its Github repo, with a tag specified. (Using a specific tag helps you ensure that the version of the modules repo you are using does not change on you.)

(A possible alternative could be for you to fork the Alloy Modules repo into the private repository of your choice, and then import it from there. This would simply give you more control over exactly what code you are importing into your own runtime environment.)


&nbsp;  
### 3) Set up your environment variables.
No more support in this demo for hardcoding! Time to do this proper.

In the root directory of this folder is a file called .env. There are some entries commented out, pending the above mentioned changes, but the last 3 you should fill in with the appropriate values for your cloud account.


&nbsp;  
### 4) Boot the environment
If you already have Grafana Agent running in some other way on your machine, you should shut it down first. 

Then run:
```docker-compose up```

The first thing you'll see is that with docker-compose, you get a lot of log output from Alloy sent back into your terminal. Just let that run.

&nbsp;  
### 5) View logs in Grafana (same instructions as in demo01-homebrew)
In your Grafana Cloud instance, go to Explore, switch to your Logs datasource (the same one you generated a write
token for), and look for your inbound logs. If you have not modified your filename from the defaults
provided in this demo, this LogQL query should work for you:

``` {filename="/tmp/alloy-logs/loggerapp.log"} ```

Assuming everything is working, you should be seeing log messages from loggerapp, with redactions where the configured regex rules have detected PII.

![example of redacted logs in Grafana](../demo01-homebrew/images/example-redacted-logs.png)


&nbsp;  
### 6) Stop loggerapp and Alloy
In the terminal where you ran docker-componse, use ctrl-c to stop the program.

After the containers have stopped, you can also do a more proper teardown by entering:
```docker-compose down```

This can sometimes be helpful to clean up any resources left behind after a shutdown.

Note that even after shutdown, the shared volume created by compose.yaml will still exist. You can see this by typing:
```docker volume list```

For more on volume management, [here are the documentation pages](https://docs.docker.com/storage/volumes/).

&nbsp;  
## Other notes

### TODO some notes still to come here.
