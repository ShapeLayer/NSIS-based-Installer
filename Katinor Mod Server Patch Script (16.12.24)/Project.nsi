!define PRODUCT_NAME "Katinor Mod Server Patch Script (16.12.31)"
!define PRODUCT_VERSION "3"
!define PRODUCT_PUBLISHER "hoparkgo9ma"
!define PRODUCT_WEB_SITE "https://github.com/kpjhg0124"

;Update type , 강제 업데이트 = Force / 사용자 정의 업데이트 = Client
!define UPDATE_TYPE "Force"
;Version.ini URL (version.ini 를 업로드한 웹사이트)
!define VERSION_URL "http://cfs.tistory.com/custom/blog/256/2565301/skin/images/nsis_katinor_version.ini"
;Now File Version (현재 파일버전)
!define INST_VERSION "3"

SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI.nsh"
!include "LogicLib.nsh"
!include "Update.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "icon.ico"
BrandingText "hoparkgo9ma"

!define MUI_WELCOMEFINISHPAGE_BITMAP "WelcomePageBitMapSub.bmp"
; Welcome page
!insertmacro MUI_PAGE_WELCOME
!define MUI_PAGE_HEADER_TEXT "Katinor Mod Server Patch Script (16.12.31)"
!define MUI_PAGE_HEADER_SUBTEXT "By hoparkgo9ma"
; License page
!insertmacro MUI_PAGE_LICENSE "README.txt"
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

InitPluginsDir
;Call (Update Check) Funtion
Call Update

FunctionEnd

Function Form
!insertmacro MUI_INSTALLOPTIONS_DISPLAY_RETURN "Form.ini"
FunctionEnd


Name "Katinor Mod Server Patch Script (16.12.31)"
OutFile "Katinor Mod Server Patch Script (16.12.31).exe"
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
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile25.uf@2320B235585E0F370F0E99.001" "assets.7z.001"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile25.uf@257B5B35585E0F3C2C1B97.002" "assets.7z.002"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile30.uf@22307F35585E0F4003B124.003" "assets.7z.003"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile26.uf@2208D735585E0F4520C689.004" "assets.7z.004"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile8.uf@22189635585E0F4A17F6C5.005" "assets.7z.005"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile5.uf@22284935585E0F510A7F8F.006" "assets.7z.006"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile10.uf@212EBA35585E0F5505B02E.007" "assets.7z.007"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile5.uf@24789735585E0F592F46E0.008" "assets.7z.008"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile30.uf@22320235585E0F5B02227F.009" "assets.7z.009"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile7.uf@241E3035585E0F5F127528.010" "assets.7z.010"
  
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile27.uf@2678CA35585E0F6329708B.001" "libraries.7z.001"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile2.uf@2203B135585E0F6A269374.002" "libraries.7z.002"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile29.uf@221F4B35585E0F6E11742F.003" "libraries.7z.003"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile25.uf@2604D835585E0F7425EBF4.004" "libraries.7z.004"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile10.uf@2673C535585E0F7A33030B.005" "libraries.7z.005"

  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile6.uf@22701335585E0F7C3630BC.001" "mods.7z.001"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile9.uf@25304835585E0F8104A749.002" "mods.7z.002"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile6.uf@227E8E35585E0F85298A90.003" "mods.7z.003"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile9.uf@272F5035585E0F89056903.004" "mods.7z.004"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile28.uf@27042F35585E0F8E269487.005" "mods.7z.005"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile1.uf@2272B035585E0F92352C03.006" "mods.7z.006"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile1.uf@26222E35585E0F960F9627.007" "mods.7z.007"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile27.uf@242EA335585E0F9B060C86.008" "mods.7z.008"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile7.uf@252D9F35585E0FA0076A7B.009" "mods.7z.009"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile4.uf@2173AC35585E0FA4335583.010" "mods.7z.010"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile6.uf@227BFD35585E0FAB2C04A3.011" "mods.7z.011"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile9.uf@2122B435585E0FB00FFE92.012" "mods.7z.012"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile21.uf@21781335585E0FB431EF50.013" "mods.7z.013"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile23.uf@24291D35585E0FB80B8DC1.014" "mods.7z.014"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile7.uf@2431C135585E0FBA03EE73.015" "mods.7z.015"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile25.uf@2278CA35585E0FBE2A4074.016" "mods.7z.016"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile3.uf@217C0B35585E0FC22DDF9F.017" "mods.7z.017"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile4.uf@2479CC35585E0FC72F49C4.018" "mods.7z.018"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile26.uf@2204A335585E0FCB24AE61.019" "mods.7z.019"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile29.uf@2204D835585E0FD026A914.020" "mods.7z.020"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile10.uf@27304835585E0FD4057671.021" "mods.7z.021"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile29.uf@2425F335585E0FDB0D0729.022" "mods.7z.022"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile7.uf@252F5035585E0FDF06B424.023" "mods.7z.023"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile10.uf@21189635585E0FE4199A3F.024" "mods.7z.024"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile7.uf@242D9F35585E0FE808963F.025" "mods.7z.025"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile21.uf@250F3A35585E0FEC1F6175.026" "mods.7z.026"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile10.uf@27721935585E0FF0373D16.027" "mods.7z.027"

  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile4.uf@25320235585E0FF204E9A6.7z" "shaderpacks.7z"

  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile7.uf@23291D35585E0FF20CCD63.7z" "versions.7z"

  SetOutPath "$INSTDIR"
  
  DetailPrint "모드 적용중..."
  File "7za.exe"
  File "Extract.cmd"

  nsExec::Exec "Extract.cmd"

  ;161231 Update
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile22.uf@262D934B5866F1871DAA48.jar" "$INSTDIR\mods\BetterStorage-1.7.10-0.13.1.126.jar"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile22.uf@2431B44B5866F1881BF549.jar" "$INSTDIR\mods\ironchest-1.7.10-6.0.62.742-universal.jar"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile22.uf@2232444B5866F188180BBC.jar" "$INSTDIR\mods\OpenModularTurrets-1.7.10-2.2.8-231.jar"

  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile10.uf@2605674E5866F57A169CB4.001" "$INSTDIR\Temp\update161231.7z.001"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile7.uf@257A1E4E5866F57B1B8B73.002" "$INSTDIR\Temp\update161231.7z.002"

  File "extract161231.cmd"
  nsExec::Exec "extract161231.cmd"
  nsExec::Exec "mods\update161231.cmd"
  ;161231 Update End
  
  DetailPrint "임시파일을 삭제하는중...."
  RMDir /r "$INSTDIR\Temp"
  ;Delete "7za.exe"
  ;Delete "Extract.exe"
  DetailPrint "완료"
  SetOutPath "$INSTDIR"
SectionEnd

Section -Post
SectionEnd