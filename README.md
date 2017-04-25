#alpine-maven-ember [![Build Status](https://travis-ci.org/clairton/alpine-maven-ember.svg?branch=master)](https://travis-ci.org/clairton/alpine-maven-ember)

Docker image do build app with maven and emberjs

To run in your project create container.sh and put

```sh
#!/bin/sh

docker run -i --rm \
	-v $HOME/.m2:/home/dev/.m2:rw  \
	-v $HOME/.ssh:/home/dev/.ssh:ro \
	-v $PWD:/home/dev/${PWD##*/}:rw \
	-w /home/dev/${PWD##*/} \
	simulador \
	$@
  
```

And run with `sh container.sh mvn...|ember...`
