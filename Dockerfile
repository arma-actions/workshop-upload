FROM cm2network/steamcmd as workshop-upload

ENV STEAM_USERNAME=
ENV STEAM_PASSWORD=

COPY entrypoint.sh /entrypoint.sh

USER root
RUN chmod +x /entrypoint.sh

USER steam

CMD ["."]
ENTRYPOINT ["/entrypoint.sh"]
