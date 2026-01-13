# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A collection of bash scripts that help with performing simple OpenStack tasks. The scripts are organized by OpenStack service component.

## Directory Structure

- **`heat/`** - Heat orchestration service scripts
- **`neutron/`** - Neutron networking service scripts
- **`nova/`** - Nova compute service scripts

## Code Style

### Bash
- Scripts should follow standard bash best practices
- Use meaningful variable names
- Include comments for complex operations
- Test scripts against your OpenStack environment before committing

## Requirements

- OpenStack CLI tools installed and configured
- Valid OpenStack credentials (typically via `openrc` file)
- Appropriate permissions for the OpenStack services being accessed
