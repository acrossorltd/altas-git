
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
Dokcerfile based on alpine. SSH key is required as environment variable.
It will:

* clone the remote repo from ssh. migrations folder should be contained inside the repo. 
* use [altas](https://atlasgo.io/) ctl as entrypoint.


<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites
* To generate a new ssh key:
  ```sh
  ssh-keygen -t ed25519 -C "email@exmaple.com"
  ```
* [Adding a new SSH key to your account (GitHub)](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)


<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_





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
