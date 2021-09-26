let mapleader = " "

filetype plugin indent on " Enabling filetype support provides filetype-specific
                          " indenting, syntax highlighting, omni-completion and

" set omnifunc=syntaxcomplete#Complete "<c-x><c-o>
set clipboard=unnamed " yank and paste with the system clipboard
set mouse=a " Enable mouse support
set scrolloff=3 " Maintain more context around the cursor
set number relativenumber
set backspace=indent,eol,start " backspace through everything in insert mode
set termguicolors " Coment√© esta l√≠nea para que tmux funcione bien
set ruler " Shows the current line number at the bottom-right of the screen.
set signcolumn=yes
set ignorecase " Case insensitive search
set smartcase " ... unless they contain at least one capital letter
set nowrap " Do not wrap long lines
set tabstop=2 " An indentation every two columns
set shiftwidth=2 " Use indents of 2 spaces
set expandtab " Tabs are spaces, not tabs
set splitright " Puts new vsplit windows to the right of the current
set splitbelow " Puts new split windows to the bottom of the current

" highlight ColorColumn ctermbg=magenta "set to whatever you like
call matchadd('ColorColumn', '\%81v', 100) "set column nr

call plug#begin('~/.local/share/nvim/plugged')
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'raimondi/delimitmate' " Provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'tpope/vim-surround' " Change surrounds cst'
Plug 'SirVer/ultisnips' " snippets engine, needs vim compiled with python3 :echo has("python3")
Plug 'honza/vim-snippets' " Snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline'
Plug 'justinmk/vim-sneak'
Plug 'moll/vim-bbye' "Delete buffers and close files in Vim without closing your windows
Plug 'arcticicestudio/nord-vim'
call plug#end()

colorscheme nord
let g:nord_cursor_line_number_background = 1
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let NERDTreeShowHidden=1
" let g:airline_symbols_ascii = 1          " Since I use vim from terminal (obsolete)

" fzf
nmap <C-p> :Files<CR>
nmap \\ :Files<CR>
map  \b :Buffers<CR>
map  \3 :b#<CR>
nmap \h :History<CR>
nmap \t :BTags<CR>
nmap \T :Tags<CR>
nmap \' :Marks<CR>
nmap \/ :Rg<Space>
nmap \q :Bdelete<CR>
" vim-sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S
" nerdtree
nmap <silent> <leader>nt :NERDTreeToggle<cr>
nmap <silent> <leader>nf :NERDTreeFind<cr>
" faster scrolling
nnoremap <silent> <C-e> 10<C-e>
nnoremap <silent> <C-y> 10<C-y>

" Save normal mode
nmap <leader>w :w<CR>
" Insert mode: Ctrl-S
" inoremap <C-S> <Esc>:w<cr>i

" Copy relative line here
nnoremap ca :<C-u>-co.<left><left><left>
nnoremap cb :<C-u>+co.<left><left><left>

inoremap kj <Esc>:w<CR>
map <leader>wq <Esc>:wq<CR>
map <Leader>w :w<CR>
map <leader>q <Esc>:q!<CR>
map <leader>c <Esc>:<Space>
nnoremap <silent> <leader>th :set hlsearch!<cr>

" ctags
" Auto generate tags file on file write of *.rb and *.erb files
autocmd BufWritePost *.rb,*.erb silent! !ctags . &

" strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

set noshowmode

" Move in preview window
" <C-n>
" <C-p>





" ========= Conquer of completion conf ==========
"
"
"
"
"
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>