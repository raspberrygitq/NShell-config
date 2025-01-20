menu(type='file|dir|back|root|namespace' mode="multiple"  title='Kopiuj do schowka' image=icon.copy)
{
	// Appears only when multiple selections.
	item(vis=@(sel.count > 1) title='Kopiuj ścieżkę (@sel.count) wybrane elementy'
			cmd=command.copy(sel(false, "\n")))

	item(mode="single" title=sel.path 
			cmd=command.copy(sel.path))

	item(mode="single" type='file|dir|back.dir'
			vis=sel.short.len!=sel.path.len title=sel.short
			cmd=command.copy(sel.short))
	separator
	item(mode="single" vis=@(sel.parent.len>3) title=sel.parent 
			cmd=command.copy(sel.parent))
	separator
	item(mode="single" type='file|dir|back.dir' title=sel.file.name
			cmd=command.copy(sel.file.name))
		   
	item(mode="single" type='file' title=sel.file.title
			cmd=command.copy(sel.file.title))

	item(mode="single" type='file' title=sel.file.ext
		   cmd=command.copy(sel.file.ext))
}