# Use an official Node.js runtime as a parent image
FROM node:16 AS build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Angular application
RUN npm run build --prod

# Use an Nginx image to serve the Angular application
FROM nginx:alpine

# Copy the built Angular application to the Nginx HTML directory
COPY --from=build /app/dist/angular-copilot /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
