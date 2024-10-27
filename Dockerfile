#Dockerfile

# Use this image as the platform to build the app
FROM node:20.11-alpine AS external-website

# A small line inside the image to show who made it
LABEL Developers="Abdiel Souza"

# The WORKDIR instruction sets the working directory for everything that will happen next
WORKDIR /app

# Copy all local files into the image
COPY . .

# Build SvelteKit app
RUN yarn build

# Delete source code files that were used to build the app that are no longer needed
RUN rm -rf src/ static/ emailTemplates/ docker-compose.yml

# The USER instruction sets the user name to use as the default user for the remainder of the current stage
USER node:node

# This is the command that will be run inside the image when you tell Docker to start the container
CMD ["node","build/index.js"]