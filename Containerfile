FROM quay.io/fedora/nodejs-22:latest@sha256:64c6f98d043d444a012eb533ae6a6b2de70c5684d919e851f22ad33f608f9835 as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:815e338440090b0243816268d26f6fd7708b1522ae790ed126b23b895679730e
COPY --from=builder $HOME $HOME
CMD npm run -d start
