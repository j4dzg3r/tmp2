FROM bitnami/pgbouncer:latest

COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.ini
COPY userlist.txt /etc/pgbouncer/userlist.txt
COPY entrypoint.sh /entrypoint.sh

USER root
RUN chmod +x /entrypoint.sh && \
    chown -R 1001:root /etc/pgbouncer && \
    chmod -R 775 /etc/pgbouncer

# Возвращаемся к пользователю 1001
USER 1001

# Запускаем entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# CMD ["pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]
