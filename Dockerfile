# Use an official Node.js runtime as a base image
FROM node:lts-alpine3.18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 3000

RUN npx prisma generate
# Define the command to run your application
CMD ["npm", "run", "dev"]