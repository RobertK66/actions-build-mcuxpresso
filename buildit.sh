#!/bin/sh
echo "Script called with args: '$*' "
MY_IDE_PATH=/usr/local/mcuxpressoide-11.4.0_6237
MY_TOOLCHAIN_PATH=$IDE_PATH/ide/tools/bin
MY_IDE_CMD=$IDE_PATH/ide/mcuxpressoide

echo "MY_IDE_PATH: '$MY_IDE_PATH'"
echo "MY_TOOLCHAIN_PATH: '$MY_TOOLCHAIN_PATH'"
echo "MY_IDE_CMD: $MY_IDE_CMD"

echo "vorher: $PATH"
PATH=$PATH;$TOOLCHAIN_PATH
echo "nachher: $PATH"

echo "executing $MY_IDE_CMD"
$MY_IDE_CMD -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data "$GITHUB_WORKSPACE" -build $1

echo "finished"
