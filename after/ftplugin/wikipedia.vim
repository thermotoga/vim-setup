" Wikipedia prefers line breaks only at the end of paragraphs (like in a text
 " processor), which results in long, wrapping lines. 
setlocal wrap linebreak
setlocal textwidth=0

" No auto-wrap at all.
setlocal formatoptions-=tc formatoptions+=l
if v:version >= 602 | setlocal formatoptions-=a | endif

" Make navigation more amenable to the long wrapping lines. 
noremap <buffer> k gk
noremap <buffer> j gj
noremap <buffer> <Up> gk
noremap <buffer> <Down> gj
"noremap <buffer> 0 g0
"noremap <buffer> ^ g^
"noremap <buffer> $ g$
"noremap <buffer> D dg$ 
"noremap <buffer> C cg$ 
"noremap <buffer> A g$a

inoremap <buffer> <Up> <C-O>gk
inoremap <buffer> <Down> <C-O>gj

" utf-8 should be set if not already done globally
setlocal fileencoding=utf-8
setlocal matchpairs+=<:>

" Treat lists, indented text and tables as comment lines and continue with the
" same formatting in the next line (i.e. insert the comment leader) when hitting
" <CR> or using "o".
setlocal comments=n:#,n:*,n:\:,s:{\|,m:\|,ex:\|} 
setlocal formatoptions+=roq

" match HTML tags (taken directly from $VIM/ftplugin/html.vim)
if exists("loaded_matchit")
    let b:match_ignorecase=0
    let b:match_skip = 's:Comment'
    let b:match_words = '<:>,' .
    \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
    \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
    \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif

" Other useful mappings
" Insert a matching = automatically while starting a new header.
inoremap <buffer> <silent> = <C-R>=(getline('.')==''\|\|getline('.')=~'^=\+$')?"==\<Lt>Left>":"="<CR>

" Enable folding based on ==sections==
:set foldexpr=getline(v:lnum)=~'^\\(=\\+\\)[^=]\\+\\1\\(\\s*<!--.*-->\\)\\=\\s*$'?\">\".(len(matchstr(getline(v:lnum),'^=\\+'))-1):\"=\"
:set fdm=expr

" Surround plugin on w, l and c, r
let b:surround_119 = "[[\r]]"  "w = wiki
let b:surround_108 = "[[\r]]"  "l = link
let b:surround_99 = "<!-- \r -->" "c = comment
let b:surround_114 = "<ref> \r </ref>" "r = references
let b:surround_105 = "''\r''" "i = italic
let b:surround_98 = "'''\r''''"  "b = boldface""

iab hdaten {{subst:Benutzer:Hannes Röst/Vorlage/NeueDaten}}
iab datenh {{subst:Benutzer:Hannes Röst/Vorlage/NeueDaten}}
iab hsign Gruss --~~~~

"iab hrefs == Einzelnachweise 
"\<CR> <references/>
