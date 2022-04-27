# Githooks
Prepare githooks

## Example without rosetta:

echo "arch" > ProjectSetupAndUpgrade.sh
arch -arm64 /bin/bash ./ProjectSetupAndUpgrade.sh 

## Example with rosetta:

echo "arch" > ProjectSetupAndUpgrade.shbuild.sh
arch -x86_64 /bin/bash ./ProjectSetupAndUpgrade.sh
