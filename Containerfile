FROM quay.io/fedora/nodejs-22:latest@sha256:d15375ad0ba83f4db38d44cbef8cf2f1a4d127d47b5ed3729ef9e6c51c32138d as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:95f17c8609d0077ad0e641dccad97c97abe19364ba8211afd2f9eb1f7d6307bb
COPY --from=builder $HOME $HOME
CMD npm run -d start
