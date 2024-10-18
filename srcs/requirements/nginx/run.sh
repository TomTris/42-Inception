#!/bin/bash

mv /github.png /var/www/html/github.png
mv /graph.png /var/www/html/graph.png
mv /intra.png /var/www/html/intra.png
mv /linkedin.png /var/www/html/linkedin.png
mv /qdo.html /var/www/html/qdo.html
mv /lake.gif /var/www/html/lake.gif

echo "Ready"
nginx -g "daemon off;"