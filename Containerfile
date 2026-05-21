FROM quay.io/fedora/nodejs-22:latest@sha256:d15375ad0ba83f4db38d44cbef8cf2f1a4d127d47b5ed3729ef9e6c51c32138d as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:1d5f32073e19ee74501186e0d649ab716c779e87bb56db26bfe81443a4bdf03d
COPY --from=builder $HOME $HOME
CMD npm run -d start
