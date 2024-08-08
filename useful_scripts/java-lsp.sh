#!/bin/bash

# Set the location of your jdtls installation
JDTLS_HOME=/home/bitwave/projects/code/jdtls

# Use the JAVA_HOME environment variable you provided earlier
JAVA_HOME=/home/bitwave/.sdkman/candidates/java/current

# Run the Java Language Server (jdtls) with the appropriate parameters
$JAVA_HOME/bin/java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  -jar $JDTLS_HOME/plugins/org.eclipse.equinox.launcher_*.jar \
  -configuration $JDTLS_HOME/config_linux \
  -data /home/bitwave/projects/java_workspace \
  "$@"

