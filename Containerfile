FROM quay.io/fedora/nodejs-22:latest@sha256:faf8584bb40d1291c2adf9ec4b965e3d6648aa6704c7c3d5ed7ebc83e7832089 as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:815e338440090b0243816268d26f6fd7708b1522ae790ed126b23b895679730e
COPY --from=builder $HOME $HOME
CMD npm run -d start
