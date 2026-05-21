FROM quay.io/fedora/nodejs-22:latest@sha256:98036a2ddd3d1bfc10550c92b6a3501757cd46a222bd2c257e677f2f50b9d6e5 as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:815e338440090b0243816268d26f6fd7708b1522ae790ed126b23b895679730e
COPY --from=builder $HOME $HOME
CMD npm run -d start
