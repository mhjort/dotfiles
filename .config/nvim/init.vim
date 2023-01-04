call plug#begin('~/.nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale'
Plug 'venantius/vim-cljfmt'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace'
Plug 'hrsh7th/nvim-compe'
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'tami5/vim-iced-compe', {'for': 'clojure'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'yasuhiroki/github-actions-yaml.vim'
Plug 'github/copilot.vim'

call plug#end()

syntax on
filetype plugin indent on

set nobackup
set nowritebackup
set noswapfile
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1

set wildignore+=target/**
set wildignore+=node_modules/**
set wildignore+=dist/**
set wildignore+=tmp/**
set wildignore+=vendor/**

set completeopt=menuone,noselect

lua << EOF
require'compe'.setup {
enabled = true;
autocomplete = true;
debug = false;
min_length = 1;
preselect = 'enable';
throttle_time = 80;
source_timeout = 200;
resolve_timeout = 800;
incomplete_delay = 400;
max_abbr_width = 100;
max_kind_width = 100;
max_menu_width = 100;
documentation = {
  border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
  winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
  max_width = 120,
  min_width = 60,
  max_height = math.floor(vim.o.lines * 0.3),
  min_height = 1,
  };

source = {
  path = true;
  buffer = true;
  calc = true;
  nvim_lsp = true;
  nvim_lua = true;
  vsnip = true;
  ultisnips = true;
  luasnip = true;
  };
}
EOF

let g:iced_enable_default_key_mappings = v:true
let g:iced_enable_clj_kondo_analysis = v:true

let g:sexp_enable_insert_mode_mappings = 0

let mapleader = "\<Space>"

map <leader>d :NERDTreeToggle<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>

lua << EOF
require'lspconfig'.clojure_lsp.setup{}
EOF

let g:ale_linters = {'clojure': ['clj-kondo']}
let g:ale_exclude_highlights = ['line too long']

nnoremap <F5> :checktime<CR>

let g:clj_fmt_autosave = 0

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
