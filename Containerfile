FROM quay.io/fedora/nodejs-22:latest@sha256:d15375ad0ba83f4db38d44cbef8cf2f1a4d127d47b5ed3729ef9e6c51c32138d as builder
USER 0
ADD . .
RUN npm install

FROM quay.io/fedora/nodejs-22-minimal:latest@sha256:1154adb6efda8a710b46e830dfb0f9d0801e37e92ef3a2879d7559e653a82532
COPY --from=builder $HOME $HOME
CMD npm run -d start
