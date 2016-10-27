FROM mhart/alpine-node:6.5.0

RUN apk add --no-cache make gcc g++ python
RUN cd $(npm root -g)/npm \
   && npm install fs-extra \
   && sed -i -e s/graceful-fs/fs-extra/ -e s/fs.rename/fs.move/ ./lib/utils/rename.js

RUN npm install -g node-gyp

RUN npm install argon2
