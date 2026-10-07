FROM quay.io/fedora/nodejs-22:latest@sha256:75f2d27bed6a74a6c83cdaeb81a5efbaf91b3481b7265efbe695f57a266664c4 as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:815e338440090b0243816268d26f6fd7708b1522ae790ed126b23b895679730e
COPY --from=builder $HOME $HOME
CMD npm run -d start
