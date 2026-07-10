# OpenStack Shortcuts

A collection of bash scripts for performing common OpenStack administration tasks. Scripts are organized by OpenStack service component and auto-source `~/openrc` or `~/adminrc` credential files at startup.

## Directory Structure

### heat/

Heat orchestration service scripts.

- **`num_stacks.sh`** - Counts total stacks for a given tenant ID.
- **`stackList.sh`** - Lists all stacks for a given tenant ID with details.

### neutron/

Neutron networking service scripts.

- **`pingrouters.sh`** - Pings all routers on L3 agents to check connectivity. Requires `fping` and `sudo`.

### nova/

Nova compute service scripts.

- **`list_tenant_instances.sh`** - Lists all instances for a given tenant ID.

## Usage

Most scripts take a tenant ID as the first argument:

```bash
./heat/num_stacks.sh <tenant-id>
./heat/stackList.sh <tenant-id>
./nova/list_tenant_instances.sh <tenant-id>
```

## Requirements

- OpenStack CLI tools (`heat`, `neutron`, `nova` clients)
- Valid OpenStack credentials (`~/openrc` or `~/adminrc`)
- `fping` (for `neutron/pingrouters.sh`)
- `sudo` access (for `neutron/pingrouters.sh`)
