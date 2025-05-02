FROM quay.io/fedora/nodejs-22:latest as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest
COPY --from=builder $HOME $HOME
CMD npm run -d start
