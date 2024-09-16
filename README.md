Terraform Proxmox Cloud Init Kubernetes
===

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

This module sets up a Kubernetes cluster on a proxmox hypervisor using cloud-init for automation. It provisions the necessary nodes, deploys the kubernetes control plane and worker nodes, and configures the networking accordingly. The module assumes you have a proxmox server with an active PVE install. It does not require a prepared image and just uses the default debian cloud init image.

[contributors-shield]: https://img.shields.io/github/contributors/deb4sh/terraform-proxmox-cloud-init-kubernetes.svg?style=for-the-badge
[contributors-url]: https://github.com/deb4sh/terraform-proxmox-cloud-init-kubernetes/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/deb4sh/terraform-proxmox-cloud-init-kubernetes.svg?style=for-the-badge
[forks-url]: https://github.com/deb4sh/terraform-proxmox-cloud-init-kubernetes/network/members
[stars-shield]: https://img.shields.io/github/stars/deb4sh/terraform-proxmox-cloud-init-kubernetes.svg?style=for-the-badge
[stars-url]: https://github.com/deb4sh/terraform-proxmox-cloud-init-kubernetes/stargazers
[issues-shield]: https://img.shields.io/github/issues/deb4sh/terraform-proxmox-cloud-init-kubernetes.svg?style=for-the-badge
[issues-url]: https://github.com/deb4sh/terraform-proxmox-cloud-init-kubernetes/issues
[license-shield]: https://img.shields.io/github/license/deb4sh/terraform-proxmox-cloud-init-kubernetes.svg?style=for-the-badge
[license-url]: https://github.com/deb4sh/terraform-proxmox-cloud-init-kubernetes/blob/main/LICENSE.txt