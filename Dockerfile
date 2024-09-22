# Use this image as the platform to build the app
FROM node:18-alpine AS build
LABEL Developer="Tim Lor"

# Set environment variables
ENV NODE_ENV=dev
ENV PORT=5173

# The WORKDIR instruction sets the working directory for everything that will happen next
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install the dependencies
RUN npm ci

# Copy the current directory contents into the container at /app
COPY . ./

# We need to give the node user permission just in case
# This takes a long ass time tho so be warned
RUN chown -R node:node /app

EXPOSE ${PORT}

USER node

# Run the app when the container launches
CMD ["npm", "run", "dev"]