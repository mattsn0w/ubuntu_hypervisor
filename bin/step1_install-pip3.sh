#!/bin/bash
# must run this as root


if [ ! -f get-pip.py ]; then
    /usr/bin/curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
fi

# Install pip to global python
/usr/bin/python3 get-pip.py

# Create venv
/usr/bin/python3 -m venv /opt/python-ansible
source /opt/python-ansible/bin/activate

# Install ansible globally
/opt/python-ansible/bin/pip3 install ansible





