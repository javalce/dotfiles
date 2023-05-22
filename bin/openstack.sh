#!/bin/bash

name="openstackCLI"

case "$1" in
"run")
	docker run --name $name -it --add-host controller:147.156.84.206 \
		-v ~/cloud/openstackrc:/tmp/tempdir \
		twcammaster.uv.es/ocata-cli /bin/bash
	;;
"start")
	docker start $name
	;;
"stop")
	docker stop $name
	;;
"sh")
	docker exec -it $name /bin/bash
	;;
"ps")
	docker ps --all
	;;
*)
	echo "Usage $0 (run/start/stop/ps/sh)"
	echo ""
	echo "run	Run a openstack container"
	echo "start	Start a stopped openstack container"
	echo "stop	Stop a openstack container"
	echo "sh	Run a shell in a openstack container"
	echo "ps	Show the state of all containers"
	;;
esac
