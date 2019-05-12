# *DON'T USE THIS IN THE PRODUCTION !!!*


# Local dev environment for building jenkins pipelins with [minikube, helm,?]

Motivation is to create easy dockerized environment for DEVELOPERS to speed up development of Jenkins pipelines which should build / deploy for the Kubernetes.

This should bring fast development loop.

This allow us to skip playing with `on premis` K8 + `on premise` Jenkins instance.

**Note:** _Most of the companies don't maintain separate Jenkins for the development purposes._


### Usual development cycle without the localdev env:
  * write some code
  * commit that code
  * push Jenkinsfile into upstream
  * start build (webhook or manually)
  * build fails
  * try again the same

### With the localdev env:
  * write some code
  * start build 
  * build fails
  * try again the same