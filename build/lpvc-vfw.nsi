!include "x64.nsh"

OutFile "LongplayVideoCodec.exe"
 
RequestExecutionLevel admin

Section "install"
  SetOutPath $SYSDIR

  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\MediaResources\icm\VIDC.LPVC" "Description" "Longplay Video Codec [LPVC]"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\MediaResources\icm\VIDC.LPVC" "Driver" "lpvc-vfw.dll"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\MediaResources\icm\VIDC.LPVC" "FriendlyName" "Longplay Video Codec [LPVC]"

  # 32-bit
  File "X:\path_to_32bit_codec\lpvc-vfw.dll"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\drivers.desc" "lpvc-vfw.dll" "Longplay Video Codec [LPVC]"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Drivers32" "VIDC.LPVC" "lpvc-vfw.dll"
  
  # 64-bit
  ${DisableX64FSRedirection}
  SetRegView 64
  File "X:\path_to_64bit_codec\lpvc-vfw.dll"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\drivers.desc" "lpvc-vfw.dll" "Longplay Video Codec [LPVC]"
  WriteRegStr HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Drivers32" "VIDC.LPVC" "lpvc-vfw.dll"
SectionEnd
