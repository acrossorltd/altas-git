
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">

  <h3 align="center">Atlas on Git</h3>

  <p align="center">
    a Dockerfile for running Atlas migrations on remote repos
    <br />

  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
ghcr.io/acrossorltd/atlas-git:alpine
Dokcerfile based on alpine. SSH key is required as environment variable.
It will:

* clone the remote repo from ssh. migrations folder should be contained inside the repo. 
* use [altas](https://atlasgo.io/) ctl as entrypoint.


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites
* To generate a new ssh key:
  ```sh
  ssh-keygen -t ed25519 -C "email@exmaple.com"
  ```
* [Adding a new SSH key to your account (GitHub)](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)


<!-- USAGE EXAMPLES -->
## Usage

* Directly running with `docker`:
  ```sh
  docker run -ti --rm -e SSH_GIT_REPO="git@github.com:[domain]/[repo].git" -e SSH_PRIVATE_KEY="$(cat ./[rsa-key])" gitrepo migrate apply
  ```

* Kubernetes(Init Containers)
  ```yaml
  apiVersion: v1
  kind: Secret
  metadata:
    name: github-ssh-key
  type: kubernetes.io/ssh-auth
  data:
    # the data is abbreviated in this example
    ssh-privatekey: |
      MIIEpQIBAAKCAQEAulqb/Y ...
  ---
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: nginx-deployment
    labels:
      app: nginx
  spec:
    replicas: 1
    selector:
      matchLabels:
        app: nginx
    template:
      metadata:
        labels:
          app: nginx
      spec:
        initContainers:
        - name: migrate
          image: ghcr.io/acrossorltd/atlas-git:alpine
          imagePullPolicy: Always
          args: ["migrate", "apply", "--url", "sqlite:///db/db.sqlite3"]
          env:
          - name: SSH_GIT_REPO
            value: git@github.com:[domain]/[repo].git
          - name: SSH_PRIVATE_KEY
            valueFrom:
              secretKeyRef:
                name: github-ssh-key
                key: ssh-privatekey
          volumeMounts:
          - name: db-mount
            mountPath: "/db"
        containers:
        - name: nginx
          image: nginx:1.14.2
          ports:
          - containerPort: 80
  ```


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

[Acorssor Dev](https://acrossor.com/your_username) - dev@acrossor.com

Project Link: [https://github.com/acrossorltd/atlas-git](https://github.com/acrossorltd/atlas-git)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgments
* [Atlas](https://atlasgo.io/)
* [Official Atlas Image](https://hub.docker.com/r/arigaio/atlas)
* [Official Alpine Image](https://hub.docker.com/_/alpine)
* [Best-README-Template](https://github.com/othneildrew/Best-README-Template)





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/acrossorltd/atlas-git/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/acrossorltd/atlas-git/blob/master/LICENSE.txt
