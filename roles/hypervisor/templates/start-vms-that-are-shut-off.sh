#!/bin/bash

VIRSH=/usr/bin/virsh
EXIT_CODE=0
for VMID in $( ${VIRSH} list --all | grep 'shut off' | awk '{print $2}' ); do
  echo "attempting to start $VMID as it is currently shutdown..."
  $VIRSH start $VMID
  EXIT_CODE=$[ ${EXIT_CODE} + $? ]
done
exit ${EXIT_CODE}

