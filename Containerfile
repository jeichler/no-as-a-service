FROM quay.io/fedora/nodejs-22:latest@sha256:64c6f98d043d444a012eb533ae6a6b2de70c5684d919e851f22ad33f608f9835 as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:dd388780b2b0f8f48982344f15cbc2946f26cbc696497cf013d63ca3957e23df
COPY --from=builder $HOME $HOME
CMD npm run -d start
