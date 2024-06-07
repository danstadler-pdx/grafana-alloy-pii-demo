# grafana-alloy-pii-demo
This repo shows 3 examples of setting up Alloy (local machine, Docker, Kubernetes) alongside a small bash script ("loggerapp") that generates some log lines with common PII examples. In all the 3 cases, the code and accompanying notes show you how to configure Alloy to mask the PII, by incorporating the PII masking solution contained in this [Alloy "mask module"](https://github.com/grafana/alloy-modules/blob/main/modules/kubernetes/annotations/logs/mask.alloy).

Please file issues and or PRs as you see opportunities for improvement.

&nbsp;  
## Key outcomes
1) If you fast-forward to either demo 2 or demo 3, you will see a key outcome: *the configuration code you give to Alloy can be maintained in a central repository that you control*, and Alloy can be configured to pull that configuration down at boot time, and then re-poll the remote location for changes, on the interval you select. 

(more key outcomes to be added here over time)

&nbsp;  
## General demo flow
In each of the demo options listed below, Grafana Alloy is deployed, along with a small "loggerapp" file 
that generates some sample logs. You are given instructions on how to configure Alloy, which then reads the 
generated log file, and forwards that file's log lines to a Grafana Cloud account of your choice.

The demo's Alloy configuration file also contains the pipeline steps needed to demo PII masking. 

You can update both the logger app and your Alloy configuration, in order to show the process of adding new
PII use cases.


&nbsp;  
## Do you need go through them in order?

While there are 3 separate demo options and you can start with any one of them, there is also a progression
through new topics as you move through the demos in order 1 -> 2 -> 3. Therefore if you don't plan
to go in that order, it is still recommended that you read through each demo's instructions so that you can
at least see what it does, and perhaps peek into how its files look. 

(Example: config.alloy goes through some adjustment between demos 1 and 2, so learning how it looks in 
demo 1 can be helpful before looking at that file in demo 2.)

&nbsp;  
## Demo Options

### 1 - demoing on MacOSX, using homebrew (STABLE)
Please see [the README file in the folder "demo01-homebrew"](./demo01-homebrew).

&nbsp;  
### 2 - demoing via Docker (STABLE)
Please see [the README file in the folder "demo02-docker"](./demo02-docker).

&nbsp;  
### 3 - demoing via Kubernetes (FIRST STABLE VERSION NOW AVAILABLE)
Please see [the README file in the folder "demo03-k8s"](./demo03-k8s).

&nbsp;  
## Additional learnings
This repo was initially meant to just quickly demo those 3 paths. However, along the way I learned a lot of new things about using Alloy, so maybe the demos included here will help others learn some of the same things.
- Good general practices when using modules
- Loading modules from remote locations (good for thinking about CICD pipelines)
- Debugging while building alloy files
- Deeper dive into Alloy's discovery mechanisms
- The relationship between K8s annotations and Loki labels
- Different "kinds" of annotations/labels; for example some labels can be designed only for shaping what happens in Alloy, but not end up in your log storage (therefore not influencing your Loki-side cardinality.)

