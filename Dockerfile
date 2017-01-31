FROM alpine:edge
MAINTAINER jspc <james@zero-internet.org.uk>

RUN apk add --update --no-cache emacs-x11 ttf-dejavu && \
    rm -rf /var/cache/apk && \
    adduser -h /home/emacs -s /bin/false -S -D -u 1000 emacs

ADD .emacs /home/emacs/.emacs
ADD .emacs.d/ /home/emacs/.emacs.d

RUN install -d -m 0700 -o emacs /tmp/emacs1000
VOLUME /tmp/emacs1000

USER emacs

ENTRYPOINT ["/usr/bin/emacs"]
