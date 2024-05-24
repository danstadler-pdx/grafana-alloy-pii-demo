# Demo 2 - using Docker

## What's different from demo01-homebrew?

Like demo01-homebrew, this version of the demo is still using the loggerapp, and still configuring 
Alloy to read/mask/forward the log files to the Grafana Cloud account that you configure.

On the other hand, some things are different in this demo.

1) We stop (mostly) using any local configuration files, and instead pull in configuration from 
other places.  ** NOTE: this is not complete yet - the files are still local for the moment **

2) We show a more realistic way of reading logs and adding the "fake annotation labels". This will look
much more like how Alloy tends to be configured in production environments, for example when using
[Grafana's K8s integration Helm chart](https://github.com/grafana/k8s-monitoring-helm).

3) We stop using homebrew, and instead use Docker and Docker Compose as our runtime environment.


## Instructions

All of the steps below have been tested on MacOS 14.4.

&nbsp;  
### 1) Install Docker and Docker Compose
You are welcome to do this any way you prefer. For the testing I've done with this demo, I'm using [Docker Desktop](https://docs.docker.com/desktop/install/mac-install/), which installs both Docker and Docker Compose. If you prefer a different solution, just be sure that you can run basic "hello world" tests of both the ```docker``` and ```docker-compose``` commands.


&nbsp;  
### 2) Take a look at config.alloy
The file is in this directory. What's very different about this file, vs. the first demo, is that it only does 2 things: 
1) Configure our logging preferences
2) Pull down our actual configuration from the GitHub-hosted version of this repository.

What this demonstrates is that Alloy can run with a very minimal local configuration file, and you can use the SCM/CICD solutions of your choice to manage your configurations remotely.

If you follow the thread of what config.alloy loads, you can see that it brings in config-main.alloy from this repo, which is where much of the logic from the first demo now lives. This is where you will also see that we are using a different mechanism for discovering and "fake labeling" our log streams.

In addition, config-alloy.main also imports the Alloy Modules directly from its Github repo, with a tag specified. (Using a specific tag helps you ensure that the version of the modules repo you are using does not change on you.)

(A possible alternative could be for you to fork the Alloy Modules repo into the private repository of your choice, and then import it from there. This would simply give you more control over exactly what code you are importing into your own runtime environment.)


&nbsp;  
### 3) Boot the environment


