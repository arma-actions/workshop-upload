FROM cm2network/steamcmd:root as workshop-upload

ENV STEAM_USERNAME=
ENV STEAM_PASSWORD=

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD ["."]
ENTRYPOINT ["/entrypoint.sh"]
