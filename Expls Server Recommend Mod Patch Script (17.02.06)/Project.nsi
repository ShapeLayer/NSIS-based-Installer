!define PRODUCT_NAME "Expls Server Recommend Mod Patch Script (17.02.06)"
!define PRODUCT_VERSION "0"
!define PRODUCT_PUBLISHER "hoparkgo9ma"
!define PRODUCT_WEB_SITE "https://github.com/kpjhg0124"

;Update type , 강제 업데이트 = Force / 사용자 정의 업데이트 = Client
!define UPDATE_TYPE "Force"
;Version.ini URL (version.ini 를 업로드한 웹사이트)
!define VERSION_URL "http://cfs.tistory.com/custom/blog/256/2565301/skin/images/nsis_expls_version.ini"
;Now File Version (현재 파일버전)
!define INST_VERSION "1"

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
!define MUI_PAGE_HEADER_TEXT "Expls Server Recommend Mod Patch Script (17.02.06)"
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
Var 'minimap'
Var 'modcheck'

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


Name "Expls Server Recommend Mod Patch Script (17.02.06)"
OutFile "Expls Server Recommend Mod Patch Script (17.02.06).exe"
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
!insertmacro MUI_INSTALLOPTIONS_READ "$bckset" "Form.ini" "Field 4" "State"
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
!insertmacro MUI_INSTALLOPTIONS_READ "$inset" "Form.ini" "Field 3" "State"
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
  ;assets
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile10.uf@214F8043589874C8325696.001" "assets.7z.001"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile6.uf@27298F40589874C43130C3.002" "assets.7z.002"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile9.uf@2563FF3C58987525083C6B.003" "assets.7z.003"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile9.uf@2414084F589874CA35D841.004" "assets.7z.004"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile30.uf@2245E748589874C00D057B.005" "assets.7z.005"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile2.uf@226CA8475898750C25F8AF.006" "assets.7z.006"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile27.uf@2357973B5898758433C5D3.007" "assets.7z.007"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile23.uf@2548083B589875880593BD.008" "assets.7z.008"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile7.uf@2633B2345898757D288167.009" "assets.7z.009"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile22.uf@2579DD335898758231269E.010" "assets.7z.010"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile2.uf@275A2933589875500DA595.011" "assets.7z.011"

  ;libraries
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile26.uf@273C7D3D58987638176011.001" "libraries.7z.001"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile2.uf@257EBC425898764B286F5E.002" "libraries.7z.002"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile2.uf@24101A475898763402E0E5.003" "libraries.7z.003"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile26.uf@25146235589876441322B7.004" "libraries.7z.004"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile28.uf@23332C3F589875B9114C30.005" "libraries.7z.005"

  ;versions
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile23.uf@222F653758A00FF109846D.7z" "versions.7z"

  SetOutPath "$INSTDIR"

  ;launcher profile
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile8.uf@2548AE3958A00F8E2FC183.json" "launcher_profiles.json"

  SetOutPath "$INSTDIR\mods"

  ;liteloader
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile5.uf@22422B42589876B404BEB5.jar" "liteloader-1.10-SNAPSHOT-release.jar"
  
  goto check_minimap_1
  
check_minimap_1:
  !insertmacro MUI_INSTALLOPTIONS_READ "$minimap" "Form.ini" "Field 7" "State"
  StrCmp $minimap "1" JM1 JM2
JM1:
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile25.uf@212DCD48589876AE272052.jar" "journeymap-1.10.2-5.2.4-unlimited.jar"
  goto check_optifine
JM2:
  goto check_minimap_2
  
check_minimap_2:
  !insertmacro MUI_INSTALLOPTIONS_READ "$minimap" "Form.ini" "Field 6" "State"
  StrCmp $minimap "1" VM1 VM2
VM1:
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile28.uf@2424CA34589876A83BE8F4.litemod" "mod_voxelMap_1.6.15_for_1.10.2.litemod"
  goto check_optifine
VM2:
  goto check_minimap_3

check_minimap_3:
  !insertmacro MUI_INSTALLOPTIONS_READ "$minimap" "Form.ini" "Field 5" "State"
  StrCmp $minimap "1" XM1 XM2
XM1:
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile28.uf@22392239589876A213590D.jar" "Xaeros_Minimap_1.9.7_Forge_1.10.2.jar"
  goto check_optifine
XM2:
  goto check_optifine

check_optifine:
  !insertmacro MUI_INSTALLOPTIONS_READ "$modcheck" "Form.ini" "Field 9" "State"
  StrCmp $modcheck "1" of1 of2
of1:
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile26.uf@23341E46589876C8071653.jar" "OptiFine_1.10.2_HD_U_C2.jar"
  SetOutPath "$INSTDIR\Temp"
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile3.uf@2331EB3E5898759B2D7F86.7z" "shaderpacks.7z"
  SetOutPath "$INSTDIR\mods"
  goto check_better_fps
of2:
  goto check_better_fps

check_better_fps:
  !insertmacro MUI_INSTALLOPTIONS_READ "$modcheck" "Form.ini" "Field 8" "State"
  StrCmp $modcheck "1" FPS1 FPS2
FPS1:
  Nsisdl::download "http://kpjhg0124.tistory.com/attachment/cfile1.uf@2470E7445898769710ED17.jar" "mods\BetterFps-1.3.2.jar"
  goto Step4
FPS2:
  goto Step4
  
Step4:
  ;Koran Chating
  Nsisdl::download "http://creos.tistory.com/attachment/cfile1.uf@242E9E4E5867634635CA41.jar" "koreanchat-creo-1.10-1.8.jar"
  
  SetOutPath "$INSTDIR\resourcepacks"
  ;Project Croatia
  Nsisdl::download "http://hoparkgo9ma.tk/attachment/cfile21.uf@276AA83D5898773F10DA75.zip" "Croatia.zip"


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