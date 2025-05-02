FROM quay.io/fedora/nodejs-22:latest@sha256:6249c5be922e55e6b49d6761d7e1aad22b121c7733036b783e2529e81c6a5ca7 as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:dd388780b2b0f8f48982344f15cbc2946f26cbc696497cf013d63ca3957e23df
COPY --from=builder $HOME $HOME
CMD npm run -d start
