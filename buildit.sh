#!/bin/sh
echo "Script called with args: '$*' "

projects="${1}"

for projpath in $projects; do
    echo "arg: '$projpath'"
done

MY_IDE_PATH=/usr/local/mcuxpressoide-11.4.0_6237
MY_TOOLCHAIN_PATH=$MY_IDE_PATH/ide/tools/bin
MY_IDE_CMD=$MY_IDE_PATH/ide/mcuxpressoide
export PATH=$PATH:$MY_TOOLCHAIN_PATH

#ls -Ral /github/workspace


echo "executing: '$MY_IDE_CMD'"

$MY_IDE_CMD -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -import $GITHUB_WORKSPACE/ClimbObc -import $GITHUB_WORKSPACE/ado_chip_175x_6x
$MY_IDE_CMD -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -build ado_chip_175x_6x/TestConfig_2 
$MY_IDE_CMD -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -build ClimbObc/Debug 

pwd
ls -al /github/workspace/ClimbObc/Debug
ls -al ClimbObc/Debug

echo "::set-output name=axf::ClimbObc/Debug/ClimbObc.axf"
