# grafana-alloy-pii-demo
This repo helps you understand the process of using the [Alloy "mask module"](https://github.com/grafana/alloy-modules/blob/main/modules/kubernetes/annotations/logs/mask.alloy) with Grafana Alloy.

&nbsp;  
## General demo flow
In each of the demo options listed below, Grafana Alloy is deployed, along with a small "loggerapp" file 
that generates some sample logs. You are given instructions on how to configure Alloy, which then reads the 
generated log file, and forwards that file's log lines to a Grafana Cloud account of your choice.

The demo's Alloy configuration file also contains the pipeline steps needed to demo PII masking. 

You can update both the logger app and your Alloy configuration, in order to show the process of adding new
PII use cases.


&nbsp;  
## Demo Options

### 1 - demoing on MacOSX, using homebrew (WORK IN PROGRESS)
Please see the README file in the folder "demo01-homebrew".

&nbsp;  
### 2 - demoing via Docker (NOT STARTED)
Please see the README file in the folder "demo02-docker".

&nbsp;  
### 3 - demoing via Kubernetes (NOT STARTED)
Please see the README file in the folder "demo03-kubernetes".