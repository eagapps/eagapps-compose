#!/bin/bash

if [ -z "$(find sites -mindepth 2 -maxdepth 2 -name site_config.json 2>/dev/null)" ]; then
    # Create a new site if it does not exist, and install eagapps into it after creation
    docker compose -p eagapps exec backend bench new-site \
    --mariadb-user-host-login-scope=% \
    --db-root-username "root" \
    --db-root-password "${DB_PASSWORD}" \
    --db-name "${DB_NAME}" \
    --admin-password "${ADMIN_PASSWORD}" \
    --install-app "eagapps" \
    "${SITE_NAME}"
fi