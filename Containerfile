FROM quay.io/fedora/nodejs-22:latest@sha256:97c1c692dadafc214d82d263d60aa82ef6c3ef9fc6281cda7599521a47444d54 as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:815e338440090b0243816268d26f6fd7708b1522ae790ed126b23b895679730e
COPY --from=builder $HOME $HOME
CMD npm run -d start
