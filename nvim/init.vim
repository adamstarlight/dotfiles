""" Vim-Plug
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot'
"Plug 'Olical/conjure', {'tag': 'v4.14.1'}
"Plug 'luochen1990/rainbow'
""" Some cool themes
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'
Plug 'jacoborus/tender.vim'
"Plug 'sonph/onehalf', {'rtp': 'vim/'}
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'pgavlin/pulumi.vim'
"Plug 'arzg/vim-colors-xcode'
"Plug 'dylnmc/novum.vim'
"Plug 'bluz71/vim-nightfly-guicolors'
"Plug 'sainnhe/edge'
"Plug 'Rigellute/rigel'
"Plug 'kjssad/quantum.vim'
"Plug 'zefei/simple-dark'
Plug 'shapeoflambda/dark-purple.vim'
""" Plug 'prabirshrestha/async.vim'
""" Plug 'prabirshrestha/asyncomplete.vim'
""" Plug 'prabirshrestha/asyncomplete-lsp.vim'
""" Plug 'prabirshrestha/vim-lsp'
""" Plug 'mattn/vim-lsp-settings'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
""" Emmet
"Plug 'mattn/emmet-vim'
call plug#end()

""" Settings
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set number relativenumber
set title
set hlsearch                    " Highlight search
set clipboard=unnamedplus       " Allow clipbuffer
set updatetime=300              " Prevent COC lag
set shortmess+=c                " Don't pass messages to |ins-completion-menu|
set signcolumn=yes              " Always show the signcolumn
set termguicolors
set colorcolumn=80

highlight ColorColumn ctermbg=0 guibg=darkgrey

"colorscheme dark_purple
colorscheme ayu
"colorscheme OceanicNext

""" Emmet config
"let g:user_emmet_leader_key=','

""" Nerdtree
nmap <space>q :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

""" COC Config
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
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
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

" Formatting selected code.
xmap <F3>  <Plug>(coc-format-selected)
nmap <F3>  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

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

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


""" EASY MOTION
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

""" GIT
nmap <leader>gs :G<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

""" LSP
""" let g:lsp_signature_help_enabled = 0
""" let g:lsp_settings = {
""" \  'clangd': {'cmd': ['clangd-7']},
""" \  'efm-langserver': {'disabled': v:false}
""" \}
""" 
""" function! s:on_lsp_buffer_enabled() abort
""" endfunction
""" 
""" autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()

""" Airline
let g:airline_theme='monochrome'
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''

""" Custom commands
command! RandomString :let @" = system('head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13 ; echo ""')

""" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'


""" Mappings
let mapleader=","
nmap <leader>q :FZF<CR>
nmap <leader>l :Buffers<CR>
nmap <leader>m :History<CR>
tnoremap <Esc> <C-\><C-n>
" Setting tab-width
nmap <space>2 :set shiftwidth=2<CR>
nmap <space>4 :set shiftwidth=4<CR>

""" Rainbow
let g:rainbow_active = 0
