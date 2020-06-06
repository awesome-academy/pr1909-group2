set -e
rm -f /football_news/tmp/pids/server.pid
exec "$@"
