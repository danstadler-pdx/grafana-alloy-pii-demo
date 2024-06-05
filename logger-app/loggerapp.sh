#!/bin/bash

## see notes about this at the end of the script:
# - commented: running demo03-kubernetes;
# - uncomment: for the other 2 demos.
# log="/tmp/alloy-logs/loggerapp.log">>"${log}"

count=0
while [ "$count" -lt 10000 ]
do
  case $((RANDOM % 3)) in
        (0) status=OK;;
        (1) status=TEMP;;
        (2) status=PERM;;
  esac
  case $((RANDOM % 3)) in
        (0) level=WARN;;
        (1) level=INFO;;
        (2) level=DEBUG;;
  esac
  case $((RANDOM % 6)) in
        (0) data='4123123412341234 4123-1234-1234-1234 4123 1234 1234 1234  This line has an credit card number in 3 different formats.';;
        (1) data='firstname.lastname@company.com firstname@company.com      This line has an email address in 2 formats.';;
        (2) data='127.0.0.1                                                 This line has an IP address in IPV4 format.';;
        (3) data='2001:0000:130F:0000:0000:09C0:876A:130B                   This line has an IP address in IPV6 format.';;
		(4) data='503-123-1234 (503) 123-1234 (503)123-1234 503 123 1234    This line has a phone number in 4 formats.';;
		(5) data='123-45-6789  123 45 6789  123456789                       This line has an SSN in 3 formats.';;
  esac
  echo "service_name=loggerapp level=${level} status=${status} msg=\"${data}\""
  count=$((count + 1))
  sleep 1


# TODO this is cheap but works for this demo;
# maybe down the road, use env vars to control the following:

# for demo01 and demo02, i.e. running outside K8s: uncomment this line,
# i.e. send log output to the configured log location
# done >> ${log}

# for demo03: just let echo send the log to stdout, and let k8s manage
# routing the telemetry (somewhere like /var/log/container/xyz )
# then Alloy (promtail) will go find the log data there.
done