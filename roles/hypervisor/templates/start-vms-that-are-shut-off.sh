#!/bin/bash

VIRSH=/usr/bin/virsh

for VMID in $( ${VIRSH} list --all | grep 'shut off' | awk '{print $2}' ); do
  echo "attempting to start $VMID as it is currently shutdown..."
  $VIRSH start $VMID
done

