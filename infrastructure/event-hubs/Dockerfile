FROM microsoft/azure-cli

COPY ./eventhubs-init.sh ./eventhubs-init.sh
RUN chmod +x ./eventhubs-init.sh

ENTRYPOINT [ "/bin/bash" ]