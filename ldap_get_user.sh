#!/bin/sh

USER_ID="$1"
ATTRIBUTES="$2"

ENV_NAME=$(hostname)

if [[  $# -le 0 ]]; then
	echo "Usage:"
	echo "Please note, this script should be executed in a corresponding environment, e.g. in int, qa or prod. Please also copy certificates (ad-root-ca.cacert and ad-root-cert-fonterra-web-channel.cacert) to the target host and place it in the same folder where this script resides."
	echo "./ldap_get_user.sh user_id [LDAP attributes]"
	echo "You will be prompted for AD password. Look for AD password in fencepost-authentication-override.properties."
	echo "e.g.: "
	echo "./ldap_get_user.sh 300336"
	echo "./ldap_get_user.sh 300336 fpUsername,userPassword"
	exit 1
fi 

if [[ "$ENV_NAME" == *qa* ]]; then
    URL="ldaps://10.155.13.108"
    BASE_DN="OU=Fencepost Users,OU=Portal Users,DC=athene,DC=local"
    CERT_PARAM="--cacert ad-root-cert-fonterra-web-channel.cacert"
    AD_USER="!sysFPUsersAdmin"
elif [[ "$ENV_NAME" == *prod* ]]; then
    URL="ldaps://10.155.8.77"
    BASE_DN="OU=Fencepost Users,OU=Portal Users,DC=apollo,DC=local"
    CERT_PARAM="--cacert ad-root-cert-fonterra-web-channel.cacert"
    AD_USER="!sysFPUsersAdmin"
elif [[ "$ENV_NAME" == *int* ]]; then
    URL="ldaps://10.155.13.108"
    BASE_DN="OU=Fencepost Users,OU=Portal Users,DC=athene,DC=local"
    CERT_PARAM="--cacert ad-root-ca.cacert"
    AD_USER="!sysFPUsersAdmin"
# Could not make it working for dev environment, there is an issue with authentication
#elif [[ "$ENV_NAME" == *dev* ]]; then
#    URL="ldap://wwad-devfp01.solnetsolutions.co.nz"
#    BASE_DN="OU=Fencepost Users,OU=Portal Users,DC=ffp,DC=solnetsolutions,DC=co,DC=nz"
#    CERT_PARAM=""
else
    echo "Wrong environment: Supported: int, qa, prod."
    exit 1
fi

if [[ -z "$ATTRIBUTES" ]]; then
    ATTRIBUTES="sAMAccountName,fpUsername,userAccountControl,lockoutTime,userPassword,whenChanged,badPwdCount,badPasswordTime,lastLogon,pwdLastSet,accountExpires,logonCount"
fi

echo $URL

curl -v -k -u $AD_USER $CERT_PARAM "$URL/$BASE_DN?$ATTRIBUTES?sub?(samAccountName=$USER_ID)"