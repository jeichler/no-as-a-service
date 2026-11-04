FROM quay.io/fedora/nodejs-22:latest@sha256:d15375ad0ba83f4db38d44cbef8cf2f1a4d127d47b5ed3729ef9e6c51c32138d as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:4187fe437ea8ac87fd412f6a99cc55d7a0aa8da92037cc1c17fe2d9af5851425
COPY --from=builder $HOME $HOME
CMD npm run -d start
