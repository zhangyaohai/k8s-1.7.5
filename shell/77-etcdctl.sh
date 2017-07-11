#!/bin/bash -x
# author: felix-zh
# e-mail: faer615@gmail.com

ENVFILE=./00-globalenv.sh

# env
if [ -f $ENVFILE ];then
  . $ENVFILE
else
  echo "$ENVFILE not found!"
  exit
fi

#export ETCDCTL_API=3 

for ip in ${NODE_IPS}; do
  echo "---------------------------------"
  etcdctl \
  --endpoints=https://${ip}:2379  \
  --ca-file=/etc/kubernetes/ssl/ca.pem \
  --cert-file=/etc/kubernetes/ssl/kubernetes.pem \
  --key-file=/etc/kubernetes/ssl/kubernetes-key.pem \
  $*
done