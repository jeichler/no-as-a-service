FROM quay.io/fedora/nodejs-22:latest@sha256:d15375ad0ba83f4db38d44cbef8cf2f1a4d127d47b5ed3729ef9e6c51c32138d as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:a8faf53fe0ce0bd83eaa1b37e7f3f02ad767fb81e47952f54d0fa2c76569d6dd
COPY --from=builder $HOME $HOME
CMD npm run -d start
