FROM alpine

ADD ansible /root

RUN chmod +x /root/ansible-alpine.sh && /root/ansible-alpine.sh

CMD ["/bin/sh"]
