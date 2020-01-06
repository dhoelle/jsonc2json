# Modifed from the awesome dockerfile template
# https://github.com/chemidy/smallest-secured-golang-docker-image 

############################
# STEP 1 build executable binary
############################
# golang:1.13.5-alpine3.11
# golang@sha256:eec8b6c0bc53eff8fc6d5f934279138854f6c93c7d997cb292bcab09d3c6a3b6
FROM golang@sha256:eec8b6c0bc53eff8fc6d5f934279138854f6c93c7d997cb292bcab09d3c6a3b6 as builder

# Create appuser
RUN adduser -D -g '' appuser

WORKDIR /home/appuser

COPY . .

# Build the binary
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -a -installsuffix cgo -o /home/appuser/jsonc2json -mod=vendor .

############################
# STEP 2 build a small image
############################
FROM scratch

# Import from builder.
# COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=builder /etc/passwd /etc/passwd

# Copy our static executable
COPY --from=builder /home/appuser/jsonc2json /go/bin/jsonc2json

# Use an unprivileged user.
USER appuser

# Run the jsonc2json binary.
ENTRYPOINT ["/go/bin/jsonc2json"]