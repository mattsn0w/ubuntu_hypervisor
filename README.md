# Bootstraping an Ubuntu 20.04.x HyperVisor

## which came first - Chicken or the egg?
Ths role is meant to bootstrap a freshly installed vanilla Ubuntu 20.04.3 server

## Applying the hypervisor role
### Setting up Python3 
The Python3 directory below is a v(_irtual_)env created via the `bin/step1_install-pip3.sh` script. However, it does depends on packages installed by the hypervisor role here.  
If you're starting from scratch you will need to run the role from a host with ansible, or install the python and xslt related packages found in `roles/hypervisor/vars/main.yaml`.  


### Limiting to the current bootstrapp(ing|ed) host.
Now run the playbook.
```
# As root. This is bad. dont do it!
 # ansible-playbook \
    -i inventory/home/hosts.yaml \
    --limit=brick.co.slakin.net \
    --connection=local  hypervisor.yaml  

# As a user with become
$ ansible-playbook \
    -i inventory/hosts.yaml \
    --limit=brick6.co.slakin.net \
    --become --ask-become-pass \
    hypervisor.yaml

```

### Fix for VMs not starting at host boot time.
```
ansible-playbook -i /tanker/ansible/bare_metal_hosts/inventory/hosts.yaml \
  --limit=brick3.co.slakin.net \
  --become --ask-become-pass \
  --tags systemd \
  hypervisor.yaml
```

