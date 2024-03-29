#!/bin/sh

# Ensure that assigned uid has entry in /etc/passwd.
if [ `id -u` -ge 10000 ]; then
    echo "Patching /etc/passwd to make ${RUNNER_USER} -> builder and `id -u` -> ${RUNNER_USER}"
    cat /etc/passwd | sed -e "s/${RUNNER_USER}/builder/g" > /tmp/passwd
    echo "${RUNNER_USER}:x:`id -u`:`id -g`:,,,:/home/${RUNNER_USER}:/bin/bash" >> /tmp/passwd
    cat /tmp/passwd > /etc/passwd
    rm /tmp/passwd
fi

cd /home/runner

http-server artifacts/build -S -p 3000
