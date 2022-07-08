ARG builder-tag=builder
ARG base-tag=latest

FROM caddy:${builder-tag} AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:${base-tag}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
