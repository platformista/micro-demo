export KRAKEND_VERSION="1.4.1"
export DOWNLOAD_URL="https://repo.krakend.io/bin/krakend_${KRAKEND_VERSION}_amd64.tar.gz"
cd $PLATFORM_CACHE_DIR
echo "Trying to download ${DOWNLOAD_URL}"
wget -N $DOWNLOAD_URL
tar xzf krakend_${KRAKEND_VERSION}_amd64.tar.gz 
cp usr/bin/* /app/
chmod +x /app/krakend
cp -n etc/krakend/krakend.json /app/krakend.json