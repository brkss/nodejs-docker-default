FROM node:14.5.0

# make dir
WORKDIR /app

COPY package.json .

RUN npm install 

COPY . .

EXPOSE 4000

VOLUME ["/app/node_modules"]

CMD ["node", "src/index.js"]