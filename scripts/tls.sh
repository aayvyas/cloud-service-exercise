mkdir ssl-certificate
openssl genrsa -out ./ssl-certificate/private-key-file 2048
cat <<'EOF' >./ssl-certificate/config-file
[req]
default_bits              = 2048
req_extensions            = extension_requirements
distinguished_name        = dn_requirements


[extension_requirements]
basicConstraints          = CA:FALSE
keyUsage                  = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName            = @sans_list

[dn_requirements]
countryName               = Country Name (2 letter code)
stateOrProvinceName       = State or Province Name (full name)
localityName              = Locality Name (eg, city)
0.organizationName        = Organization Name (eg, company)
organizationalUnitName    = Organizational Unit Name (eg, section)
commonName                = Common Name (e.g. server FQDN or YOUR name)
emailAddress              = Email Address

[sans_list]
DNS.1                     = cloudservices.com

EOF
openssl req -new -key ./ssl-certificate/private-key-file \
    -out ./ssl-certificate/csr-file \
    -config ./ssl-certificate/config-file
cd ./ssl-certificate
openssl x509 -req     -signkey private-key-file     -in csr-file     -out tls-cert-file     -extfile config-file     -extensions extension_requirements     -days 30
export TLS_CERT=$(cat ~/ssl-certificate/tls-cert-file)
export TLS_PRIVATE_KEY_FILE=$(cat ~/ssl-certificate/private-key-file)
