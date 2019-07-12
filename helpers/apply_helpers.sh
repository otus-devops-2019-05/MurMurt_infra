#!/bin/bash

#START

echo "Applying helpers..."

# adding SSH Forwarding
ssh-add ~/.ssh/appuser

# get helpers dir 
DIR="$(dirname "${BASH_SOURCE[0]}")"


echo "	Applying constants..."
source ${DIR}/constants

echo "	Applying aliases..."
source ${DIR}/aliases

echo "Done"
#END
