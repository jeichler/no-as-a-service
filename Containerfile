FROM quay.io/fedora/nodejs-22:latest@sha256:7c371cbb0283a6d342fa126238472f14c0c09be511aff95d7632c14861d6d549 as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:815e338440090b0243816268d26f6fd7708b1522ae790ed126b23b895679730e
COPY --from=builder $HOME $HOME
CMD npm run -d start
