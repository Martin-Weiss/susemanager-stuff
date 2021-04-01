#!/bin/bash

#Variables
PRODKEYS="infrastructure load-balancer rke-rancher rke-prod"
TESTKEYS="rke-test"
INTKEYS="rke-int"
BASECHANNEL="staging-sles15sp2-prod-sle-product-sles15-sp2-pool-x86_64"
CHILDCHANNELS="staging-sles15sp2-prod-sle-15-sp2-desktop-nvidia-driver-we
staging-sles15sp2-prod-sle-manager-tools15-pool-x86_64-sp2
staging-sles15sp2-prod-sle-manager-tools15-updates-x86_64-sp2
staging-sles15sp2-prod-sle-module-basesystem15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-basesystem15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-cap-tools15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-cap-tools15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-containers15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-containers15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-desktop-applications15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-desktop-applications15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-devtools15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-devtools15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-legacy15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-legacy15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-live-patching15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-live-patching15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-packagehub-subpackages15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-packagehub-subpackages15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-public-cloud15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-public-cloud15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-python2-15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-python2-15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-server-applications15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-server-applications15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-transactional-server15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-transactional-server15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-web-scripting15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-web-scripting15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-product-ha15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-product-ha15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-product-sles15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-product-we15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-product-we15-sp2-updates-x86_64
staging-sles15sp2-prod-sle15-sp2-installer-updates-x86_64
staging-sles15sp2-prod-sles15sp2-ptfs
staging-sles15sp2-prod-suse-caasp-4.5-pool-x86_64-sp2
staging-sles15sp2-prod-suse-caasp-4.5-updates-x86_64-sp2
staging-sles15sp2-prod-suse-enterprise-storage-7-pool-x86_64-sp2
staging-sles15sp2-prod-suse-enterprise-storage-7-updates-x86_64-sp2
staging-sles15sp2-prod-suse-packagehub-15-sp2-backports-pool-x86_64
staging-sles15sp2-prod-suse-packagehub-15-sp2-pool-x86_64"

CHILDCHANNELS="staging-sles15sp2-prod-sle-manager-tools15-pool-x86_64-sp2
staging-sles15sp2-prod-sle-manager-tools15-updates-x86_64-sp2
staging-sles15sp2-prod-sle-module-basesystem15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-basesystem15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-containers15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-containers15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-legacy15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-legacy15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-public-cloud15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-public-cloud15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-python2-15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-python2-15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-server-applications15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-server-applications15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-module-web-scripting15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-module-web-scripting15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-product-ha15-sp2-pool-x86_64
staging-sles15sp2-prod-sle-product-ha15-sp2-updates-x86_64
staging-sles15sp2-prod-sle-product-sles15-sp2-updates-x86_64
staging-sles15sp2-prod-sle15-sp2-installer-updates-x86_64
staging-sles15sp2-prod-sles15sp2-ptfs
staging-sles15sp2-prod-suse-caasp-4.5-pool-x86_64-sp2
staging-sles15sp2-prod-suse-caasp-4.5-updates-x86_64-sp2"

function _CREATEKEYS {
for ACTIVATIONKEY in $KEYS; do
        /usr/bin/spacecmd -y -- activationkey_delete 1-$ACTIVATIONKEY
	/usr/bin/spacecmd -y -- activationkey_create -n $ACTIVATIONKEY -d $ACTIVATIONKEY -b $(echo $BASECHANNEL|sed "s/-prod-/-$STAGE-/g");
	/usr/bin/spacecmd -y -- activationkey_enableconfigdeployment 1-$ACTIVATIONKEY;
        /usr/bin/spacecmd -y -- activationkey_addgroups 1-$ACTIVATIONKEY $ACTIVATIONKEY;
	if echo $ACTIVATIONKEY|grep rke; then
		/usr/bin/spacecmd -y -- activationkey_addgroups 1-$ACTIVATIONKEY rke-node
	fi
	/usr/bin/spacecmd -y -- activationkey_addchildchannels 1-$ACTIVATIONKEY $(echo $CHILDCHANNELS|sed "s/-prod-/-$STAGE-/g")
done
}

#PROD
STAGE=prod
KEYS=$PRODKEYS
_CREATEKEYS

#TEST
STAGE=test
KEYS=$TESTKEYS
_CREATEKEYS

#INT
STAGE=int
KEYS=$INTKEYS
_CREATEKEYS


