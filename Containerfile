FROM quay.io/fedora/nodejs-22:latest@sha256:95ebf55d81858fa6fd8bd24693afd5bc41fbbd803da9948847b815566789a355 as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:815e338440090b0243816268d26f6fd7708b1522ae790ed126b23b895679730e
COPY --from=builder $HOME $HOME
CMD npm run -d start
