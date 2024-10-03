; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

; make sure to adapt this path to your system before building the installer
#define AppName "OpenXR-MotionCompensation"
#define AppVersion GetFileVersion("..\bin\x64\Release\XR_APILAYER_NOVENDOR_motion_compensation.dll")
#define AppPublisher "oxrmc@mailbox.org"
#define AppURL "https://github.com/BuzzteeBear/OpenXR-MotionCompensation"
#define AppId "{A6E4E3AB-454E-4B79-BDCD-A11B4E1AAF4D}"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
AppId={{#AppId}
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
DefaultDirName={commonpf}\{#AppName}
DefaultGroupName={#AppName}
DisableProgramGroupPage=yes
DisableDirPage=auto
LicenseFile={#SourcePath}\..\installer\Disclaimer.txt
OutputDir={#SourcePath}\..\bin\Installer
OutputBaseFilename=Install_{#AppName}_{#AppVersion}
SetupIconFile={#SourcePath}\..\installer\{#AppName}.ico
UninstallDisplayIcon={#SourcePath}\..\installer\{#AppName}.ico 
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible  
Compression=lzma
SolidCompression=yes
WizardStyle=modern
SetupLogging=yes
UsedUserAreasWarning=no
UsePreviousTasks=yes

[Tasks]
Name: "x86"; Description: "{cm:x86Description}"; Flags: unchecked

[Files]
Source: "{#SourcePath}\..\configuration\{#AppName}.ini"; DestDir: "{localappdata}\{#AppName}"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "{#SourcePath}\..\changelog.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\..\docs\Readme.html"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\..\docs\Readme.html"; DestDir: "{localappdata}\{#AppName}"; Flags: ignoreversion
Source: "{#SourcePath}\..\scripts\Trace_{#AppName}.wprp"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\..\bin\x64\Release\XR_APILAYER_NOVENDOR_motion_compensation.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\..\XR_APILAYER_NOVENDOR_motion_compensation\XR_APILAYER_NOVENDOR_motion_compensation.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\..\bin\Win32\Release\XR_APILAYER_NOVENDOR_motion_compensation_32.dll"; DestDir: "{app}"; Flags: ignoreversion; Tasks: x86
Source: "{#SourcePath}\..\XR_APILAYER_NOVENDOR_motion_compensation\XR_APILAYER_NOVENDOR_motion_compensation_32.json"; DestDir: "{app}"; Flags: ignoreversion; Tasks: x86
Source: "{#SourcePath}\..\bin\x64\Release\MmfReader\app.publish\MmfReader.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\OXRMC MMF Reader"; Filename: "{app}\MmfReader.exe"; WorkingDir: "{app}"

[Registry]
Root: HKLM; Subkey: "SOFTWARE\Khronos\OpenXR\1\ApiLayers\Implicit"; ValueName: "{app}\XR_APILAYER_NOVENDOR_motion_compensation.json"; ValueType: dword; ValueData: 0; Flags: createvalueifdoesntexist uninsdeletevalue; BeforeInstall: RemoveRegEntries(true); AfterInstall: ReorderApiLayerRegEntries(true)
Root: HKLM; Subkey: "SOFTWARE\WOW6432Node\Khronos\OpenXR\1\ApiLayers\Implicit"; ValueName: "{app}\XR_APILAYER_NOVENDOR_motion_compensation_32.json"; ValueType: dword; ValueData: 0; Flags: createvalueifdoesntexist uninsdeletevalue; Tasks: x86; BeforeInstall: RemoveRegEntries(false); AfterInstall: ReorderApiLayerRegEntries(false)

[INI]
; [startup]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "startup"; Key: "enabled"; String: "1"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "startup"; Key: "physical_enabled"; String: "1"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "startup"; Key: "overlay_enabled"; String: "1"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "startup"; Key: "physical_early_init"; String: "0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "startup"; Key: "auto_activate"; String: "0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "startup"; Key: "auto_activate_delay"; String: "10"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "startup"; Key: "auto_activate_countdown"; String: "1"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "startup"; Key: "compensate_controllers"; String: "0"; Flags: createkeyifdoesntexist

; [tracker]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "type"; String: "controller"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "side"; String: "left"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "connection_timeout"; String: "3.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "connection_check"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "offset_forward"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "offset_down"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "offset_right"; String: "0.0"; Flags: createkeyifdoesntexist 
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "offset_yaw_angle"; String: "0.0"; Flags: createkeyifdoesntexist 
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "constant_pitch_angle"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "legacy_mode"; String: "0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "non_neutral_calibration"; String: "1"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "load_ref_pose_from_file"; String: "0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_x"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_y"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_z"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_a"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_b"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_c"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_d"; String: "0.0"; Flags: createkeyifdoesntexist 
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_x_oc"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_y_oc"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_z_oc"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_a_oc"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_b_oc"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_c_oc"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_d_oc"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "marker_size"; String: "10.0"; Flags: createkeyifdoesntexist

; [translation_filter]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "translation_filter"; Key: "strength"; String: "0.50"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "translation_filter"; Key: "order"; String: "2"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "translation_filter"; Key: "vertical_factor"; String: "1.0"; Flags: createkeyifdoesntexist

; [rotation_filter]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "rotation_filter"; Key: "strength"; String: "0.50"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "rotation_filter"; Key: "order"; String: "2"; Flags: createkeyifdoesntexist

; [input_stabilizer]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "input_stabilizer"; Key: "enabled"; String: "0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "input_stabilizer"; Key: "strength"; String: "0.5"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "input_stabilizer"; Key: "roll"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "input_stabilizer"; Key: "pitch"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "input_stabilizer"; Key: "yaw"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "input_stabilizer"; Key: "surge"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "input_stabilizer"; Key: "sway"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "input_stabilizer"; Key: "heave"; String: "1.0"; Flags: createkeyifdoesntexist

; [pose_modifier]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "pose_modifier"; Key: "enabled"; String: "0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "pose_modifier"; Key: "tracker_roll"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "pose_modifier"; Key: "tracker_pitch"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "pose_modifier"; Key: "tracker_yaw"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "pose_modifier"; Key: "tracker_surge"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "pose_modifier"; Key: "tracker_sway"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "pose_modifier"; Key: "tracker_heave"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "pose_modifier"; Key: "hmd_roll"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "pose_modifier"; Key: "hmd_pitch"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "pose_modifier"; Key: "hmd_yaw"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "pose_modifier"; Key: "hmd_surge"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "pose_modifier"; Key: "hmd_sway"; String: "1.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "pose_modifier"; Key: "hmd_heave"; String: "1.0"; Flags: createkeyifdoesntexist

; [cache]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "cache"; Key: "use_eye_cache"; String: "0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "cache"; Key: "tolerance"; String: "500.0"; Flags: createkeyifdoesntexist

; [shortcuts]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "activate"; String: "CTRL+INS"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "calibrate"; String: "CTRL+DEL"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "translation_increase"; String: "CTRL+PLUS"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "translation_decrease"; String: "CTRL+MINUS"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "rotation_increase"; String: "CTRL+0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "rotation_decrease"; String: "CTRL+9"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "toggle_stabilizer"; String: "CTRL+BACKSLASH"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "stabilizer_increase"; String: "CTRL+CLOSEBRACKET"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "stabilizer_decrease"; String: "CTRL+OPENBRACKET"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "offset_forward"; String: "CTRL+UP"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "offset_back"; String: "CTRL+DOWN"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "offset_up"; String: "CTRL+PGUP"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "offset_down"; String: "CTRL+PGDN"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "offset_right"; String: "CTRL+RIGHT"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "offset_left"; String: "CTRL+LEFT"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "rotate_right"; String: "CTRL+PERIOD"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "rotate_left"; String: "CTRL+COMMA"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "toggle_overlay"; String: "CTRL+D"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "toggle_overlay_passthrough"; String: "CTRL+SHIFT+D"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "toggle_cache"; String: "CTRL+E"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "fast_modifier "; String: "ALT"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "toggle_pose_modifier"; String: "CTRL+P"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "save_config"; String: "CTRL+SHIFT+S"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "save_config_app"; String: "CTRL+SHIFT+A"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "reload_config"; String: "CTRL+SHIFT+L"; Flags: createkeyifdoesntexist  
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "toggle_verbose_logging"; String: "CTRL+SHIFT+SEMICOLON"; Flags: createkeyifdoesntexist   
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "toggle_recording"; String: "CTRL+SHIFT+PERIOD"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "log_tracker_pose"; String: "CTRL+SHIFT+T"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "log_interaction_profile"; String: "CTRL+SHIFT+I"; Flags: createkeyifdoesntexist 

; [debug]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "debug"; Key: "log_verbose"; String: "0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "debug"; Key: "record_stabilizer_samples"; String: "0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "debug"; Key: "testrotation"; String: "0"; Flags: createkeyifdoesntexist

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
SelectDirBrowseLabel=To continue, click Next. If you would like to select a different folder, click Browse.%n%nUSING A SUBDIRECTORY OF THE WINDOWS PROGRAM FILES FOLDER IS STRONGLY RECOMMENDED!

[CustomMessages]
x86Description=[Optional]: Add support for 32-bit/x86 applications.%n      (This is only required for older applications not coming with an x64 executable)

[Code]
// Helper
function EndsWith(SubText, Text: string): boolean;
var
  EndStr: string;
begin
  EndStr := Copy(Text, Length(Text) - Length(SubText) + 1, Length(SubText));
  // case insensitive comparison
  Result := SameStr(SubText, EndStr);
end;

function StartsWith(Prefix, Text: string) : boolean;
begin
  Result := pos(Prefix, Text) = 1
end;

// Wizard customization
procedure InitializeWizard;
begin
    CreateOutputMsgMemoPage(wpLicense, 'Changelog', 'Version {#AppVersion}' , '', ''
    #define FileLine
    #define FileHandle
    #sub ProcessFileLine
      #emit '    + ''' + FileLine + ''' + #13#10'
    #endsub
    #for {FileHandle = FileOpen("..\Changelog.txt"); \
      FileHandle && !FileEof(FileHandle); FileLine = FileRead(FileHandle)} \
      ProcessFileLine
    #if FileHandle
      #expr FileClose(FileHandle)
    #endif
    );
end;

// Install 
procedure RemoveRegEntries(x64: boolean);
var
  Names: TArrayOfString;
  Name,Path: string;
  I: Integer;
begin 
  if x64 then
  begin
	Path := 'SOFTWARE\Khronos\OpenXR\1\ApiLayers\Implicit'
  end
  else
  begin
	Path := 'SOFTWARE\WOW6432Node\Khronos\OpenXR\1\ApiLayers\Implicit'
  end; 
  
  if RegDeleteValue(HKLM, Path, '') then
  begin
    Log(Format('Deleted registry key: %s', ['Computer\HKEY_LOCAL_MACHINE' + Path + '\(Default)'] ));
  end; 
  if RegGetValueNames(HKLM, Path, Names)then
  begin
    for I := 0 to GetArrayLength(Names) - 1 do
    begin
      Name := Names[I];
      if (EndsWith('XR_APILAYER_NOVENDOR_motion_compensation.json', Name) OR EndsWith('XR_APILAYER_NOVENDOR_motion_compensation_32.json', Name))
        AND NOT StartsWith(ExpandConstant('{app}') + '\XR_APILAYER_NOVENDOR_motion_compensation', Name) then
      begin
        if RegDeleteValue(HKLM, Path, Name) then
        begin
          Log(Format('Deleted old registry key: %s', ['Computer\HKEY_LOCAL_MACHINE' + Path + '\' + Name] ));
        end
        else
        begin
          MsgBox('Unable to delete old registry key: Computer\HKEY_LOCAL_MACHINE ' + Path + '\' + Name, mbError, MB_OK);
        end;
      end;
    end;
  end;
end;

procedure MoveLegacyConfigFiles();
var
  FindRec: TFindRec;
  SrcPath, DstPath, SrcFile, DstFile: string;
  Moved: boolean;
begin
  Moved := false;
  SrcPath := ExpandConstant('{app}\');
  DstPath := ExpandConstant('{localappdata}\{#AppName}\');
  if not DirExists(DstPath) then 
  begin
     if not ForceDirectories(DstPath) then
     begin
       MsgBox('Unable to create directory ' + DstPath,  mbError, MB_OK);
     end;
  end;
  if FindFirst(SrcPath + '\*', FindRec) then
  begin
    try
      repeat
        if EndsWith('.ini', Lowercase(FindRec.Name)) then
        begin
          if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0 then
          begin
            SrcFile := SrcPath + FindRec.Name;
            DstFile := DstPath + FindRec.Name;
            if FileCopy(SrcFile, DstFile, false) then
            begin 
              Log(Format('Moved config file %s to %s', [FindRec.Name, DstPath] ));
              DeleteFile(SrcFile);
              Moved := true;
            end
            else
            begin
              MsgBox('Unable to move existing config file ' + SrcFile + ' to ' + DstFile,  mbError, MB_OK);
            end;                          
          end;
        end;
      until not FindNext(FindRec);
    finally
      FindClose(FindRec);
    end;
  end;
  if Moved then
  begin
  MsgBox('Moved existing config files from ' + SrcPath + ' to ' + DstPath,  mbInformation, MB_OK);
  end;
end;

procedure ReorderApiLayerRegEntries(x64: boolean);
var
  Names: TArrayOfString;
  Name, Path, EyeTrackersKey, QuadViewsKey, ToolkitKey, LeapMotionKey, VarjoFoveatedKey: string;
  I: Integer;
  Value: Cardinal;
begin
  ToolkitKey := '';
  LeapMotionKey := '';
  if x64 then
  begin
	Path := 'SOFTWARE\Khronos\OpenXR\1\ApiLayers\Implicit'
  end
  else
  begin
	Path := 'SOFTWARE\WOW6432Node\Khronos\OpenXR\1\ApiLayers\Implicit'
  end; 
  if RegGetValueNames(HKLM, Path, Names)then
  begin
    for I := 0 to GetArrayLength(Names) - 1 do
    begin
      Name := Names[I];
      if EndsWith('OpenXR-Eye-Trackers\openxr-api-layer.json', Name) then
      begin
        EyeTrackersKey := Name;
      end;
      if EndsWith('OpenXR-Quad-Views-Foveated\openxr-api-layer.json', Name) then
      begin
        QuadViewsKey := Name;
      end;
      if EndsWith('XR_APILAYER_NOVENDOR_toolkit.json', Name) or EndsWith('XR_APILAYER_MBUCCHIA_toolkit.json', Name) then
      begin
        ToolkitKey := Name;
      end;
      if EndsWith('UltraleapHandTracking.json', Name) then
      begin
        LeapMotionKey := Name;
      end;
      if EndsWith('XR_APILAYER_MBUCCHIA_varjo_foveated.json', Name) then
      begin
        VarjoFoveatedKey := Name;
      end;
    end;
    if EyeTrackersKey <> '' then
    begin
      if RegQueryDWordValue(HKLM, Path, EyeTrackersKey, Value) then
      begin
        if RegDeleteValue(HKLM, Path, EyeTrackersKey) and RegWriteDWordValue(HKLM, Path, EyeTrackersKey, Value) then
        begin
          Log(Format('Recreated registry key: %s = %d', ['Computer\HKEY_LOCAL_MACHINE' + Path + '\' +EyeTrackersKey, Value]));
        end
        else
        begin
          MsgBox('Unable to recreate registry key: Computer\HKEY_LOCAL_MACHINE ' + Path + '\' +EyeTrackersKey, mbError, MB_OK);
        end;
      end
      else
      begin
        MsgBox('Unable to read registry key value: Computer\HKEY_LOCAL_MACHINE ' + Path + '\' + EyeTrackersKey, mbError, MB_OK);
      end;
    end;
    if QuadViewsKey <> '' then
    begin
      if RegQueryDWordValue(HKLM, Path, QuadViewsKey, Value) then
      begin
        if RegDeleteValue(HKLM, Path, QuadViewsKey) and RegWriteDWordValue(HKLM, Path, QuadViewsKey, Value) then
        begin
          Log(Format('Recreated registry key: %s = %d', ['Computer\HKEY_LOCAL_MACHINE' + Path + '\' +QuadViewsKey, Value]));
        end
        else
        begin
          MsgBox('Unable to recreate registry key: Computer\HKEY_LOCAL_MACHINE ' + Path + '\' +QuadViewsKey, mbError, MB_OK);
        end;
      end
      else
      begin
        MsgBox('Unable to read registry key value: Computer\HKEY_LOCAL_MACHINE ' + Path + '\' + QuadViewsKey, mbError, MB_OK);
      end;
    end;
    if ToolkitKey <> '' then
    begin
      if RegQueryDWordValue(HKLM, Path, ToolkitKey, Value) then
      begin
        if RegDeleteValue(HKLM, Path, ToolkitKey) and RegWriteDWordValue(HKLM, Path, ToolkitKey, Value) then
        begin
          Log(Format('Recreated registry key: %s = %d', ['Computer\HKEY_LOCAL_MACHINE' + Path + '\' +ToolkitKey, Value]));
          if LeapMotionKey <> '' then
          begin
            if RegQueryDWordValue(HKLM, Path, LeapMotionKey, Value) then
            begin
              if RegDeleteValue(HKLM, Path, LeapMotionKey) and RegWriteDWordValue(HKLM, Path, LeapMotionKey, Value) then
              begin
                Log(Format('Recreated registry key: %s = %d', ['Computer\HKEY_LOCAL_MACHINE' + Path + '\' +LeapMotionKey, Value]));
              end
              else
              begin
                MsgBox('Unable to recreate registry key: Computer\HKEY_LOCAL_MACHINE ' + Path + '\' +LeapMotionKey, mbError, MB_OK);
              end;
            end
            else
            begin
              MsgBox('Unable to read registry key value: Computer\HKEY_LOCAL_MACHINE ' + Path + '\' + LeapMotionKey, mbError, MB_OK);
            end;
          end;
        end
        else
        begin
          MsgBox('Unable to recreate registry key: Computer\HKEY_LOCAL_MACHINE ' + Path + '\' +ToolkitKey, mbError, MB_OK);
        end;
      end
      else
      begin
        MsgBox('Unable to read registry key value: Computer\HKEY_LOCAL_MACHINE ' + Path + '\' +ToolkitKey, mbError, MB_OK);
      end;
    end;
    if VarjoFoveatedKey <> '' then
    begin
      if RegQueryDWordValue(HKLM, Path, VarjoFoveatedKey, Value) then
      begin
        if RegDeleteValue(HKLM, Path, VarjoFoveatedKey) and RegWriteDWordValue(HKLM, Path, VarjoFoveatedKey, Value) then
        begin
          Log(Format('Recreated registry key: %s = %d', ['Computer\HKEY_LOCAL_MACHINE' + Path + '\' +VarjoFoveatedKey, Value]));
        end
        else
        begin
          MsgBox('Unable to recreate registry key: Computer\HKEY_LOCAL_MACHINE ' + Path + '\' +VarjoFoveatedKey, mbError, MB_OK);
        end;
      end
      else
      begin
        MsgBox('Unable to read registry key value: Computer\HKEY_LOCAL_MACHINE ' + Path + '\' + VarjoFoveatedKey, mbError, MB_OK);
      end;
    end;
  end;
end;

procedure AppendStringToRegValue(const RootKey: integer; const SubKeyName, ValueName, StringToAppend: string);
var
  OldValue, NewValue: string;  
  RootKeyString: string;
begin
  case RootKey of
    HKLM: 
      RootKeyString := 'Computer\HKEY_LOCAL_MACHINE';
    HKCU: 
      RootKeyString := 'Computer\HKEY_CURRENT_USER';
  else 
    RootKeyString := 'RootKey ' + IntToStr(RootKey);
  end;

  if RegQueryStringValue( RootKey, SubKeyName, ValueName, OldValue ) then
  begin
    NewValue := OldValue + StringToAppend
    if RegWriteStringValue( RootKey, SubKeyName, ValueName, NewValue ) then
    begin
      Log('Updated ' + RootKeyString + '\' + SubKeyName + '\' + ValueName + '. New Value = [' + NewValue + '].')
    end
    else
    begin
      Log('Could not write to ' + RootKeyString + '\' + SubKeyName + '\' + ValueName + '. Value remains [' + OldValue + '].' )
    end;
  end
  else
    Log('Could not read from ' + RootKeyString + '\' + SubKeyName + '\' + ValueName + '.' );
end;

function FileReplaceString(const FileName, SearchString, ReplaceString: string):boolean;
var
  MyFile : TStrings;
  MyText : string;
begin
  MyFile := TStringList.Create;

  try
    result := true;

    try
      MyFile.LoadFromFile(FileName);
      MyText := MyFile.Text;

      { Only save if text has been changed. }
      if StringChangeEx(MyText, SearchString, ReplaceString, True) > 0 then
      begin;
        MyFile.Text := MyText;
        MyFile.SaveToFile(FileName);
      end;
    except
      result := false;
    end;
  finally
    MyFile.Free;
  end;
end;

procedure OpenUserGuide();
var
  ErrorCode: Integer;
  FilePath: string;
begin
  if MsgBox(ExpandConstant('Do you want to open the user guide?'), mbConfirmation, MB_YESNO) = IDYES then
  begin
    FilePath := ExpandConstant('{app}\Readme.html');
    if not ShellExec('open', 'file:///' + FilePath, '', '', SW_SHOW, ewNoWait, ErrorCode) then
    begin
      MsgBox('Unable to open ' + FilePath + '. ErrorCode: ' + Format('%d',[ErrorCode]), mbError, MB_OK);
    end;
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  UninstallSubKeyName:  string;
begin
  if(CurStep = ssInstall) then 
  begin 
    MoveLegacyConfigFiles(); 
  end;
  if(CurStep = ssPostInstall) then 
  begin
    // delete legacy power shell (un)install scripts
    DeleteFile(ExpandConstant('{app}\Install-OpenXR-MotionCompensation.ps1'));
    DeleteFile(ExpandConstant('{app}\Uninstall-OpenXR-MotionCompensation.ps1')); 
		// Modify uninstall registry entries to add "/log" parameter to force creation of log
    UninstallSubKeyName  := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{#AppId}_is1';
    AppendStringToRegValue(HKLM, UninstallSubKeyName, 'UninstallString', ' /log');
    AppendStringToRegValue(HKLM, UninstallSubKeyName, 'QuietUninstallString', ' /log');
    FileReplaceString(ExpandConstant('{app}\Readme.html'),'CURRENT_DEV_BUILD','{#AppVersion}');
    FileReplaceString(ExpandConstant('{localappdata}\{#AppName}\Readme.html'),'CURRENT_DEV_BUILD','{#AppVersion}');
    OpenUserGuide();
  end;
end;

// Uninstall
function DeleteConfigAndLogFiles() : boolean;
var
  FindRec: TFindRec;
  Path, File: string;
begin
  Result := false;
  Path := ExpandConstant('{localappdata}\{#AppName}\');
  if MsgBox(ExpandConstant('Do you want to keep your configuration and log files in ...\appdata\local\{#AppName}?'), mbConfirmation, MB_YESNO) = IDYES then
  begin
    Log(Format('Config files are kept in : %s', [Path]));
  end
  else
  begin
    if FindFirst(Path + '*', FindRec) then
    begin
      try
        repeat
          if EndsWith('.ini', Lowercase(FindRec.Name)) or EndsWith('.log', Lowercase(FindRec.Name)) then
          begin
            if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0 then
            begin
              File := Path + FindRec.Name;                
              if DeleteFile(File) then
              begin
                Log(Format('Deleted config/log file: %s', [File]));
                Result := true;
              end
              else
              begin
                MsgBox('Unable to delete config/log file ' + FindRec.Name + '. Please delete manually ',  mbError, MB_OK);
              end;                          
            end;
          end;
        until not FindNext(FindRec);
      finally
        FindClose(FindRec);
      end;
    end;
    RemoveDir(Path);
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
    ResultCode: Integer;
begin
  if(CurUninstallStep = usPostUninstall) then 
  begin
    DeleteConfigAndLogFiles();
    // try to delete installation directory
    RemoveDir(ExpandConstant('{app}'));
    ResultCode:= 0; 
  end;
end;