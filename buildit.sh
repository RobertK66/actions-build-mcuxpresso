#!/bin/sh
echo "Script called with args: '$*' "
echo "************************ /usr/local/mcuxpressoide ******************"
ls -R /usr/local/mcuxpressoide
ls -R /usr/local/mcuxpressoide-11.4.0_6237

MY_IDE_PATH=/usr/local/mcuxpressoide-11.4.0_6237
MY_TOOLCHAIN_PATH=$IDE_PATH/ide/tools/bin
MY_IDE=$IDE_PATH/ide/mcuxpressoidec

echo "$MY_IDE_PATH"
echo "$MY_TOOLCHAIN_PATH"
echo "$MY_IDE"

echo "$PATH"
PATH=$PATH;$TOOLCHAIN_PATH

@REM -build on project: normal build, does a (re-)build of all targets (Release, Debug): the fact that it does a full build sounds lika an issue in Eclipse CDT 9.4.3?
"$IDE%" -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data "$GITHUB_WORKSPACE" -build $1
