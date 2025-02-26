#!/bin/sh

# Проверяем, что все необходимые переменные окружения установлены
if [ -z "$PGBOUNCER_PORT" ] || [ -z "$POSTGRES_PORT" ] || [ -z "$POSTGRES_DB" ] || [ -z "$POSTGRES_USER" ] || [ -z "$POSTGRES_PASSWORD" ]; then
  echo "Ошибка: Не все переменные окружения установлены."
  exit 1
fi

# Заменяем переменные окружения в pgbouncer.ini
sed -i "s|\${PGBOUNCER_PORT}|$PGBOUNCER_PORT|g" /etc/pgbouncer/pgbouncer.ini
sed -i "s|\${POSTGRES_PORT}|$POSTGRES_PORT|g" /etc/pgbouncer/pgbouncer.ini
sed -i "s|\${POSTGRES_DB}|$POSTGRES_DB|g" /etc/pgbouncer/pgbouncer.ini
sed -i "s|\${POSTGRES_USER}|$POSTGRES_USER|g" /etc/pgbouncer/pgbouncer.ini
sed -i "s|\${POSTGRES_PASSWORD}|$POSTGRES_PASSWORD|g" /etc/pgbouncer/pgbouncer.ini

# Заменяем переменные в userlist.txt
sed -i "s|\${POSTGRES_USER}|$POSTGRES_USER|g" /etc/pgbouncer/userlist.txt
sed -i "s|\${POSTGRES_PASSWORD}|$POSTGRES_PASSWORD|g" /etc/pgbouncer/userlist.txt

# Проверяем, что файлы были успешно созданы
if [ ! -f /etc/pgbouncer/pgbouncer.ini ] || [ ! -f /etc/pgbouncer/userlist.txt ]; then
  echo "Ошибка: Не удалось создать конфигурационные файлы."
  exit 1
fi

# Запускаем PgBouncer
exec pgbouncer /etc/pgbouncer/pgbouncer.ini