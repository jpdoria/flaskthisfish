#!/bin/sh
# replace the default ssmtp.conf
cat > /etc/ssmtp/ssmtp.conf << EOF
UseSTARTTLS=YES
root=$SMTP_USER
hostname=$(hostname).$DOMAIN
mailhub=$SMTP_SERVER
AuthUser=$SMTP_USER
AuthPass=$SMTP_PASS
EOF

# watch the HTTP_CODE and send alerts if value is not 200
HTTP_CODE=$(wget --server-response --spider --quiet "http://localhost:5000" 2>&1 | awk 'NR==1{print $2}')
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "Got $HTTP_CODE. Expected HTTP code is 200." | ssmtp "$RECIPIENT"
    exit 1
fi