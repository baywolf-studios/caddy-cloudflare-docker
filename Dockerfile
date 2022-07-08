ARG buildertag=caddy:builder
ARG basetag=caddy:latest

FROM caddy:${buildertag} AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:${basetag}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
