!define PRODUCT_NAME "Katinor Mod Server Patch Script (16.12.24)"
!define PRODUCT_VERSION "1"
!define PRODUCT_PUBLISHER "Team Croatia"
!define PRODUCT_WEB_SITE "https://github.com/kpjhg0124"

SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI.nsh"
!include "LogicLib.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "icon.ico"
BrandingText "Team Croatia"

!define MUI_WELCOMEFINISHPAGE_BITMAP "WelcomePageBitMapSub.bmp"
; Welcome page
!insertmacro MUI_PAGE_WELCOME
!define MUI_PAGE_HEADER_TEXT "Katinor Mod Server Patch Script (16.12.24)"
!define MUI_PAGE_HEADER_SUBTEXT "hoparkgo9ma"
; License page
!insertmacro MUI_PAGE_LICENSE "License.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Install Setting page
Page Custom Form
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH

; Language files
!insertmacro MUI_LANGUAGE "Korean"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

Var 'bckset'
Var 'inset'

ReserveFile "Form.ini"
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

Function .onInit
!insertmacro MUI_INSTALLOPTIONS_EXTRACT "Form.ini"
FunctionEnd

Function Form
!insertmacro MUI_INSTALLOPTIONS_DISPLAY_RETURN "Form.ini"
FunctionEnd


Name "Katinor Mod Server Patch Script (16.12.24)"
OutFile "Katinor Mod Server Patch Script (16.12.24).exe"
InstallDir "$APPDATA\.minecraft"
ShowInstDetails show

  SetOverwrite ifnewer

Section "MainSection" SEC01
  SetOutPath "$INSTDIR\Temp"
  File "javakill.cmd"
  DetailPrint "자바를 정지합니다."
  nsExec::Exec "javakill.cmd"
  goto Step1
Step1:
!insertmacro MUI_INSTALLOPTIONS_READ "$bckset" "Form.ini" "Field 3" "State"
StrCmp $bckset "1" CheckA1 CheckA2
CheckA1:
  SetOutPath "$INSTDIR\Temp"
  DetailPrint "마인크래프트 백업 시작..."
  DetailPrint "마인크래프트 유저 데이터에따라 일정 시간이 소모될 수 있습니다. (평균 2분 ~ 5분)"
  DetailPrint "기존 호박고구마 제작 패치 스크립트를 통해 백업을 진행한 경우, 해당 백업파일은 지워집"
  DetailPrint "니다."
  File "cpymc.cmd"
  nsExec::Exec "cpymc.cmd"
  RMDir /r "$APPDATA\.MCBackup\Temp"
  DetailPrint "마인크래프트 백업 완료..."
CheckA2:
  goto Step2
Step2:
!insertmacro MUI_INSTALLOPTIONS_READ "$inset" "Form.ini" "Field 2" "State"
StrCmp $inset "1" CheckB1 CheckB2
CheckB1:
  SetOutPath "$INSTDIR"
  DetailPrint "마인크래프트 완전 초기화 시작..."
  RMDir /r "$INSTDIR"
  DetailPrint "마인크래프트 완전 초기화 완료."
  goto Step3
CheckB2:
  goto Step3
Step3:
  SetOutPath "$INSTDIR\Temp"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile27.uf@26736645585DC92231F139.001" "GameLib.7z.001"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile25.uf@210AD345585DC98F29C17B.027" "GameLib.7z.027"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile25.uf@25014C45585DC9912E2B71.028" "GameLib.7z.028"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile23.uf@23729E45585DC99734B507.029" "GameLib.7z.029"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile8.uf@266CDB45585DC99B377D8D.030" "GameLib.7z.030"
  SetOutPath "$INSTDIR"
  DetailPrint "모드 적용중..."
  File "7za.exe"
  File "Extract.cmd"
  nsExec::Exec "Extract.cmd"
  DetailPrint "임시파일을 삭제하는중...."
  RMDir /r "$INSTDIR\Temp"
  Delete "7za.exe"
  Delete "Extract.exe"
  DetailPrint "완료"
  SetOutPath "$INSTDIR"
SectionEnd

Section -Post
SectionEnd