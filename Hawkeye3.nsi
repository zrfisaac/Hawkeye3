; # [ zrfisaac ]

; # [ about ]
; # - author : Isaac Santana
; # . - email : zrfisaac@gmail.com
; # . - site : zrfisaac.github.io

; # [ nsis ]

; # : Libraries
!include "MUI2.nsh"
!include "x64.nsh"

; # : General
Name "Hawkeye3 3.2.0.0"
OutFile "output\Hawkeye3 3.2.0.0.exe"
Unicode True
InstallDir "$PROGRAMFILES\Hawkeye3"
InstallDirRegKey HKLM "SOFTWARE\Hawkeye3" ""
RequestExecutionLevel Admin

; # - Pictures
!define MUI_ICON "picture\Laure\hawkeye.ico"
!define MUI_UNICON "picture\Laure\hawkeye.ico"
;!define MUI_HEADERIMAGE
;!define MUI_HEADERIMAGE_RIGHT
;!define MUI_HEADERIMAGE_BITMAP "Pictures\InstallerHeader.bmp"
;!define MUI_WELCOMEFINISHPAGE_BITMAP "Pictures\InstallerBanner.bmp"
;!define MUI_HEADERIMAGE_UNBITMAP  "Pictures\UninstallerHeader.bmp"
;!define MUI_UNWELCOMEFINISHPAGE_BITMAP "Pictures\UninstallerBanner.bmp"

; # - Shortcuts
!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "$(MUI_Shortcut)"
!define MUI_FINISHPAGE_RUN_FUNCTION "fnShortcut"
Function "fnShortcut"
	CreateShortcut "$DESKTOP\Hawkeye3.lnk" "$INSTDIR\Hawkeye.exe" "" "$INSTDIR\hawkeye.ico"
FunctionEnd

; # - Interface
!define MUI_ABORTWARNING

; # - Page - Installer
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; # - Page - Uninstaller
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; # - Language
!insertmacro MUI_LANGUAGE "PortugueseBR"
Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

; # - Version
VIProductVersion "3.2.0.0"
VIAddVersionKey "ProductName" "Hawkeye3"
VIAddVersionKey "Comments" ""
VIAddVersionKey "CompanyName" "Borland"
VIAddVersionKey "LegalTrademarks" "Borland"
VIAddVersionKey "LegalCopyright" "Borland"
VIAddVersionKey "FileDescription" "Hawkeye3"
VIAddVersionKey "FileVersion" "3.2.0.0"
VIAddVersionKey "ProductVersion" "3.2.0.0"

; # - Translation
LangString MUI_Shortcut ${LANG_PORTUGUESEBR} "Criar atalho na área de trabalho"

; # - Installer - Hawkeye3
Section Hawkeye3
	; # : - Required
	SectionIn RO

	; # : - Files
	SetOutPath "$INSTDIR"
	File /r "binary\release\*.*"
	File "picture\Laure\hawkeye.ico"

	; # : - Uninstaller
	WriteUninstaller "$INSTDIR\Uninstall.exe"

	; # : - Shortcuts
	CreateDirectory "$SMPROGRAMS\"
	CreateShortcut "$SMPROGRAMS\Hawkeye3.lnk" "$INSTDIR\Hawkeye.exe" "" "$INSTDIR\hawkeye.ico"

	; # : - Control Panel
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye3" "DisplayName" "Hawkeye3 3.2.0.0"
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye3" "UninstallString" "$\"$INSTDIR\Uninstall.exe$\""
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye3" "QuietUninstallString" "$\"$INSTDIR\Uninstall.exe$\" /S"
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye3" "InstallLocation" "$\"$INSTDIR$\""
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye3" "DisplayIcon" "$\"$INSTDIR\hawkeye.ico$\""
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye3" "Publisher" "Isaac Santana / zrfisaac.github.io"
	WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye3" "DisplayVersion" "3.2.0.0"
	WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye3" "VersionMajor" 3
	WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye3" "VersionMinor" 2
	WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye3" "NoModify" 0
	WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye3" "NoRepair" 0
	WriteRegDWORD HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye3" "EstimatedSize" 46227 ;KB
SectionEnd

; # - Uninstaller - Hawkeye3
Section Un.Hawkeye3
	; # : - Required
	SectionIn RO

	; # : - Files
	Delete "$INSTDIR\*.*"
	RMDir /r "$INSTDIR"

	; # : - Shortcuts
	Delete "$INSTDIR\Hawkeye3.lnk"
	Delete "$SMPROGRAMS\Hawkeye3.lnk"

	; # : - Registry
	DeleteRegKey HKLM "SOFTWARE\Hawkeye3"
	DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Hawkeye3"
SectionEnd
