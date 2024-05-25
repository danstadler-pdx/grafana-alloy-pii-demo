# grafana-alloy-pii-demo
This repo was initially meant as a way to show Grafana users how to incorporate the PII masking solution contained in this [Alloy "mask module"](https://github.com/grafana/alloy-modules/blob/main/modules/kubernetes/annotations/logs/mask.alloy).

Along the way I learned a lot of new things about using Alloy, so maybe the demos included here will help others learn some of the same things.
- Good general practices when using modules
- Loading modules from remote locations (good for thinking about CICD pipelines)
- Debugging while building alloy files
- Deeper dive into Alloy's discovery mechanisms
- The relationship between K8s annotations and Loki labels
- Different "kinds" of annotations/labels; for example some labels can be designed only for shaping what happens in Alloy, but not end up in your log storage (therefore not influencing your Loki-side cardinality.)

Please file issues and or PRs as you see opportunities for improvement.

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

### 1 - demoing on MacOSX, using homebrew (FIRST STABLE VERSION AVAILABLE)
Please see the README file in the folder "demo01-homebrew".

&nbsp;  
### 2 - demoing via Docker (WORK IN PROGRESS)
Please see the README file in the folder "demo02-docker".

&nbsp;  
### 3 - demoing via Kubernetes (NOT STARTED)
Please see the README file in the folder "demo03-kubernetes".
