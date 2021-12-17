FROM node
LABEL authors="TravelXML"
# Create app directory
WORKDIR /app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# COPY package*.json ./ \
#     ./source ./

# This will copy everything from the source path 
# --more of a convenience when testing locally.
COPY . .
# update each dependency in package.json to the latest version
RUN npm install -g npm-check-updates \
    ncu -u \
    npm install \
    npm start
    
# If you are building your code for production
RUN npm ci --only=production
# Bundle app source
COPY . /app
EXPOSE 3000
CMD [ "node", "app.js" ]