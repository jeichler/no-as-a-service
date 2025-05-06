FROM quay.io/fedora/nodejs-22:latest@sha256:6249c5be922e55e6b49d6761d7e1aad22b121c7733036b783e2529e81c6a5ca7 as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:815e338440090b0243816268d26f6fd7708b1522ae790ed126b23b895679730e
COPY --from=builder $HOME $HOME
CMD npm run -d start
