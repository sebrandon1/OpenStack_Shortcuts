#! /bin/bash

# Source your AdminRC or OpenRC files if they exist.
if [[ -f ~/openrc ]]
then
    . ~/openrc
fi

if [[ -f ~/adminrc ]]
then
    . ~/adminrc
fi

# Check for the Tenant ID.
if [[ -z $1 ]]
then
    echo "Please use a Tenant ID as the first parameter."
    exit 0
fi

# Run the stack-list and look for the provided tenant.
NOVALIST=$(nova list --tenant=$1 --all_tenants 1)
echo "$NOVALIST"
