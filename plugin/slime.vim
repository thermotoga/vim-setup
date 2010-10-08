"Slime.vim from Jonathan Palardy from http://technotales.wordpress.com
"to whom all credit belongs
"slight modifications by Hannes Röst (and Rahul who commented on the blog)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Pythonify(text)
  "Here we create the correct 'indentation' for the text by
  "counting the leading spaces (extra_spaces) and then deleting those
  "It also fixes the problem with extra newlines in the Python interpreter
  let mytext=a:text
  let extra_spaces = matchstr(mytext,'^\( \)\+')
  let mytext = substitute(mytext, "^" . extra_spaces , "", 'g')
  let mytext = substitute(mytext, "\n" . extra_spaces , "\n", 'g')
  let mytext = substitute(mytext, '\n\s*\n\+', '\n', 'g') 
  return mytext
endfunction

function Send_to_Screen(text)
  if !exists("g:screen_sessionname") || !exists("g:screen_windowname")
    call Screen_Vars()
  end

  let modtext=Pythonify(a:text)
  echo system("screen -S " . g:screen_sessionname . " -p " . g:screen_windowname . " -X stuff '" . substitute(modtext, "'", "'\\\\''", 'g') . "'")
endfunction


function Screen_Session_Names(A,L,P)
  return system("screen -ls | awk '/Attached/ {print $1}'")
endfunction

function Screen_Vars()
  if !exists("g:screen_sessionname") || !exists("g:screen_windowname")
    let g:screen_sessionname = ""
    let g:screen_windowname = "0"
  end

  let g:screen_sessionname = input("session name: ", "", "custom,Screen_Session_Names")
  let g:screen_windowname = input("window name: ", g:screen_windowname)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"here we use the markers k and l to save the current cursor and window position
vmap <C-c><C-c> mkHml`k "ry :call Send_to_Screen(@r)<CR>`lzt`k
nmap <C-c><C-c> mkHml`k vip"ry :call Send_to_Screen(@r."\n")<CR>`lzt`k
nmap <C-x><C-x> V<C-c><C-c>

nmap <C-c>v :call Screen_Vars()<CR>

