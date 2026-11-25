FROM quay.io/fedora/nodejs-22:latest@sha256:d15375ad0ba83f4db38d44cbef8cf2f1a4d127d47b5ed3729ef9e6c51c32138d as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:b1a148a13fc44db71b0674dd67467a5f4ec59fd3662845d77e3a02620c23f6ad
COPY --from=builder $HOME $HOME
CMD npm run -d start
