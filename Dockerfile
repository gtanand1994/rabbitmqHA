FROM rabbitmq:3.7 
COPY ./.env /tmp/.env
RUN rabbitmq-plugins enable --offline rabbitmq_management
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt
# Fix nodename 
RUN echo 'NODENAME=rabbit@$(cat /tmp/.env|grep RABBITMQ_HOSTNAME|cut -d "=" -f 2)' > /etc/rabbitmq/rabbitmq-env.conf
EXPOSE 15672 
EXPOSE 1883 
EXPOSE 8883
