local n = 'n'
local v = 'v'
local i = 'i'
local nvo = {'n', 'v', 'o'} -- map

-- local function map(mode, key, value)
    -- vim.keymap.set(mode, key, value, { remap = true, silent = false })
-- end

-- local function noremap(mode, key, value)
    -- vim.keymap.set(mode, key, value, { remap = false, silent = false })
-- end

-- local function resize(key, value)
    -- vim.keymap.set({'n', 'v', 'o', 'i'}, key, value, { remap = false, silent = true })
-- end

vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Go to <++> pattern and change around it
    -- map(nvo, '<leader><leader>', '<CMD>keepp /<++><CR>ca<')
    -- map(i, '<leader><leader>', '<CMD>keepp /<++><CR><ESC>ca<')
    vim.cmd("map <leader><leader> /<++><CR>ca<")
    vim.cmd("imap <leader><leader> /<++><CR>ca<")

-- Copy selection to clipboard (xsel, xclip, or wl_copy and wl_paste required)
    vim.cmd('vmap <C-y> "+y')

-- Comment is ctrl + / (vim commentary plugins require)
    -- Move down one line after comment
        vim.cmd("map <C-_> <Plug>CommentaryLine j")
        vim.cmd('imap <C-_> <ESC><Plug>CommentaryLine j')
    -- Stay atthat line after comment (remove j after comment)
        vim.cmd('vmap <C-_>, <Plug>Commentary')

-- Keeping cursor in center for next/previous search occurence
    vim.cmd('map n nzz')
    vim.cmd('map N Nzz')

-- Mimic shell movements
    -- vim.cmd('map <C-E>, <C-o>$')
    -- vim.cmd('map <C-A> <C-o>^')

-- Quickly save the current buffer or all buffers
    vim.cmd('map <leader>w <CMD>update<CR>')
    vim.cmd('map <leader>W <CMD>wall<CR>')

-- Quit neovim
    vim.cmd('map <C-Q> <CMD>q<CR>')

-- Move to the next, previous, or last buffer
    vim.cmd('map <leader>[ <CMD>bp<CR>')
    vim.cmd('map <leader>] <CMD>bn<CR>')
    vim.cmd('map <leader>\\ <CMD>bn<CR>')

-- Copying the vscode behaviour of making tab splits
    vim.cmd('map <C-\\> <CMD>vsplit<CR>')
    vim.cmd('map <A-\\> <CMD>split<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
    vim.cmd('map <A-j> <CMD>move .+1<CR>')
    vim.cmd('map <A-k> <CMD>move .-2<CR>')

-- Perform dot commands over visual blocks:
    vim.cmd('vnoremap . :normal .<CR>')
-- Spell-check set to <leader>o, 'o' for 'orthography'<CMD>
    vim.cmd('map <leader>o <CMD>setlocal spell! spelllang=en_us<CR>')

-- Shortcutting split navigation, saving a keypress:
    vim.cmd('map <C-h> <C-w>h')
    vim.cmd('map <C-j> <C-w>j')
    vim.cmd('map <C-k> <C-w>k')
    vim.cmd('map <C-l> <C-w>l')

-- Make adjusting split sizes a bit more friendly:
    vim.cmd('map <C-Left>  <CMD>vertical resize +3<CR>')
    vim.cmd('imap <C-Left>  <CMD>vertical resize +3<CR>')
    --
    vim.cmd('map <C-Right>  <CMD>vertical resize -3<CR>')
    vim.cmd('imap <C-Right>  <CMD>vertical resize -3<CR>')
    --
    vim.cmd('map <C-Up>  <CMD>resize +3<CR>')
    vim.cmd('imap <C-Up>  <CMD>resize +3<CR>')
    --
    vim.cmd('map <C-Down>  <CMD>resize -3<CR>')
    vim.cmd('imap <C-Down>  <CMD>resize -3<CR>')

-- Change 2 split windows from vertical to horizontal or vice versa
    vim.cmd('map <leader>th <C-w>t<C-w>H')
    vim.cmd('map <leader>tk <C-w>t<C-w>K')

-- Replace ex mode with gq
    vim.cmd('map Q gq')

-- Check file in shellcheck:
    vim.cmd('map <leader>s <CMD>!clear && shellcheck -x %<CR>')

-- Open my bibliography file in split
    vim.cmd('map <leader>b <CMD>vsp<space>$BIB<CR>')
    vim.cmd('map <leader>r <CMD>vsp<space>$REFER<CR>')

-- Replace all is aliased to S. (lua cannot do <CMD> without ending the value with <CR>)
    vim.cmd('nnoremap S :%s//g<Left><Left>')

-- Compile document, be it groff/LaTeX/markdown/etc.
    -- vim.cmd('map <leader>c <CMD>w! | !compiler "%:p"<CR>')

-- Open corresponding .pdf/.html or preview
    vim.cmd('map <leader>p <CMD>!opout "%:p"<CR>')

-- Load command shortcuts generated from bm-dirs and bm-files via shortcuts script.
-- Here leader is ";".
-- So ":vs ;cfz" will expand into ":vs /home/<user>/.config/zsh/.zshrc"
-- if typed fast without the timeout.
-- source ~/.config/nvim/shortcuts.vim
