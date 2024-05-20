# grafana-alloy-pii-demo
This repo helps you understand the process of adding/configuring the Alloy "mask module" with a locally running 
instance of Alloy.

## Demo Architecture/components

### 1) Grafana Alloy
Runs on your local machine in this demo, enabling you to quickly make changes and try them, before moving to K8s
or other deployments of Alloy.

### 2) Vault
Also local - holds the credentials Alloy needs for shipping to Grafana Cloud Logs. (Example setup steps to be added soon).

### 3) Grafana Cloud Logs
The back-end to which your log files will be shipped.


## Repo Contents

### demo-app/loggerapp.sh
This is a bash program which you can run without dependencies; it generates log messages into the file you specify.
You can add extend the set of use cases in order to add new PII examples.
Note that the log file location/name you specify here must match what you have in alloy-config/config.alloy.)


### alloy-config/config.alloy
This is a config file for Grafana Alloy. It reads the log file generated by loggerapp.sh, imports/configures the 
components from the Alloy masking module, adds those components to the pipeline, and then ships the log data
through the pipeline and then out to Grafana Cloud Logs.


### downloaded-alloy-modules/downloaded-alloy-modules.alloy
This is a locally-saved version of this file:
https://github.com/grafana/alloy-modules/blob/main/modules/kubernetes/annotations/logs/mask.alloy

There are several recommended ways to include modules with Alloy; loading a local file is just one of them.

You should explore the documented options for loading module files, here:
https://grafana.com/docs/alloy/latest/concepts/modules/#importing-modules

This version of the file has a few minor fixes, which were filed as PRs on the Grafana Alloy repo:
https://github.com/grafana/alloy-modules/pull/19
https://github.com/grafana/alloy-modules/pull/18


## Instructions

TODO

