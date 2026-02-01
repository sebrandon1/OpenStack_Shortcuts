# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A collection of bash scripts that help with performing simple OpenStack tasks. The scripts are organized by OpenStack service component.

## Directory Structure

- **`heat/`** - Heat orchestration service scripts
  - `num_stacks.sh` - Counts total stacks for a given tenant ID
  - `stackList.sh` - Lists all stacks for a given tenant ID with details
- **`neutron/`** - Neutron networking service scripts
  - `pingrouters.sh` - Pings all routers on L3 agents to check connectivity
- **`nova/`** - Nova compute service scripts
  - `list_tenant_instances.sh` - Lists all instances for a given tenant ID

## Usage

Most scripts follow a common pattern:
```bash
# Provide tenant ID as first argument
./heat/num_stacks.sh <tenant-id>
./nova/list_tenant_instances.sh <tenant-id>
```

Scripts auto-source `~/openrc` or `~/adminrc` credential files at startup.

## Code Style

### Bash
- Scripts should follow standard bash best practices
- Source credential files at script start
- Validate required parameters before proceeding
- Use meaningful variable names
- Include comments for complex operations
- Test scripts against your OpenStack environment before committing

## Requirements

- OpenStack CLI tools installed (`heat`, `neutron`, `nova` clients)
- Valid OpenStack credentials (typically via `~/openrc` or `~/adminrc` file)
- Appropriate permissions for the OpenStack services being accessed
- `fping` utility (required by `neutron/pingrouters.sh`)
- `sudo` access (required by `neutron/pingrouters.sh`)
