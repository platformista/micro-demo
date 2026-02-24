set -e

if [ ! -d "$PLATFORM_CACHE_DIR"/keycloak-$KC_VERSION ]; then
    echo "Downloading KeyCloak version ${KC_VERSION}..."
    (
        cd "$PLATFORM_CACHE_DIR"
        curl -L -o $KC_VERSION.tar.gz https://downloads.jboss.org/keycloak/$KC_VERSION/keycloak-$KC_VERSION.tar.gz
        tar -zxf $KC_VERSION.tar.gz
        rm -f $KC_VERSION.tar.gz
    )
else
    echo "Using cached archive of Keycloak: ${KC_VERSION}..."
fi

echo "Installing archive of Keycloak: ${KC_VERSION}..."
cp -R "$PLATFORM_CACHE_DIR"/keycloak-"$KC_VERSION"/* .
mv standalone/configuration standalone/cfg.bkp

curl -L https://repo1.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/$JDBC_MARIADB_VERSION/mariadb-java-client-$JDBC_MARIADB_VERSION.jar > modules/system/layers/base/org/mariadb/jdbc/main/mariadb-jdbc.jar

rm -rf standalone/tmp/auth
rm -rf domain/tmp/auth