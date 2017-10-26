FROM alpine:edge

COPY startup /sbin/startup

WORKDIR /root
RUN apk add --no-cache tini bash \
    && chmod 755 /sbin/startup

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/sbin/startup"]
