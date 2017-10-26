FROM alpine:edge

COPY startup /sbin/startup
COPY mount-nfs /sbin/mount-nfs

WORKDIR /root
RUN apk add --no-cache tini bash \
    && chmod 755 /sbin/startup /sbin/mount-nfs

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/sbin/startup"]
