#!/bin/bash

curl -Lo awscliv2.zip "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"

unzip awscliv2.zip
chmod a+x ./aws/install
sudo ./aws/install
