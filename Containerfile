FROM quay.io/fedora/nodejs-22:latest@sha256:0cab19dbecc6b312b8b7006ba6d82fcc2572eb95a8d38fe913e048b18f45bd3b as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:815e338440090b0243816268d26f6fd7708b1522ae790ed126b23b895679730e
COPY --from=builder $HOME $HOME
CMD npm run -d start
