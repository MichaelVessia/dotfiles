let s:core_conf_files = [
      \ 'plugins.vim',
      \ 'settings.vim',
      \ 'theme.vim'
      \ ]

for s:fname in s:core_conf_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor

