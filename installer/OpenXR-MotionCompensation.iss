; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!



; make sure to adapt this path to your system before building the installer
#define SolutionDir "P:\Development\OpenXR-MotionCompensation"
#define AppName "OpenXR-MotionCompensation"
#define AppVersion "0.2.0"
#define AppPublisher "BuzzteeBear"
#define AppURL "https://github.com/BuzzteeBear/OpenXR-MotionCompensation"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{A6E4E3AB-454E-4B79-BDCD-A11B4E1AAF4D}
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
LicenseFile={#SolutionDir}\installer\Disclaimer.txt
OutputDir={#SolutionDir}\bin\Installer
OutputBaseFilename=Install {#AppName} {#AppVersion}
SetupIconFile={#SolutionDir}\installer\{#AppName}.ico
UninstallDisplayIcon={#SolutionDir}\installer\{#AppName}.ico 
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64  
Compression=lzma
SolidCompression=yes
WizardStyle=modern
SetupLogging=yes

[Files]
Source: "{#SolutionDir}\configuration\{#AppName}.ini"; DestDir: "{localappdata}\{#AppName}"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "{#SolutionDir}\{#AppName}_Changelog.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SolutionDir}\{#AppName}_User_Guide.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SolutionDir}\scripts\Trace_{#AppName}.wprp"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SolutionDir}\bin\x64\Release\XR_APILAYER_NOVENDOR_motion_compensation.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SolutionDir}\XR_APILAYER_NOVENDOR_motion_compensation\XR_APILAYER_NOVENDOR_motion_compensation.json"; DestDir: "{app}"; Flags: ignoreversion

[Registry]
Root: HKLM; Subkey: "SOFTWARE\Khronos\OpenXR\1\ApiLayers\Implicit"; ValueName: "{app}\XR_APILAYER_NOVENDOR_motion_compensation.json"; ValueType: dword; ValueData: 0; Flags: uninsdeletevalue

[INI]
; [tracker]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "type"; String: "controller"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "side"; String: "left"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "offset_forward"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "offset_down"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "offset_right"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "use_yaw_ge_offset"; String: "0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "use_cor_pos"; String: "0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_x"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_y"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_z"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_a"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_b"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_c"; String: "0.0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "tracker"; Key: "cor_d"; String: "0.0"; Flags: createkeyifdoesntexist

; [translation_filter]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "translation_filter"; Key: "strength"; String: "0.50"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "translation_filter"; Key: "order"; String: "2"; Flags: createkeyifdoesntexist

; [rotation_filter]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "rotation_filter"; Key: "strength"; String: "0.50"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "rotation_filter"; Key: "order"; String: "2"; Flags: createkeyifdoesntexist

; [shortcuts]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "activate"; String: "CTRL+INS"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "center"; String: "CTRL+DEL"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "translation_increase"; String: "CTRL+PLUS"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "translation_decrease"; String: "CTRL+MINUS"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "rotation_increase"; String: "CTRL+0"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "rotation_decrease"; String: "CTRL+9"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "offset_forward"; String: "CTRL+UP"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "offset_back"; String: "CTRL+DOWN"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "offset_up"; String: "CTRL+PGUP"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "offset_down"; String: "CTRL+PGDN"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "offset_right"; String: "CTRL+RIGHT"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "offset_left"; String: "CTRL+LEFT"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "rotate_right"; String: "CTRL+PERIOD"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "rotate_left"; String: "CTRL+COMMA"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "cor_debug_mode"; String: "CTRL+SHIFT+M"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "save_config"; String: "CTRL+SHIFT+S"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "save_config_app"; String: "CTRL+SHIFT+A"; Flags: createkeyifdoesntexist
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "shortcuts"; Key: "reload_config"; String: "CTRL+SHIFT+L"; Flags: createkeyifdoesntexist

; [debug]
Filename: "{localappdata}\{#AppName}\{#AppName}.ini"; Section: "debug"; Key: "testrotation"; String: "0"; Flags: createkeyifdoesntexist

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
SelectDirBrowseLabel=To continue, click Next. If you would like to select a different folder, click Browse.%n%nUSING A SUBDIRECTORY OF THE WINDOWS PROGRAM FILES FOLDER IS STRONGLY RECOMMENDED!

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

// Install 
function RemoveOxrmcRegEntries() : boolean;
var
  Names: TArrayOfString;
  Name: string;
  Path: string;
  I: Integer;
begin
  Result := false;
  Path := 'SOFTWARE\Khronos\OpenXR\1\ApiLayers\Implicit' 
  if RegGetValueNames(HKLM, Path, Names)then
  begin
    for I := 0 to GetArrayLength(Names) - 1 do
    begin
      Name := Names[I];
      if EndsWith('XR_APILAYER_NOVENDOR_motion_compensation.json', Name) then
      begin
        if RegDeleteValue(HKLM, Path, Name) then
        begin
          Log(Format('Deleted old registry key: %s', ['Computer\HKEY_LOCAL_MACHINE' + Path + Name] ));
          Result := true;
        end
        else
        begin
          MsgBox('Unable to delete old registry key: Computer\HKEY_LOCAL_MACHINE ' + Path + Name, mbError, MB_OK);
        end;

      end;
    end;
  end;
end;

function MoveLegacyConfigFiles() : boolean;
var
  FindRec: TFindRec;
  SrcPath: string;
  DstPath: string;
  SrcFile: string;
  DstFile: string;
begin
  Result := false;
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
              // 
              Log(Format('Moved config file %s to %s', [FindRec.Name, DstPath] ));
              DeleteFile(SrcFile);
              Result := true;
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
  if Result then
  begin
  MsgBox('Moved existing config files from ' + SrcPath + ' to ' + DstPath,  mbInformation, MB_OK);
  end;
end;

function ReorderApiLayerRegEntries : boolean;
var
  Names: TArrayOfString;
  Name: string;
  Path : string;
  I: Integer;
  Value: Cardinal;
begin
  Result := false;
  Path := 'SOFTWARE\Khronos\OpenXR\1\ApiLayers\Implicit' 
  if RegGetValueNames(HKLM, Path, Names)then
  begin
    for I := 0 to GetArrayLength(Names) - 1 do
    begin
      Name := Names[I];
      if EndsWith('UltraleapHandTracking.json', Name) then
      begin
        if RegQueryDWordValue(HKLM, Path, Name, Value) then
        begin
          if RegDeleteValue(HKLM, Path, Name) and RegWriteDWordValue(HKLM, Path, Name, Value) then
          begin
            Log(Format('Recreated registry key: %s = %d', ['Computer\HKEY_LOCAL_MACHINE' + Path + Name, Value]));
            Result := true;
          end
          else
          begin
            MsgBox('Unable to move registry key: Computer\HKEY_LOCAL_MACHINE ' + Path + Name, mbError, MB_OK);
          end;
        end
        else
        begin
          MsgBox('Unable to read registry key: Computer\HKEY_LOCAL_MACHINE ' + Path + Name, mbError, MB_OK);
        end;
      end;
    end;
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
    ResultCode: Integer;
begin
  if(CurStep = ssInstall) then 
  begin
    RemoveOxrmcRegEntries();  
    MoveLegacyConfigFiles(); 
  end;
  if(CurStep = ssPostInstall) then 
  begin
    ReorderApiLayerRegEntries();
    // delete legacy power shell (un)install scripts
    DeleteFile(ExpandConstant('{app}\Install-OpenXR-MotionCompensation.ps1'));
    DeleteFile(ExpandConstant('{app}\Uninstall-OpenXR-MotionCompensation.ps1')); 
  end;
  ResultCode:= 0;
end;

// Uninstall
function DeleteConfigFiles() : boolean;
var
  FindRec: TFindRec;
  Path: string;
  File: string;
begin
  Result := false;
  Path := ExpandConstant('{localappdata}\{#AppName}\');
  if MsgBox(ExpandConstant('Do you want to keep your configuration files in ...\appdata\local\{#AppName}?'), mbConfirmation, MB_YESNO) = IDYES then
  begin
    Log(Format('Config files are kept in : %s', Path));
  end
  else
  begin
    if FindFirst(Path + '*', FindRec) then
    begin
      try
        repeat
          if EndsWith('.ini', Lowercase(FindRec.Name)) then
          begin
            if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0 then
            begin
              File := Path + FindRec.Name;                
              if DeleteFile(File) then
              begin
                Log(Format('Deleted config file: %s', [File]));
                Result := true;
              end
              else
              begin
                MsgBox('Unable to delete config file ' + FindRec.Name + '. Please delete manually ',  mbError, MB_OK);
              end;                          
            end;
          end;
        until not FindNext(FindRec);
      finally
        FindClose(FindRec);
      end;
    end;
    RemoveDir(ExpandConstant('{app}'));
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
    ResultCode: Integer;
begin
  if(CurUninstallStep = usUninstall) then 
  begin
    DeleteConfigFiles();
    ResultCode:= 0; 
  end; 
  if(CurUninstallStep = usPostUninstall) then 
  begin
    // try to delete 
    RemoveDir(ExpandConstant('{app}'));
    ResultCode:= 0; 
  end;
end;