" Vim syntax file
" Language:     asciidoc
" Maintainer:   Maxim Kim <habamax@gmail.com>
" Filenames:    *.adoc
" vim: et sw=4

if exists("b:current_syntax")
    finish
endif

syntax spell toplevel

if !exists('main_syntax')
    let main_syntax = 'asciidoc'
endif

" Check :h syn-sync-fourth
syn sync maxlines=100

syn case ignore

syn match asciidocOption "^:[[:alnum:]!-]\{-}:"
syn match asciidocListContinuation "^+\s*$"
syn match asciidocPageBreak "^<<<\+\s*$"

syn cluster asciidocBlock contains=asciidocTitle,asciidocH1,asciidocH2,asciidocH3,asciidocH4,asciidocH5,asciidocH6,asciidocBlockquote,asciidocListMarker,asciidocOrderedListMarker,asciidocCodeBlock,asciidocAdmonition,asciidocAdmonitionBlock
syn cluster asciidocInnerBlock contains=asciidocBlockquote,asciidocListMarker,asciidocOrderedListMarker,asciidocCodeBlock,asciidocDefList,asciidocAdmonition,asciidocAdmonitionBlock
syn cluster asciidocInline contains=asciidocItalic,asciidocBold,asciidocCode,asciidocBoldItalic,asciidocUrl,asciidocUrlAuto,asciidocLink,asciidocAnchor,asciidocMacro,asciidocAttribute,asciidocInlineAnchor
syn cluster asciidocUrls contains=asciidocUrlDescription,asciidocFile,asciidocUrlAuto,asciidocEmailAuto

syn match asciidocTitle "^=\s.*$" contains=@asciidocInline,@Spell
syn region asciidocH1 start="^==\s" end="$" oneline keepend contains=@asciidocInline,@Spell
syn region asciidocH2 start="^===\s" end="$" oneline keepend contains=@asciidocInline,@Spell
syn region asciidocH3 start="^====\s" end="$" oneline keepend contains=@asciidocInline,@Spell
syn region asciidocH4 start="^=====\s" end="$" oneline keepend contains=@asciidocInline,@Spell
syn region asciidocH5 start="^======\s" end="$" oneline keepend contains=@asciidocInline,@Spell
syn region asciidocH6 start="^=======\s" end="$" oneline keepend contains=@asciidocInline,@Spell

syn match asciidocSetextHeader '^\%(\n\|\%^\)\k.*\n\%(==\+\|\-\-\+\|\~\~\+\|\^\^\+\|++\+\)$' contains=@Spell

syn sync clear
syn sync match syncH1 grouphere NONE "^==\s.*$"
syn sync match syncH2 grouphere NONE "^===\s.*$"
syn sync match syncH3 grouphere NONE "^====\s.*$"
syn sync match syncH4 grouphere NONE "^=====\s.*$"
syn sync match syncH5 grouphere NONE "^======\s.*$"
syn sync match syncH6 grouphere NONE "^=======\s.*$"

syn match asciidocAttribute "{[[:alpha:]][[:alnum:]-_:]\{-}}" 

" a Macro is a generic pattern that has no default highlight, but it could contain a link/image/url/xref/mailto/etc, and naked URLs as well

syn match asciidocMacro "\<\l\{-1,}://\S\+" contains=asciidocUrlAuto,asciidocCode
syn match asciidocMacro "\<\w\S\{-}@\w\+\.\w\+" contains=asciidocEmailAuto,asciidocCode
syn match asciidocMacro "\<\l\{-1,}::\?\S*\[.\{-}\]" contains=asciidocUrl,asciidocLink,asciidocEmail,asciidocCode

syn match asciidocFile "\f\+" contained
syn match asciidocUrlDescription "\[[^]]\{-}\]\%(\s\|$\)" contained containedin=asciidocLink
syn match asciidocUrlAuto "\%(http\|ftp\|irc\)s\?://\S\+\%(\[.\{-}\]\)\?" contained contains=asciidocUrl
syn match asciidocEmailAuto "[a-zA-Z0-9._%+-]\{-1,}@\w\+\%(\.\w\+\)\+" contained

"if get(g:, 'asciidoc_syntax_conceal', 0)
    " the pattern \[\ze\%(\s*[^ ]\+\s*\)\+]\+ means: a brackets pair, inside of which at least one non-space character, possibly with spaces
syn region asciidocLink matchgroup=Conceal start="\%(link\|xref\|mailto\|irc\):\ze[^:].*" end="\ze\[\s*\]" concealends oneline keepend skipwhite contained nextgroup=asciidocUrlDescription contains=asciidocUrl,asciidocFile

syn region asciidocLink matchgroup=Conceal start="\%(link\|xref\|mailto\|irc\):[^:].*\[\ze\%(\s*[^ ]\+\s*\)\+]\+" end="\]" concealends oneline keepend skipwhite contained
syn region asciidocUrl matchgroup=Conceal start="\%(http\|ftp\|irc\)s\?://\S\+\[\ze\%(\s*[^ ]\+\s*\)\+]\+" end="\]" concealends oneline keepend skipwhite contained

 "   if get(g:, 'asciidoc_compact_media_links', 0)
        " conceal also the address of an image/video, if the description is not empty
syn region asciidocLink matchgroup=Conceal start="\%(video\|image\|include\|audio\|ifdef\|endif\)::\ze.*" end="\ze\[\s*\]" concealends oneline keepend skipwhite contained nextgroup=asciidocUrlDescription contains=asciidocUrl,asciidocFile
syn region asciidocLink matchgroup=Conceal start="\%(video\|image\|include\|audio\|ifdef\|endif\)::.*\[\ze\%(\s*[^ ]\+\s*\)\+]\+" end="\]" concealends oneline keepend skipwhite contained
syn region asciidocAnchor matchgroup=Conceal start="<<\%([^>]\{-},\s*\)\?\ze.\{-}>>" end=">>" concealends oneline

syn region asciidocBold matchgroup=Conceal start=/\m\*\*/ end=/\*\*/ contains=@Spell concealends oneline
syn region asciidocBold matchgroup=Conceal start=/\m\%(^\|[[:punct:][:space:]]\@<=\)\*\ze[^* ].\{-}\S/ end=/\*\%([[:punct:][:space:]]\@=\|$\)/ contains=@Spell concealends oneline

syn region asciidocItalic matchgroup=Conceal start=/\m__/ end=/__/ contains=@Spell concealends oneline
syn region asciidocItalic matchgroup=Conceal start=/\m\%(^\|[[:punct:][:space:]]\@<=\)_\ze[^_ ].\{-}\S/ end=/_\%([[:punct:][:space:]]\@=\|$\)/ contains=@Spell concealends oneline

syn region asciidocBoldItalic matchgroup=Conceal start=/\m\*\*_/ end=/_\*\*/ contains=@Spell concealends oneline
syn region asciidocBoldItalic matchgroup=Conceal start=/\m\%(^\|[[:punct:][:space:]]\@<=\)\*_\ze[^*_ ].\{-}\S/ end=/_\*\%([[:punct:][:space:]]\@=\|$\)/ contains=@Spell concealends oneline

syn region asciidocCode matchgroup=Conceal start=/\m``/ end=/``/ contains=@Spell concealends oneline
syn region asciidocCode matchgroup=Conceal start=/\m\%(^\|[[:punct:][:space:]]\@<=\)`\ze[^` ].\{-}\S/ end=/`\%([[:punct:][:space:]]\@=\|$\)/ contains=@Spell concealends oneline

syn match asciidocListMarker "^\s*\(-\|\*\+\|\.\+\)\%(\s\+\[[Xx ]\]\+\s*\)\?\%(\s\+\S\)\@="
syn match asciidocOrderedListMarker "^\s*\%(\d\+\|\a\)\.\%(\s\+\S\)\@="

syn match asciidocDefList ".\{-}::\_s\%(\_^\n\)\?" contains=@Spell


syn match asciidocCallout "\s\+\zs<\%(\.\|\d\+\)>\ze\s*$" contained
syn match asciidocCalloutDesc "^\s*\zs<\%(\.\|\d\+\)>\ze\s\+"

syn match asciidocUppercase /^\ze\u\+:/ nextgroup=asciidocAdmonition
syn match asciidocAdmonition /\C^\%(NOTE:\)\|\%(TIP:\)\|\%(IMPORTANT:\)\|\%(CAUTION:\)\|\%(WARNING:\)\s/ contained

syn match asciidocCaption "^\.[^.[:space:]].*$" contains=@asciidocInline,@Spell

syn match asciidocBlockOptions "^\[.\{-}\]\s*$"

syn match asciidocPlus '^+\n\s' contained
syn match asciidocIndented '^+\?\n\%(\s\+\(-\|[*.]\+\|\d\+\.\|\a\.\)\s\)\@!\(\s.*\n\)\+' contains=asciidocPlus

syn match asciidocInlineAnchor "\[\[.\{-}\]\]"

" Open block
" --
" Should be highlighted as usual asciidoc
" Except (at least) headings
" --
syn region asciidocOpenBlock matchgroup=asciidocBlock start="^--\s*$" end="^--\s*$" contains=@asciidocInnerBlock,@asciidocInline,@Spell,asciidocComment,asciidocIndented

" Listing block
" --
" block that will not be
" highlighted
" --
syn region asciidocListingBlock matchgroup=asciidocBlock start="^----\+\s*$" end="^----\s*$" contains=CONTAINED,asciidocTableCell,@asciidocInline,@asciidocUrls

" General [source] block
syn region asciidocSourceBlock matchgroup=asciidocBlock start="^\[source\%(,.*\)*\]\s*$" end="^\s*$" keepend contains=CONTAINED,asciidocTableCell,@asciidocInline,@asciidocUrls
syn region asciidocSourceBlock matchgroup=asciidocBlock start="^\[source\%(,.*\)*\]\s*\n\z(--\+\)\s*$" end="^.*\n\zs\z1\s*$" keepend contains=CONTAINED,asciidocTableCell,@asciidocInline,@asciidocUrls

" Contents of plantuml blocks should be highlighted with plantuml syntax...
" There is no built in plantuml syntax as far as I know.
" Tested with https://github.com/aklt/plantuml-syntax
syn region asciidocPlantumlBlock matchgroup=asciidocBlock start="^\[plantuml.\{-}\]\s*\n\z(\.\.\.\.\+\)\s*$" end="^.*\n\zs\z1\s*$" keepend contains=@asciidocPlantumlHighlight
syn region asciidocPlantumlBlock matchgroup=asciidocBlock start="^\[plantuml.\{-}\]\s*\n\z(--\+\)\s*$" end="^.*\n\zs\z1\s*$" keepend contains=@asciidocPlantumlHighlight

" Contents of literal blocks should not be highlighted
" TODO: make [literal] works with paragraph
syn region asciidocLiteralBlock matchgroup=asciidocBlock start="^\z(\.\.\.\.\+\)\s*$" end="^\z1\s*$" contains=CONTAINED,@Spell,asciidocComment,@asciidocInline,@asciidocUrls
syn region asciidocExampleBlock matchgroup=asciidocBlock start="^\z(====\+\)\s*$" end="^\z1\s*$" contains=@asciidocInnerBlock,@asciidocInline,@Spell,asciidocComment,asciidocIndented
syn region asciidocSidebarBlock matchgroup=asciidocBlock start="^\z(\*\*\*\*\+\)\s*$" end="^\z1\s*$" contains=@asciidocInnerBlock,@asciidocInline,@Spell,asciidocComment,asciidocIndented
syn region asciidocQuoteBlock   matchgroup=asciidocBlock start="^\z(____\+\)\s*$" end="^\z1\s*$" contains=@asciidocInnerBlock,@asciidocInline,@Spell,asciidocComment,asciidocIndented

syn region asciidocAdmonitionBlock matchgroup=asciidocBlock start="^\[\u\+\]\n\z(====\+\)\s*$" end="^\z1\s*$" contains=@asciidocInnerBlock,@asciidocInline,@Spell,asciidocComment,asciidocIndented

" Table blocks
syn match asciidocTableCell "\(^\|\s\)\@<=[.+*<^>aehlmdsv[:digit:]]\+|\||" contained containedin=asciidocTableBlock
syn region asciidocTableBlock matchgroup=asciidocBlock start="^|\z(===\+\)\s*$" end="^|\z1\s*$" keepend contains=asciidocTableCell,asciidocIndented,@asciidocInnerBlock,@asciidocInline,@Spell,asciidocComment
syn region asciidocTableBlock matchgroup=asciidocBlock start="^,\z(===\+\)\s*$" end="^,\z1\s*$" keepend
syn region asciidocTableBlock matchgroup=asciidocBlock start="^;\z(===\+\)\s*$" end="^;\z1\s*$" keepend

syn match asciidocComment "^//.*$" contains=@Spell

hi def link asciidocTitle                 Title
hi def link asciidocSetextHeader          Title
hi def link asciidocH1                    Title
hi def link asciidocH2                    Title
hi def link asciidocH3                    Title
hi def link asciidocH4                    Title
hi def link asciidocH5                    Title
hi def link asciidocH6                    Title
hi def link asciidocListMarker            Delimiter
hi def link asciidocOrderedListMarker     asciidocListMarker
hi def link asciidocListContinuation      Delimiter
hi def link asciidocComment               Comment
hi def link asciidocIndented              Comment
hi def link asciidocPlus                  Delimiter
hi def link asciidocPageBreak             Delimiter
hi def link asciidocCallout               Delimiter
hi def link asciidocCalloutDesc           Delimiter

hi def link asciidocListingBlock          Comment
hi def link asciidocLiteralBlock          Comment

hi def link asciidocFile                  Underlined
hi def link asciidocUrl                   Underlined
hi def link asciidocEmail                 Underlined
hi def link asciidocUrlAuto               Underlined
hi def link asciidocEmailAuto             Underlined
hi def link asciidocUrlDescription        Constant

hi def link asciidocLink                  Underlined
hi def link asciidocAnchor                Underlined
hi def link asciidocAttribute             Identifier
hi def link asciidocCode                  Constant
hi def link asciidocOption                Identifier
hi def link asciidocBlock                 Delimiter
hi def link asciidocBlockOptions          Delimiter
hi def link asciidocTableSep              Delimiter
hi def link asciidocTableCell             Delimiter
hi def link asciidocTableEmbed            Delimiter
hi def link asciidocInlineAnchor          Delimiter

hi asciidocBold                           gui=bold cterm=bold
hi asciidocItalic                         gui=italic cterm=italic
hi asciidocBoldItalic                     gui=bold,italic cterm=bold,italic
augroup asciidoc_highlight_create
    au!
    autocmd ColorScheme * :hi asciidocBold gui=bold cterm=bold
    autocmd ColorScheme * :hi asciidocItalic gui=italic cterm=italic
    autocmd ColorScheme * :hi asciidocBoldItalic gui=bold,italic cterm=bold,italic
augroup end
hi def link asciidocDefList               asciidocBold
hi def link asciidocCaption               Statement
hi def link asciidocAdmonition            asciidocBold

" hi def link asciidocEscape                Special
" hi def link asciidocError                 Error

let b:current_syntax = "asciidoc"

if main_syntax ==# 'asciidoc'
    unlet main_syntax
endif

