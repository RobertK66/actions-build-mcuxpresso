#!/bin/sh
echo "Script called with args: '$*' "
MY_IDE_PATH=/usr/local/mcuxpressoide-11.4.0_6237
MY_TOOLCHAIN_PATH=$MY_IDE_PATH/ide/tools/bin
MY_IDE_CMD=$MY_IDE_PATH/ide/mcuxpressoide
export PATH=$PATH:$MY_TOOLCHAIN_PATH

#ls -Ral /github/workspace



echo "executing: '$MY_IDE_CMD'"

$MY_IDE_CMD -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -import $GITHUB_WORKSPACE -import $GITHUB_WORKSPACE/ado-chip-175x-6x/ado_chip_175x_6x
$MY_IDE_CMD -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -build ClimbObc/Debug -build ado_chip_175x_6x/TestConfig_2 

ls -al /github/workspace/Debug
ls -al /github/workspace/Release


echo "::set-output name=axf::/github/workspace/Debug/ClimbObc.axf"

echo "finished"
