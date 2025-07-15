" --- Basic settings ---.vimrc
set nocompatible              " Disable compatibility with vi
filetype on                  " Disable filetype detection
filetype plugin indent on     " Enable filetype detection
filetype plugin on

" --- General settings ---
    " Visualizations
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set signcolumn=yes
set cursorline                " Highlight the current line
set cursorcolumn              " Highlight the current column
set scrolloff=8               " Keep 8 lines visible above/below the cursor
set sidescrolloff=8           " Keep 8 columns visible left/right of the cursor
set termguicolors             " Enable 24-bit RGB colors

    " Indentation
set tabstop=4                 " Number of spaces tabs count for
set shiftwidth=4              " Size of an indent
set expandtab                 " Use spaces instead of tabs
set softtabstop=4
set autoindent                " Copy indent from current line when starting a new line
set smartindent               " Smart autoindenting when starting a new line
set nowrap                      " Wrap long lines

    " Search features
set incsearch                 " Incremental search
set ignorecase                " Ignore case in search patterns
set smartcase                 " Override ignorecase if search pattern contains uppercase letters
set hlsearch                  " Highlight search results

    " Other settings
"set clipboard=unnamedplus     " Use system clipboard
set splitbelow                " Horizontal splits will automatically be below
set splitright                " Vertical splits will automatically be to the right
set mouse=a                   " Use the mouse to move the cursor
set shortmess+=I              " Disable intro message
set foldenable
set foldlevel=99

" --- Plugins ---
call plug#begin('~/.vim/plugged')

" --- LSP & Completion Plugins ---
Plug 'prabirshrestha/vim-lsp'           " LSP support
Plug 'mattn/vim-lsp-settings'           " Auto-install LSP servers
Plug 'prabirshrestha/asyncomplete.vim'  " Auto-completion framework
Plug 'prabirshrestha/asyncomplete-lsp.vim' " LSP source for asyncomplete

" --- UI & Status Line ---
Plug 'vim-airline/vim-airline'          " Status line
Plug 'vim-airline/vim-airline-themes'

" --- Syntax & Language Support ---
Plug 'sheerun/vim-polyglot'             " Syntax highlighting for many languages
Plug 'psf/black', { 'branch': 'main' }  " Python formatter
Plug 'vim-python/python-syntax'         " Improved Python syntax

" --- File Navigation & Search ---
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Fuzzy file finder
Plug 'junegunn/fzf.vim'

" --- Git Integration ---
Plug 'tpope/vim-fugitive'               " Git commands in Vim
Plug 'airblade/vim-gitgutter'            " Git diff in sign column
Plug 'tpope/vim-rhubarb'                 " GitHub integration
Plug 'ldelossa/gh.nvim'                  " GitHub CLI integration

" --- Undotree
Plug 'mbbill/undotree'
" --- Editing Enhancements ---
Plug 'jiangmiao/auto-pairs'             " Auto-close brackets and quotes
Plug 'mattn/emmet-vim'                  " Emmet for HTML/CSS
Plug 'alvan/vim-closetag'
Plug 'dense-analysis/ale'               " Asynchronous linting and fixing
Plug 'tpope/vim-commentary'

" --- Themes & Colors ---
Plug 'morhetz/gruvbox'                  " Gruvbox color scheme
Plug 'rose-pine/vim', { 'as': 'rose-pine' }

call plug#end()

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

" --- Color scheme and syntax highlighting ---
"set background=dark
"let g:gruvbox_contrast_dark = 'hard'
"colorscheme gruvbox
"syntax enable

colorscheme rosepine_moon
syntax enable

set termguicolors  " Ensure true color support


" --- Auto-completion options ---
set completeopt=menuone,noinsert,noselect

" --- GitGutter settings ---
let g:gitgutter_realtime = 1

" --- LSP settings ---
let g:lsp_auto_enable = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_virtual_text_enabled = 1
let g:lsp_use_native_client = 1
let g:lsp_preview_float = 1
let g:lsp_insert_text_enabled = 1
let g:lsp_completion_documentation_enabled = 1
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_highlights_insert_mode_enabled = 1
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_signs_insert_mode_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 1
let g:lsp_diagnostics_virtual_text_align = "after"
let g:lsp_diagnostics_virtual_text_prefix = " |-> "
let g:lsp_inlay_hints_mode = {
\  'normal': ['curline'],
\}

augroup lsp_float_colours
    autocmd!
    if !has('nvim')
    autocmd User lsp_float_opened
        \ call setwinvar(lsp#document_hover_preview_winid(),
        \		       '&wincolor', 'PopupWindow')
    else
    autocmd User lsp_float_opened
        \ call nvim_win_set_option(
        \   lsp#document_hover_preview_winid(),
        \   'winhighlight', 'Normal:PopupWindow')
    endif
augroup end

" Enable LSP with vim-lsp-settings
let g:lsp_settings_ui = 1

" Add TypeScript support (TSServer)
autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'tsserver',
    \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
    \ 'allowlist': ['typescript', 'javascript'],
    \ })


" --- ALE configuration ---
let g:ale_linters = { 'python': ['flake8', 'pylint'] }
let g:ale_fixers = { 'python': ['black'] }
let g:ale_fix_on_save = 1 " Auto-fix on save
    " --- show the fold status in status bar ---
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_z = '%3p%% %l/%L :%c %y %{foldlevel(".")}'


" --- Auto-store yanked text ---
autocmd TextYankPost * if v:event.operator ==# 'y' | let @a = @" | endif


" --- Spellcheck ---
highlight SpellBad cterm=underline ctermfg=Red guifg=#fb4934 gui=undercurl
highlight SpellCap cterm=underline ctermfg=Blue guifg=#83a598 gui=undercurl
highlight SpellRare cterm=underline ctermfg=Magenta guifg=#d3869b gui=undercurl
highlight SpellLocal cterm=underline ctermfg=Yellow guifg=#fabd2f gui=undercurl

" --- Using space as a leader key ---
let mapleader = " "

" --- Netrw shortcuts ---
nnoremap <leader>n :Ex<CR>
	" Augroup VimStartup:
	augroup VimStartup
	  au!
	  au VimEnter * if expand("%") == "" | e . | endif
	augroup END

" Hide files in netrw 
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\(\.git\|\.DS_Store\|node_modules\|__pycache__\|\.cache\|\.vscode\|.*\.o\|.*\.class\|\.\S\+\)$'
let g:netrw_liststyle         = 3
let g:netrw_banner            = 0

" --- FZF shortcuts ---
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :RG<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>Dv  :Changes<CR>
nnoremap <Leader>cs :Colors<CR>
nnoremap <Leader>wn :Windows<CR>

nnoremap <Leader>Gf :GFiles<CR>
nnoremap <Leader>Gs :GFiles?<CR>
nnoremap <Leader>Gl :Commits<CR>

  ":Rg [PATTERN]         | {rg}{7} search result ( `ALT-A`  to select all,  `ALT-D`  to deselect all)
  ":Locate PATTERN       |  `locate`  command output
  ":Lines [QUERY]        | Lines in loaded buffers
  ":Commands             | Commands
  ":Maps                 | Normal mode mappings



" --- LSP keybindings ---
nnoremap <leader>gd :LspDefinition<CR>
nnoremap <leader>gr :LspReferences<CR>
nnoremap <leader>gi :LspImplementation<CR>
nnoremap K :LspHover<CR>
nnoremap <leader>rn :LspRename<CR>
nnoremap <leader>df :LspDocumentFormat<CR>

"Background transparent
   " hi Normal guibg=NONE ctermbg=NONE
   " hi SignColumn guibg=NONE
   " hi NormalNC guibg=NONE
   " hi EndOfBuffer guibg=NONE
   " hi LineNr guibg=NONE

" --- Functions for creating new file and directory ---
function! CreateNewFile()
    let file = input('Enter filename: ')
    execute 'edit ' . file
endfunction

function! CreateNewDirectory()
    let dir = input('Enter directory name: ')
    execute 'silent !mkdir -p ' . dir
    execute 'NERDTreeRefreshRoot'
endfunction


" Enable persistent undo
set undofile
set undodir=~/.vim/undodir
nnoremap <leader>U :UndotreeToggle<CR>



" --- New file and directory creation ---
nnoremap <Leader>c :call CreateNewFile()<CR>
nnoremap <Leader>d :call CreateNewDirectory()<CR>
nnoremap <Leader>bv :call BgVis()<CR>
nnoremap <leader>/ :set hlsearch!<CR>
nnoremap <leader>so :source ~/.vimrc<CR>

" --- Map to paste from register 'a' ---
nnoremap <Leader>p "ap

