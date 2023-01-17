#!/bin/sh

#echo "Script called with args: '$*' "
projects="${1}"
configs="${2}"
resultpath="${3}"

MY_IDE_PATH=/usr/local/mcuxpressoide-11.4.0_6237
MY_TOOLCHAIN_PATH=$MY_IDE_PATH/ide/tools/bin
MY_IDE_CMD=$MY_IDE_PATH/ide/mcuxpressoide
export PATH=$PATH:$MY_TOOLCHAIN_PATH

#ls -Ral /github/workspace
#echo "executing: '$MY_IDE_CMD'"

for projpath in $projects; do
    echo "import project: '$projpath'"
    $MY_IDE_CMD -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -import $projpath
done

for buildit in $configs; do
    echo "build config: '$buildit'"
    $MY_IDE_CMD -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -build $buildit
done

pwd
#ls -al /github/workspace/ClimbObc/Debug
ls -al $resultpath

echo "axf=$resultpath" >> $GITHUB_OUTPUT
