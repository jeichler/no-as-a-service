FROM quay.io/fedora/nodejs-22:latest@sha256:f79123871b11c293185b39fdebd39f9ef1aa16b59f674387a9d4fa17710f0310 as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:815e338440090b0243816268d26f6fd7708b1522ae790ed126b23b895679730e
COPY --from=builder $HOME $HOME
CMD npm run -d start
