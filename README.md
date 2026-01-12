# DevOps Lab - (Linux/bash, AWS, CI/CD, Terraform)

### This repository is for practicing the fundamentals of DevOps.

## What is a Container?

In short, a container is a **standardized unit of software** that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. 

Technically speaking, a container is just an **isolated process** running on a host machine.

### How does it work under the hood?

Unlike a Virtual Machine (VM), which simulates an entire hardware stack — including a full Guest Operating System and Kernel — a container **shares the host machine's kernel**.

**But why use containers instead of VMs?**

* **Lightweight:** Containers don't need to boot a whole OS. They start in seconds.
* **Efficiency:** They use the host's CPU and RAM directly, without the "middleman" (Hypervisor) overhead.
* **Portability:** Since the container carries its own "world" (libraries and dependencies) inside its Namespaces, it runs the same way on your Mac, on a Linux server, or in the AWS Cloud.
