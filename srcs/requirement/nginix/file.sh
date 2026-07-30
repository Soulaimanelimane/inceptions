#!/bin/bash

until nc -z wordpress 9000; do
    echo "Waiting for WordPress to start..."
    sleep 2
done


exec nginx -g "daemon off;"
