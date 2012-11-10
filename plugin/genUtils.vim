"Removes all trailing white space in current buffer
fun! RemoveTrailingWhiteSpace()
    call CurPos("save")
    %s/\s*$//
    call CurPos("restore")
endfun

"Lets you save a file you forgot to open with sudo
fun! SaveReadOnlyFile()
    w !sudo tee %
endfun

"Toggles spell checker highlighting on and off, allowing me to still use
"spell checker commands, even if the word is not visibly highlighted
fun! ToggleSpellingHighlight()
    if ! &spell && &ft != 'help' "spell is not set
        echo 'spell is unset -> turning on spell'
        set spell
        let g:genUtils_SpellHL = 1
    endif

    if !exists("g:genUtils_SpellHL")
        let g:genUtils_SpellHL = 1
    endif

    if g:genUtils_SpellHL > 0
        "Turn it off
        let g:genUtils_SpellHL = 0
        highlight SpellBad NONE
        highlight SpellLocal NONE
        highlight SpellRare NONE
        highlight SpellCap NONE
    else
        "Turn it on
        let g:genUtils_SpellHL = 1
        highlight SpellBad gui=underline term=underline
        highlight SpellLocal gui=italic term=italic
        highlight SpellRare gui=bold term=bold
        highlight SpellCap gui=bold term=bold
    endif


endfun

"Saves/Restores Cursor position
"http://vim.wikia.com/wiki/Maintain_cursor_and_screen_position
function CurPos(action)
  if a:action == "save"
    let b:saveve = &virtualedit
    let b:savesiso = &sidescrolloff
    set virtualedit=all
    set sidescrolloff=0
    let b:curline = line(".")
    let b:curvcol = virtcol(".")
    let b:curwcol = wincol()
    normal! g0
    let b:algvcol = virtcol(".")
    normal! M
    let b:midline = line(".")
    execute "normal! ".b:curline."G".b:curvcol."|"
    let &virtualedit = b:saveve
    let &sidescrolloff = b:savesiso
  elseif a:action == "restore"
    let b:saveve = &virtualedit
    let b:savesiso = &sidescrolloff
    set virtualedit=all
    set sidescrolloff=0
    execute "normal! ".b:midline."Gzz".b:curline."G0"
    let nw = wincol() - 1
    if b:curvcol != b:curwcol - nw
      execute "normal! ".b:algvcol."|zs"
      let s = wincol() - nw - 1
      if s != 0
        execute "normal! ".s."zl"
      endif
    endif
    execute "normal! ".b:curvcol."|"
    let &virtualedit = b:saveve
    let &sidescrolloff = b:savesiso
    unlet b:saveve b:savesiso b:curline b:curvcol b:curwcol b:algvcol b:midline
  endif
  return ""
endfunction


"Set up commands to make calling above functions easier
command! -nargs=0 NoTrail call RemoveTrailingWhiteSpace()
command! -nargs=0 ForceSave call SaveReadOnlyFile()
command! -nargs=0 TSpellHL call ToggleSpellingHighlight()
cmap w!! call SaveReadOnlyFile()
