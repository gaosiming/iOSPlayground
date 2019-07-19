source ~/.bash_profile

 #获取项目路径
 PROJECT_DIR=$(cd `dirname $0`;cd ..;pwd)
 cd ${PROJECT_DIR}

 buildPath="${PROJECT_DIR}/oclint/build"
 compilecommandsJsonFolderPath="${PROJECT_DIR}/oclint"
 compilecommandsJsonFilePath="${PROJECT_DIR}/oclint/compile_commands.json"

 rm -rf "$compilecommandsJsonFolderPath/build"


cd ${SRCROOT}
cd $compilecommandsJsonFolderPath
xcodebuild clean
xcodebuild  -workspace iOSPlayground.xcworkspace -scheme iOSPlayground SYMROOT=$buildPath | xcpretty -r json-compilation-database --output $compilecommandsJsonFilePath
oclint-json-compilation-database -v \
-e Pods \
-e AFNetworking \
-e Bugly \
-e CocoaLumberjack \
-e Masonry \
-e SDWebImage \
-e YYKit \
-rc SHORT_VARIABLE_NAME=10
oclint_args -- -report-type xcode \
exit
