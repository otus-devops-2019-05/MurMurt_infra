#!/bin/bash

INSTALL_RUBY="install_ruby.sh"
INSTALL_MONGO="install_mongodb.sh"
DEPLOY="deploy.sh"

ORDER="$INSTALL_RUBY $INSTALL_MONGO $DEPLOY"

STARTUP_SCRIPT="startup.sh"

rm "$STARTUP_SCRIPT"
 
echo "#!/bin/bash" >> "$STARTUP_SCRIPT"
for instruction in $ORDER; do
    echo "RUN: $instruction"
    grep -v "bin\/bash" $instruction >> "$STARTUP_SCRIPT"
    echo "" >> "$STARTUP_SCRIPT"
done

chmod +x "$STARTUP_SCRIPT"
