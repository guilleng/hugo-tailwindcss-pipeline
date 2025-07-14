Hugo TailwindCSS Development Pipeline
=====================================

A containerized workflow for building Hugo sites with TailwindCSS.

Requirements
------------

+ make 
+ podman


Quick Start
-----------

### Clone the repository

The starter files are included as a submodule.

```sh
git clone https://github.com/guilleng/hugo-tailwindcss-pipeline
cd hugo-tailwindcss-pipeline/
git submodule update --init --recursive
```


### Build the Container

Modify the Containerfile to change the Hugo version (default: v0.127.0 extended).

```sh
podman build -t hugo-tailwindcss .
```


### Start Development

This will drop you inside the container's shell:

```sh
make code
```

Then,

```sh
npm i  # Before starting development, install the TailwindCSS dependencies
npm run dev  # Run live-reload development server on http://localhost:8080
```


Build
-----

```sh
make build
```

Assets for deployment output to `./hugo-tailwindcss-site/public/`. 


---

### Credits

The starter files skeleton belongs to 
[dirkolbritch](https://github.com/dirkolbrich/hugo-tailwindcss-starter-theme). 

