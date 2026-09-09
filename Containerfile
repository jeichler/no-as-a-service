FROM quay.io/fedora/nodejs-22:latest@sha256:424b0a20b63a321e1b674a0c0fe32b219073b36306153fcaabb64b24b9ee6108 as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:815e338440090b0243816268d26f6fd7708b1522ae790ed126b23b895679730e
COPY --from=builder $HOME $HOME
CMD npm run -d start
