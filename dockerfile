# nodejs-react

FROM node:20 AS ui-build

# sets the working directory inside the container to /usr/src/app
WORKDIR /usr/src/app

# copies the contents of the local my-app/ directory to the /usr/src/app/my-app/ directory inside the container
COPY my-app/ ./my-app/

# changes the working directory to /usr/src/app/my-app/ and executes the following commands sequentially:
# npm install: Installs the dependencies specified in the package.json file.
# npm run build: Builds the UI application.
RUN cd my-app && npm install && npm run build

FROM node:20 AS server-build

# sets the working directory inside the container to /root/, where the server-side code will be placed
WORKDIR /root/

# copies the built UI files from the ui-build stage to the /root/my-app/build directory inside the container
COPY --from=ui-build /usr/src/app/my-app/build ./my-app/build

# copies the package.json and package-lock.json files from the local api/ directory to the /root/api/ directory inside the container
COPY api/package*.json ./api/

# changes the working directory to /root/api/ and executes npm install to install the dependencies for the server-side code
RUN cd api && npm install

# copies the server.js file from the local api/ directory to the /root/api/ directory inside the container.
COPY api/server.js ./api/

# exposes port 80 from the container to the host, allowing external access to the server running inside the container
EXPOSE 80

# specifies the command to run when the container starts. It executes node ./api/server.js to start the server-side application
CMD ["node", "./api/server.js"]