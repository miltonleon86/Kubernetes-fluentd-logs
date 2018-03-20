# Fluentd Log Collector For Kubernetes

This image reads logs from Docker containers hosted in
a Kubernetes cluster  and send them via the GELF protocol
to Graylog and MongoDB.

You can configure behaviour via the following environment
variables:

* `GELF_HOST` - the logging server address. (Dockerfile)
* `GELF_PORT` - UDP port. (Dockerfile)
* `MONGO_HOST` - logging mongo server address. (Dockerfile)
* `MONGO_PORT` - mongo port. (Dockerfile)
* `MONGO_DB` - Database name. (Dockerfile)
* `MONGO_COLLECTION` - Collection to save the logs if is not set mongo should create it automatically. (Dockerfile)

#### If you're using a private repository be aware of your secret key in order to let kubernetes to pull from the repo. take a look on the deployment yml by imagePullSecrets: you should change to you secret name, if yout image is in a public repo just delete that conf.

#### On gralog you should configure the input: GELF UDP.
#### Graylog search source: `source:logger-staging*`
