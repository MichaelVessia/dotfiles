" Detect filetypes that don't seem to work by default
if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	au! BufRead,BufNewFile *.astro		setfiletype astro
augroup END
