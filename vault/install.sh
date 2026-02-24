export VAULT_VERSION="1.6.2"
export DOWNLOAD_URL="https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip"
cd $PLATFORM_CACHE_DIR
echo "Trying to download ${DOWNLOAD_URL}"
wget -N $DOWNLOAD_URL
unzip vault_${VAULT_VERSION}_linux_amd64.zip  -d ~/