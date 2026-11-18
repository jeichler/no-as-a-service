FROM quay.io/fedora/nodejs-22:latest@sha256:d15375ad0ba83f4db38d44cbef8cf2f1a4d127d47b5ed3729ef9e6c51c32138d as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:71bce9c4f111eddb25b774e0284002c6e6cbf491c18d82f0cec26b524794f65c
COPY --from=builder $HOME $HOME
CMD npm run -d start
