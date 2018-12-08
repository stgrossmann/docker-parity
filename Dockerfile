FROM parity/parity:v2.1.8
MAINTAINER Stefan Großmann <39296252+stgrossmann@users.noreply.github.com>

ENV DATADIR /data

USER root

RUN mkdir "$DATADIR" \
  && chown -R 1000:1000 "$DATADIR" \
  && mkdir -p /home/parity/.local/share/io.parity.ethereum/ \
  && ln -sfn "$DATADIR" /home/parity/.local/share/io.parity.ethereum \
  && chown -h 1000:1000 /home/parity/.local/share/io.parity.ethereum/

VOLUME /data

EXPOSE 30303/tcp 30303/udp 5001/tcp 8080/tcp 8082/tcp 8083/tcp 8180/tcp 8545/tcp 8546/tcp

USER 1000:1000

ENTRYPOINT ["./entrypoint.sh"]
