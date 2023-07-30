# Use the official NGINX base image
FROM nginx

# Copy the HTML file to the default web root directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 8005 for HTTP traffic
EXPOSE 8005
