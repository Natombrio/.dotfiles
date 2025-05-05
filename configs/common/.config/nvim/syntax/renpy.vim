" Vim syntax file
" Language: Ren'Py Script (.rpy)
" Maintainer: T3 Chat (Generated Example)
" Last Change: 2025 Apr 26

" Prevent loading the file twice
if exists("b:current_syntax")
  finish
endif

" Ren'Py is case-sensitive
syntax case match

" Comments
syntax match renpyComment /#.*/ contains=@Spell

" Keywords
syntax keyword renpyStatement scene show hide with jump call return if elif else while menu python init define image transform style screen use default persistent pass say
syntax keyword renpyLabel label
syntax keyword renpyPython python hide

" Strings (handle basic escaped quotes)
syntax match renpyString /"\(\\.\|[^"]\)*"/ contains=@Spell
syntax match renpyString /'\(\\.\|[^']\)*'/ contains=@Spell

" Numbers (basic integers and floats)
syntax match renpyNumber /\<\d\+\(\.\d\+\)\?\>/

" Labels definition
syntax match renpyLabelDef /^\s*label\s\+\k\+:/ contains=renpyLabel

" Python blocks (simple, assumes indentation ends the block)
syntax region renpyPythonBlock start=/^\s*\(init\s\+\)\?python\s*\(early\|hide\)\?\s*:/ end=/^\S/ keepend contains=@pythonSyntax contains=@Spell
syntax match renpyPythonLine /^\s*\$.*/ contains=@pythonSyntax contains=@Spell

" Screen Language Keywords (Basic set)
syntax keyword renpyScreenKeyword textbutton button text frame vbox hbox grid action property style_prefix add background NullAction SetVariable ToggleVariable OpenURL If

" Syncing (helps keep highlighting correct during editing)
syntax sync minlines=50
syntax sync maxlines=500

" Define the default highlighting links
" Link our groups to standard Vim highlight groups
highlight default link renpyComment Comment
highlight default link renpyStatement Statement
highlight default link renpyLabel Label
highlight default link renpyPython Python        " Keyword 'python'
highlight default link renpyString String
highlight default link renpyNumber Number
highlight default link renpyLabelDef Function    " Make labels stand out
highlight default link renpyPythonBlock Normal  " Let contained Python syntax handle it
highlight default link renpyPythonLine Normal   " Let contained Python syntax handle it
highlight default link renpyDialogue String      " Highlight dialogue primarily as String
highlight default link renpyScreenKeyword Keyword

" Include Python syntax highlighting for the python blocks
" Vim usually handles this automatically if python syntax is installed
syntax include @pythonSyntax syntax/python.vim

" Let Vim know the syntax name
let b:current_syntax = "renpy"

" Optional: Add folding based on indentation or specific markers if desired later
" Example: setlocal foldmethod=indent
