FROM quay.io/fedora/nodejs-22:latest@sha256:d15375ad0ba83f4db38d44cbef8cf2f1a4d127d47b5ed3729ef9e6c51c32138d as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:815e338440090b0243816268d26f6fd7708b1522ae790ed126b23b895679730e
COPY --from=builder $HOME $HOME
CMD npm run -d start
