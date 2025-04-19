// Windows 11 Taskbar Flyout

menu(where=@(this.count == 0) type='taskbar' image=icon.settings expanded=true)
{
	item(title="Aplikacje i funkcje" image=icon.new cmd='ms-settings:appsfeatures')
	item(title="Menedżer urządzeń" image=icon.device_manager cmd='devmgmt.msc')
	item(title="Zarządzanie dyskami" image=icon.disk_management cmd='diskmgmt.msc')
	item(title="Zarządzanie komputerem" image=icon.display_settings cmd='compmgmt.msc')
	item(title="Panel sterowania" image=icon.settings(auto, image.color1) cmd='control.exe')
	sep
	$tip_run_admin=["\xE1A7 Naciśnij Shift aby uruchomić " + this.title + " jako administrator", tip.warning, 1.0]
	$has_admin=key.shift() or key.rbutton()
	
	item(title="Wiersz polecenia" tip=tip_run_admin admin=has_admin image=icon.command_prompt cmd='cmd.exe' args='/K TITLE Wiersz polecenia &ver& PUSHD "@sel.dir"')
	item(title="Windows PowerShell" admin=has_admin tip=tip_run_admin image=icon.windows_powershell cmd='powershell.exe' args='-noexit -command Set-Location -Path "@sel.dir\."')
	item(title="Edytor rejestru" admin=has_admin cmd='regedit.exe')
	sep
	menu(title=title.windows image=\uE1FB)
	{
	item(title="Ułóż okna kaskadowo" cmd=command.cascade_windows)
	item(title="Ułóż okna jedno na drugim" cmd=command.Show_windows_stacked)
	item(title="Ułóż okna obok siebie" cmd=command.Show_windows_side_by_side)
//	item(title="Zminimazuj wszystkie okna" cmd=command.minimize_all_windows)
//	item(title="Przywróć wszystkie okna" cmd=command.restore_all_windows)
	}
	item(title="Pokaż pulpit" image=icon.desktop cmd=command.toggle_desktop)
	sep
	item(title=title.settings image=icon.settings(auto, image.color1) cmd='ms-settings:')
	item(title="Menedżer zadań" image=icon.task_manager cmd='taskmgr.exe')
	item(title="Ustawienia paska zadań" image=inherit cmd='ms-settings:taskbar')
	item(vis=key.shift() title="Uruchom ponownie Explorer" sep=both image=icon.refresh cmd=command.restart_explorer)
}