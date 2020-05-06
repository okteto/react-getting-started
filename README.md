This repo shows you how to build a React-based application with Okteto Cloud.

> Okteto is compatible with any Kubernetes distribution. This guide uses Okteto Cloud to take advantage of automatic builds and deploys.

## Prerequisites

1. [Install the Okteto CLI](https://okteto.com/docs/getting-started/installation)
1. Run `okteto login` to create your free Okteto Cloud account and download the required credentials and certificates.

## Launch your development environment
The `okteto.yml` manifest is configured to use the first stage of the `Dockerfile` as the development environment. 

To deploy it:

```
okteto up
```

To build the development environment and then deploy it (e.g. if you want to add more dependencies), run:

```
okteto up --build
```

## Develop your Application

`okteto up` will give you a terminal to your remote development environment. This environment is just like a regular one, except that it's running directly in Okteto Cloud. This means that it's fully integrated with the rest of your namespace.

To start your react application, simply run:

```
yarn start
```

This will start React's dev server on hot reload mode. Every time you make a change in the local version of your files, the files will be synchronized to your remote development environment and auto reloaded. 


## Deploy your production image

The `Dockerfile` is configured to give you a minimal image for production. In this case, the image only contains the build assets, served by nginx. 

To deploy your react application in Okteto Cloud, simply run:

```
okteto push
```

`okteto` push will automatically build, generate manifests, deploy and/or update your react application. 
