#!/bin/bash

if [[ -f ~/openrc ]]
then
    . ~/openrc
fi

if [[ -f ~/adminrc ]]
then
    . ~/adminrc
fi

NL3AGENTSINFO=$(neutron agent-list | grep L3)

for nl3agentid in $(echo "$NL3AGENTSINFO" | awk '{ print $2 }')
do
    NL3AGENTNAME=$(echo "$NL3AGENTSINFO" | grep $nl3agentid | awk '{ print $7 }')
    NL3AGENTDEAD=$(echo "$NL3AGENTSINFO" | grep $nl3agentid | grep -c xxx)
    echo "Listing all routers on network node \"$NL3AGENTNAME\" (AGENT DEAD=$NL3AGENTDEAD)"
    touch /tmp/routers_$nl3agentid > /dev/null 2>&1
    sudo chmod 777 /tmp/routers_$nl3agentid
    neutron router-list-on-l3-agent $nl3agentid | awk '{ print $14 }' | sed 's/"//g' | sed 's/}]}//g' > /tmp/routers_$nl3agentid
    sed -i '/^$/d' /tmp/routers_$nl3agentid
    echo "Pinging all routers ($(cat /tmp/routers_$nl3agentid | wc -l)) on network node..."
    sudo fping -f /tmp/routers_$nl3agentid -s -q 2>&1 | grep -v Unreachable
done

