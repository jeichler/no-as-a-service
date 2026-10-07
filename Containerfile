FROM quay.io/fedora/nodejs-22:latest@sha256:d15375ad0ba83f4db38d44cbef8cf2f1a4d127d47b5ed3729ef9e6c51c32138d as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:091add465d1b81e37d62d2262a204823dfdb1b1ef5e3fc490e62cceaba848088
COPY --from=builder $HOME $HOME
CMD npm run -d start
