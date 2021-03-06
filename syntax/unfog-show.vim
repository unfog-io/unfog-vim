if exists("b:current_syntax")
  finish
endif

syntax match unfog_info_separator /|/
syntax match unfog_info_id        /\(|.*\)\@<=|.*|\%2l/ contains=unfog_info_separator
syntax match unfog_info_desc      /\(|.*\)\@<=|.*|\%3l/ contains=unfog_info_separator
syntax match unfog_info_project   /\(|.*\)\@<=|.*|\%4l/ contains=unfog_info_separator
syntax match unfog_info_active    /\(|.*\)\@<=|.*|\%5l/ contains=unfog_info_separator
syntax match unfog_info_due       /\(|.*\)\@<=|.*|\%6l/ contains=unfog_info_separator
syntax match unfog_info_wtime     /\(|.*\)\@<=|.*|\%7l/ contains=unfog_info_separator
syntax match unfog_info_head      /.*\%1l/              contains=unfog_info_separator

highlight default link unfog_info_separator VertSplit
highlight default link unfog_info_key       Comment
highlight default link unfog_info_id        Identifier
highlight default link unfog_info_desc      Comment
highlight default link unfog_info_project   Tag
highlight default link unfog_info_active    String
highlight default link unfog_info_due       Structure
highlight default link unfog_info_wtime     Structure

highlight unfog_info_head term=bold,underline cterm=bold,underline gui=bold,underline

let b:current_syntax = "unfog-show"
