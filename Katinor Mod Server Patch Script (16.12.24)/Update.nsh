Function Update
;Download version.ini
NSISdl::download "${VERSION_URL}" "$PLUGINSDIR\version.ini"

;Read INI Str , Field 1 = version // Field 2 = New version URL
ReadINIStr $0 "$PLUGINSDIR\version.ini" "Field 1" "State"
ReadINIStr $1 "$PLUGINSDIR\version.ini" "Field 2" "State"

;Check Update Type , Force / Client
${If} ${UPDATE_TYPE} == "Force"
	Goto Force
${Else}
	Goto Client
${EndIf}

;Force or Client Update
Force:
	StrCmp $0 ${INST_VERSION} NONEWER FORCENEW

	FORCENEW:
		MessageBox MB_OK "새로운 버전이 발견되었습니다!$\n원활한 서버 접속을 위해 업데이트 됩니다."
		NSISdl::download "$1" "$EXEDIR\Newversion.exe"
		Exec "$EXEDIR\Newversion.exe"
		Quit

Client:
	StrCmp $0 ${INST_VERSION} NONEWER CLIENTNEW
	CLIENTNEW:
		MessageBox MB_YESNO "New version release!$\nDownload new version?" IDNO NONEWER
		NSISdl::download "$1" "$EXEDIR\Newversion.exe"
		MessageBox MB_OK "Download Sucess!$\nStart new version."
		Exec "$EXEDIR\Newversion.exe"
		Quit

NONEWER:
FunctionEnd