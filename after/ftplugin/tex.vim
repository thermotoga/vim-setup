let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'

set textwidth=78    "set textwidth and break after 78 characters
iab - \hyp{}        "replace hyphen automatically

:syn match texRefZone /\\mycite\%([tp]\*\=\)\=/  nextgroup=texRefOption,texCite 

