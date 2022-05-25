Custom Kubernetes Admission Controller
======================================


This is an example of custom Kubernetes Controller which scans images from containers and
stop pods spawning with vulnerable images.

Under the hood, it uses `trivy <https://github.com/aquasecurity/trivy>`_ to scan image used in the pod definition.
