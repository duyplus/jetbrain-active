software="PyCharm"
softvm="pycharm.vmoptions"
currCrackPath=$(cd `dirname $0`; pwd)
targetFilePath="${HOME}/.config"
cpDir="${targetFilePath}/JetBrains"
echo $cpDir
if [ ! -d "${cpDir}" ]; then
	mkdir -p "${cpDir}"
fi
jarFile="${currCrackPath}/ja-netfilter.jar"
plugins="${currCrackPath}/plugins-jetbrains"
config="${currCrackPath}/config-jetbrains"
if [ -f "${jarFile}" ]; then
    `cp "${jarFile}" "${cpDir}"`
    if [ ! -d "${cpDir}/plugins-jetbrains" ]; then
          `mkdir "${cpDir}/plugins-jetbrains"`
    fi
    `cp -rf ${plugins-jetbrains}/* "${cpDir}/plugins-jetbrains"`
    if [ ! -d "${cpDir}/config-jetbrains" ]; then
	`mkdir "${cpDir}/config-jetbrains"`
    fi
    `cp -rf ${config-jetbrains}/* "${cpDir}/config-jetbrains"`
else
    echo "ja-netfilter.jar is missing, ${software} crack failed!"
    exit    
fi
softwareInstall="false"
for file in `ls -a "$cpDir"`
do
      if [ -d "$cpDir/$file" ]; then
	   result=`echo $file|grep $software`
	   if [ ${result}x != ""x ];
	   then
		   softwareInstall="true"
		   echo "Success! Activate idea to 2099"
		   keyInstall="${currCrackPath}/pycharm.key"
		   cpxDir="$cpDir/$file"
		   if [ -f "${keyInstall}" ]; then
		   `cp "${keyInstall}" "${cpxDir}"`
		   fi
		   versionInstall="$cpDir/$file/$softvm"
		   if [ -f "$versionInstall" ];
		   then
			   `echo "" > "$versionInstall"`
		   else
			   `touch "$versionInstall"`
		   fi
                `echo "-javaagent:${cpDir}/ja-netfilter.jar=jetbrains" > "${versionInstall}"`
				`echo "--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED" >> "${versionInstall}"`
				`echo "--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED" >> "${versionInstall}"`  
	   fi
      fi

done
if [ "$softwareInstall" = "false" ]; then
	echo "Please start pycharm first!"
fi

