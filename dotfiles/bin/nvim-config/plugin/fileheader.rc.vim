let g:fileheader_author = 'javalce'

let g:fileheader_date_format = '%a %b %d %Y'

let g:fileheader_delimiter_map = {
      \ 'python': {'begin': '',  'char':  '', 'end': ''}
      \}

let g:fileheader_templates_map = {
      \ 'python': [
            \ '#!/usr/bin/env python3',
            \ '# -*- coding: utf-8 -*-',
            \ '"""',
            \ 'Created on {{created_date}}',
            \ '',
            \ '@author: {{author}}',
            \ '"""',
      \]
      \}
