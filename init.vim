" NEOVIM settings
" ------------------------------------------
" See :options for other nvim settings
" or :h :cursor to see options for cursor as ex.

" ---Tabs:
" number of spaces a <Tab> in the text stands
set tabstop=4 softtabstop=4
" number of spaces used for each step of (auto)indent
set shiftwidth=4
" expand <Tab> to spaces in Insert mode
set expandtab
" do clever autoindenting
set smartindent
" Other:
" to automate source of an vimrc inside a project
" when typing nvim .
set exrc
" Sets block cursor
set guicursor
" Show the line number relative to the line with 
" the cursor in front of each line
set relativenumber
" Shows the current line number
set nu
" No highlight search
set nohlsearch
" Keeps buffer in the background
set hidden
" No beep of screen flash for error messages
set noerrorbells
" Set off the wrap on text
"set nowrap
" No swap, no backup.
set nobackup
set noswapfile

" Used with undotree plugin
if has("win32")
    set undodir=%USERPROFILE%/.nvim/undodir
else
    set undodir=~/.nvim/undodir
endif
" Highlight as you search
set incsearch
" Keep the cursor in the center as you're scrolling
set scrolloff=8

set termguicolors
" No message about the mode on last line
set noshowmode

set completeopt=menuone,noinsert,noselect
" Add a vertical column at 80 chars
" and a left bar to see lint errors
set colorcolumn=80
set signcolumn=yes
" Increase height for messages
set cmdheight=2
" To not have delays minimize update time
set updatetime=50

set encoding=utf-8

syntax on

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" -----------------Plugins------------------------
"  Install VimPlug
"  Download plug.vim and place it in autoload dir
"  inside neovim
call plug#begin('~/nvim/plugged')

" Fuzzy finder Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" On windows run: choco install mingw
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope sorter to significantly improve sorting performance
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Native LSP
Plug 'neovim/nvim-lspconfig'

" Finder (works well with Telescope) 'fd'
" See https://github.com/sharkdp/fd for commands
Plug 'sharkdp/fd'

" Icons
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'ryanoasis/vim-devicons'

" Needed for live grep in Telescope
Plug 'BurntSushi/ripgrep'

" Color Scheme
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" View treesitter information directly in Neovim
Plug 'nvim-treesitter/playground'

" Commenter plugin (use gcc an gc)
Plug 'tpope/vim-commentary'
" Surround plugin (use cs<prev sign><target sign>)
" To remove delimiters entirely (ds<signtoremove>)
Plug 'tpope/vim-surround'
" For automatic closing of quotes, parenthesis, brackets, etc
Plug 'Raimondi/delimitMate'


call plug#end()


"--- Colorscheme
let g:catppuccin_flavour = "dusk" " latte, frappe, macchiato, mocha
colorscheme catppuccin
highlight Normal guibg=none
" true colours
set background=dark
set t_Co=256

" Set leader
let mapleader = " "

" Telescope maping
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" -------------------------------------------------------------------
" For treesitter use :TSInstall <lang>
" For available langs check:
" https://github.com/nvim-treesitter/nvim-treesitter#adding-parsers
" TSInstall c cpp css dockerfile
" cmake go graphql html http java javascript json
" JSON with comments 
" julia lua make markdown regex rust typescript


" -------------------------------------------------------------------
" TreeSitter playground
" Run this after installing 
" :TSInstall query
" Usage
" The tree can be toggled using the command :TSPlaygroundToggle.

" Keybindings
" R: Refreshes the playground view when focused or reloads the query 
" when the query editor is focused.
" o: Toggles the query editor when the playground is focused.
" a: Toggles visibility of anonymous nodes.
" i: Toggles visibility of highlight groups.
" I: Toggles visibility of the language the node belongs to.
" t: Toggles visibility of injected languages.
" f: Focuses the language tree under the cursor in the playground.
" The query editor will now be using the focused language.
" F: Unfocuses the currently focused language.
" <cr>: Go to current node in code buffer
"
" -------------------------------------------------------------------
" Plugin telescope-fzf-native.nvim
" This means that the fzf syntax is supported:

" Token	Match type	Description
" sbtrkt	fuzzy-match	Items that match sbtrkt
" 'wild	exact-match (quoted)	Items that include wild
" ^music	prefix-exact-match	Items that start with music
" .mp3$	suffix-exact-match	Items that end with .mp3
" !fire	inverse-exact-match	Items that do not include fire
" !^music	inverse-prefix-exact-match	Items that do not start with music
" !.mp3$	inverse-suffix-exact-match	Items that do not end with .mp3
" A single bar character term acts as an OR operator. 
" For example, the following query matches entries that start with core and
" end with either go, rb, or py.
" ^core go$ | rb$ | py$

" -------------------------------------------------------------------
"  Vim Surround mini examples:
"
"  It's easiest to explain with examples. Press cs"' inside 
"  >"Hello world!"
"  to change it to:
"  >'Hello world!'
"  Now press cs'<q> to change it to
"  ><q>Hello world!</q>
"  To go full circle, press cst" to get
"  >"Hello world!"
"  To remove the delimiters entirely, press ds".
"  >Hello world!
"  Now with the cursor on \"Hello", press ysiw] (iw is a text object).
"  >[Hello] world!
"  Let's make that braces and add some space (use } instead of 
"  { for no space): cs]{
"  >{ Hello } world!
"  Now wrap the entire line in parentheses with yssb or yss).
"  >({ Hello } world!)
"  Revert to the original text: ds{ds)
"  >Hello world!
"  Emphasize hello: ysiw<em>
"  ><em>Hello</em> world!
"  Finally, let's try out visual mode. Press a capital V (for visual mode) 
"  followed by S<p class="important">.
"  ><p class="important">
"   <em>Hello</em> world!
"   </p>


"--------------------------------------------------------------------
" For neovim dev icons:
if exists('g:GuiLoaded')
    GuiPopupmenu 0
    GuiTabline 0
    "silent! set guifont=JetBrains\ Mono:h14
    set guifont=Fira\ Code:h10
    inoremap <silent> <S-Insert> <C-R>
    cmap <S-Insert> <C-R>
endif
