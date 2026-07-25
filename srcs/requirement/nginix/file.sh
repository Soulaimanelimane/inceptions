#!/bin/bash

# Keep checking if port 9000 is open on the wordpress container
until nc -z wordpress 9000; do
    echo "Waiting for WordPress to start..."
    sleep 2
done

# Once it's open, start Nginx!
exec nginx -g "daemon off;"
