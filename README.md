# Challenge 3: Website Deployment

Welcome to Challenge 3.

This project was bootstrapped with [Create Next App](https://github.com/segmentio/create-next-app).

## Task 1 

Given this project deploy it to AWS in an automated and reproducible fashion. The website should be reachable from all over the world.

## Task 2 

Restrict access to the site by using mechanisms that can be adapted programmatically.

## Task 3 

Deploy the site using at least 2 technology stacks. Make sure that both types of deployment can be reproduced in an automated fashion.

## Task 4 

What issues can you identify in the given site? What types of improvements would you suggest?

# Build environment

The build environment can be containerized to avoid installing dependencies on the host machine. 
In order to work with containers, it is required to install:
- Docker CE 17.06 or newer version (support for multi-stage builds)

To build the image for dev/build environment, run the following command:

`build -t challenge3-builder:latest  https://github.com/bresciamtt/challenge3.git#master`

or locally 

`build -t challenge3-builder:latest .`

# Run the build environment

To run a dev container locally, execute the following command:

`docker run --name challenge3-dev -p 3000:3000 challenge3-builder npm run dev`

To build the static html using Next.js export function, execute the following command:

(on Linux)

`docker run --name challenge3-exp -v $(pwd)/out:/usr/src/app/challenge3/out challenge3-builder npm run export`

(on Windows)

`docker run --name challenge3-exp -v %cd%/out:/usr/src/app/challenge3/out challenge3-builder npm run export`

This will create a new folder `out` locally, which can be used to deploy the website.

# Production environment

To build the production ready image, run:

`build -t challenge3-prod:latest -f Dockerfile-prd https://github.com/bresciamtt/challenge3.git#master`
