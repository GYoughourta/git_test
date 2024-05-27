#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <repo_name> <prefix> <N> <M>"
    exit 1
fi

REPO_NAME=$1
PREFIX=$2
N=$3
M=$4

mkdir -p "$REPO_NAME"

cd "$REPO_NAME"

for ((i=0; i<N; i++)); do

    TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S-%3N")

    touch "${PREFIX}_${TIMESTAMP}.txt"

    sleep "$M"
done