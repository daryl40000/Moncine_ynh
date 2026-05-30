#!/bin/bash
# Fonctions communes — paquet YunoHost Moncine
#
# Variables fournies par YunoHost : $app, $install_dir, $data_dir, $domain, $path, $php_version, …

# Droits sur data/ et moncine.db (lecture/écriture pour PHP-FPM = utilisateur $app).
moncine_fix_data_permissions() {
    if [[ -z "${data_dir:-}" || ! -d "${data_dir}" ]]; then
        return
    fi
    chown -R "${app}:www-data" "${data_dir}"
    chmod 750 "${data_dir}"
    find "${data_dir}" -maxdepth 1 -type f \( -name 'moncine.db' -o -name 'moncine.db-*' \) -exec chmod 660 {} + 2>/dev/null || true
}

# Fichiers exemple dans le dossier persistant (clé TMDB, etc.).
moncine_bootstrap_data_files() {
    moncine_prepare_data_dir

    local example_key="${install_dir}/data/tmdb_api_key.txt.example"
    if [[ -f "${example_key}" && ! -f "${data_dir}/tmdb_api_key.txt" ]]; then
        cp -a "${example_key}" "${data_dir}/tmdb_api_key.txt.example"
        chown "${app}:www-data" "${data_dir}/tmdb_api_key.txt.example"
    fi
}

# Crée ou met à jour moncine.db (toujours en tant que $app, jamais en root).
moncine_run_migrate() {
    local migrate_php="${install_dir}/lib/cli/migrate.php"
    if [[ ! -f "${migrate_php}" ]]; then
        ynh_exit 1 --message="migrate.php introuvable dans ${install_dir}/lib/cli/"
    fi

    moncine_prepare_data_dir

    local base_url=""
    if [[ -n "${domain:-}" ]]; then
        base_url="https://${domain}${path}"
    fi

    ynh_print_info "Application des migrations SQL Moncine (utilisateur ${app})…"
    ynh_exec_as_app env \
        MONCINE_DATA_PATH="${data_dir}" \
        MONCINE_BASE_URL="${base_url}" \
        php"${php_version}" "${migrate_php}" \
        || ynh_exit 1 --message="Échec des migrations Moncine"

    moncine_fix_data_permissions
}

# Catalogue + affiches depuis install_seed/ (installation neuve, catalogue vide uniquement).
moncine_apply_install_seed() {
    local seed_php="${install_dir}/lib/cli/install-seed.php"
    if [[ ! -f "${seed_php}" ]]; then
        ynh_print_info "install-seed.php absent — graine d’installation ignorée."
        return 0
    fi

    moncine_prepare_install_seed_dir

    ynh_print_info "Graine d’installation (catalogue / affiches) si fichiers présents…"
    ynh_exec_as_app env \
        MONCINE_DATA_PATH="${data_dir}" \
        php"${php_version}" "${seed_php}" \
        || ynh_exit 1 --message="Échec de la graine d’installation Moncine (install_seed/)"
}

# Dossier persistant + copie optionnelle depuis le paquet YunoHost (CSV/ZIP non versionnés).
moncine_prepare_install_seed_dir() {
    mkdir -p "${data_dir}/install_seed"
    local package_seed="${YNH_APP_BASEDIR:-}/install_seed"
    if [[ -d "${package_seed}" ]]; then
        local f
        for f in "${package_seed}/"*; do
            [[ -f "${f}" ]] || continue
            local base
            base="$(basename "${f}")"
            if [[ ! -f "${data_dir}/install_seed/${base}" ]]; then
                cp -a "${f}" "${data_dir}/install_seed/"
            fi
        done
    fi
    moncine_fix_data_permissions
}

# Dossier persistant YunoHost : base SQLite, affiches, médias (hors /var/www).
moncine_prepare_data_dir() {
    mkdir -p "${data_dir}"/{posters,media,sessions,auth_rate_limit,install_seed}
    moncine_fix_data_permissions
}
