cp standalone/cfg.bkp/* standalone/configuration/
cp -f tools/standalone.xml standalone/configuration/standalone.xml
cp -f tools/logging.properties standalone/configuration/logging.properties
touch tmp/INSTALLED
# the INSTALLED folder is required

export DB_PORT=`echo $PLATFORM_RELATIONSHIPS | base64 -d | jq -r ".database[0].port"`
export DB_ADDR=`echo $PLATFORM_RELATIONSHIPS|base64 -d|json_pp| jq -r ".database[0].host"`
export DB_PASSWORD=`echo $PLATFORM_RELATIONSHIPS|base64 -d|json_pp| jq -r ".database[0].password"`
export DB_USER=`echo $PLATFORM_RELATIONSHIPS|base64 -d|json_pp| jq -r ".database[0].username"`
export DB_DATABASE=`echo $PLATFORM_RELATIONSHIPS|base64 -d|json_pp| jq -r ".database[0].path"`
export FRONTEND_URL=`echo $PLATFORM_ROUTES|base64 -d|json_pp| jq -r 'to_entries | map_values(.value + { slug: .key }) | .[] | select(.primary == true) | .slug'`
bin/standalone.sh -Dkeycloak.frontendUrl=$FRONTEND_URL -Djboss.http.port=$PORT