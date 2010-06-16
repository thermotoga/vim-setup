let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'

set textwidth=78    "set textwidth and break after 78 characters
iab - \hyp{}        "replace hyphen automatically

:syn match texRefZone /\\mycite\%([tp]\*\=\)\=/  nextgroup=texRefOption,texCite 

"the helps to make commands like \textit{...}
let b:surround_107 = "\\\1command: \1{\r}"
let b:surround_105 = "\\textit{\r}" "i = italic
let b:surround_98 = "\\textbf{\r}"  "b = boldface
let b:surround_116 = "\\texttt{\r}" "t = typewriter
