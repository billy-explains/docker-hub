# Docker must be at least version 20.10.12 

FROM rabbitmq:4.0.4-management

USER rabbitmq
RUN rabbitmq-plugins --offline enable rabbitmq_peer_discovery_k8s
RUN rabbitmq-plugins --offline enable rabbitmq_shovel_management
COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf
COPY --chmod=400 ms-cookie /var/lib/rabbitmq/.erlang.cookie
COPY --chmod=775 wrapper-entrypoint.sh /usr/local/bin/wrapper-entrypoint.sh

USER root
RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.conf

ENV RABBITMQ_SERVER_ADDITIONAL_ERL_ARGS="-setcookie microservices-shared-cookie-Y3VjaG8gcm9ja3Mh"
ENV RABBITMQ_NODENAME="rabbit"

ENTRYPOINT [ "wrapper-entrypoint.sh" ]
