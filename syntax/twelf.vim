" Syntax highlighting for Twelf.


if exists("b:current_syntax")
  finish
endif

" Just about anything in Twelf is a keyword character.
set iskeyword+=@,!,#-',*-45,47-57,59-90,94-122,\|,^:


" Define syntax

syn keyword twelfType type
syn keyword twelfSymbol -> <-
syn keyword twelfPercentKey %mode %infix %prefix %abbrev %postfix %name %freeze %clause %define %solve %querytabled %query %tabled %deterministic %unique %block %worlds %covers %total %terminates %reduces %theorem %prove %assert %establish %sig %struct %where %include %open %use

syn match twelfPunct ":\|\.\|\<=\>"
syn match twelfFVar "\<[A-Z_]\k*\>"  
syn match twelfCurly "{\|}" contained
syn match twelfParen "(\|)" contained
syn match twelfSquare "\[\|\]" contained

syn match twelfDecl "^\s*[^A-Z_]\k*\s*:" contains=twelfPunct
syn match twelfBindDecl "[^A-Z_{\[]\k*\s*:" contains=twelfPunct contained

syn region twelfPiBind start="{" end="}" keepend transparent contains=twelfCurly,twelfPunct,twelfFVar,twelfSymbol,twelfType,twelfBindDecl
syn region twelfLamBind start="\[" end="\]" keepend transparent contains=twelfSquare,twelfPunct,twelfFVar,twelfSymbol,twelfType,twelfBindDecl
syn region twelfParens start="(" end=")" transparent contains=ALL

syn match twelfComment "% .*\|%%.*\|%$"
syn region twelfDelimitedComment start="%{" end="}%" contains=twelfDelimitedComment 


" Assign colors

hi link twelfType             NONE
hi link twelfSymbol           Operator
hi link twelfPercentKey       PreProc

hi link twelfPunct            Operator
hi link twelfFVar             Identifier
hi link twelfCurly            Tag
hi link twelfParen            Tag
hi link twelfSquare           Tag

hi link twelfDecl             Type
hi link twelfBindDecl         Type

hi link twelfComment          Comment
hi link twelfDelimitedComment Comment


" Folds
" set foldmethod=syntax
" set foldminlines=3

let b:current_syntax = "twelf"
