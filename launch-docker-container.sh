#!/usr/bin/bash
NAME="build-librustprocps-ng"
WORKDIR="/mnt/${NAME}"

function die {
   >&2 echo "$@. Dying.".
   exit 1
}

if ! which docker; then
    die "Docker not installed or not on the system PATH";
fi

if ! docker ps 2>&1 >/dev/null; then
    die "User has not been authorized to use Docker"
fi

if [ "$( docker ps -a | grep -i build-librustprocps-ng )" == "" ]; then
    echo "Could not find build image."
    echo "Constructing build image."
    docker build -t "${NAME}" .
fi

echo "Launching build container..."
docker run -ti --name build-librustprocps-ng --volume="${PWD}":/mnt/build-librustprocps-ng -w /mnt/build-librustprocps-ng build-librustprocps-ng

#Cleanup:
docker rm "${NAME}"


