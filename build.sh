#! /bin/bash
title=$(less game.project | grep "^title = " | cut -d "=" -f2 | sed -e 's/^[[:space:]]*//')
title_no_space=$(echo -e "${title}" | tr -d '[[:space:]]')

echo "Project: ${title}"

SHA1=$(curl -s http://d.defold.com/stable/info.json | sed 's/.*sha1": "\(.*\)".*/\1/')

BOB_URL="http://d.defold.com/archive/${SHA1}/bob/bob.jar"

echo "Downloading ${BOB_URL}"
curl -o Bob.jar ${BOB_URL}

Bob() {
	java -jar Bob.jar $@
}

build() {
	platform=$1
	shift 1
	Bob --archive --texture-compression true --variant "release" --platform "${platform}" clean distclean build resolve -e a@a.com -u fake_token
}

bundle() {
	platform=$1
	echo "${platform}"
	shift 1
	Bob --platform ${platform} --bundle-output build/${platform} $@ bundle
}

archive() {
	platform=$1
	if [ "${platform}" == "armv7-android" ]
		then
			echo "${title_no_space}.apk"
			mv "build/${platform}/${title}/${title}.apk" "${title_no_space}.apk"
	elif [ "${platform}" == "armv7-darwin" ]
		then
			echo "${title_no_space}.ipa"
			mv "build/${platform}/${title}/${title}.ipa" "${title_no_space}.ipa"
	elif [ "${platform}" == "x86_64-darwin" ]
		then
			echo "${title_no_space}_${platform}.zip"
			rm -rf "${title_no_space}_${platform}.zip"
			cd "build/${platform}/${title}.app"
			zip -r -q "../${title_no_space}_${platform}.zip" *
			cd ../../..
	else
		echo "${title_no_space}_${platform}.zip"
		rm -rf "${title_no_space}_${platform}.zip"
		cd "build/${platform}/${title}"
		zip -r -q "../${title_no_space}_${platform}.zip" *
		cd ../../..
	fi
}

do_platform() {
	platform=$1
	shift 1
	echo -e "\n[Building ${platform}]"
	build ${platform}
	echo -e "\n[Bundling ${platform}]"
	bundle ${platform}
	echo -e "\n[Archiving ${platform}]"
	archive ${platform}
	echo -e "\n[${platform} Done]"
}

# build / bundle / archive platforms

do_platform x86_64-win32
do_platform x86_64-darwin
do_platform x86_64-linux