
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
if [[ ! -z $1 ]]
then
    TENANT=$1
elif [[ -z $1 ]]
then
    echo "Please use a Tenant ID as the first parameter."
    exit 0
fi

# Run the stack-list and look for the provided tenant.
STACKLIST=$(heat stack-list -g -f tenant=$TENANT)
#echo "$STACKLIST"

STACKS=$(echo "$STACKLIST" | grep -v [[:space:]]id[[:space:]] | grep -v ^+ | grep -v -e '^$' | wc -l)

echo "Total number of stacks for tenant: $STACKS"

