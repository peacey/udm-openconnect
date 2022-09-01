#!/bin/sh
podman build --security-opt="seccomp=unconfined" -t openconnect -f Dockerfile .
