# docker-serve

Docker image for serving static website using [serve](https://github.com/zeit/serve)

The container will serve the static website on port `80`

## Assumptions

A `build` script is available inside the `package.json` and will produce all the static files needed into the folder `/build`
