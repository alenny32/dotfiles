local n = 'n'
local v = 'v'
local i = 'i'
local nvo = {'n', 'v', 'o'} -- map

local function map(mode, key, value)
	vim.keymap.set(mode, key, value, { remap = true, silent = false })
end

local function noremap(mode, key, value)
	vim.keymap.set(mode, key, value, { remap = false, silent = false })
end

vim.g.mapleader = ','
vim.g.maplocalleader = ','

map(nvo, '<leader><leader>', '<CMD>keepp /<++><CR>ca<')
map(i, '<leader><leader>', '<CMD>keepp /<++><CR><ESC>ca<')

-- Copy selection to clipboard (xsel, xclip, or wl_copy and wl_paste required)
    map(v, '<C-y>', '"+y')

-- Compile LaTeX documents
    map(nvo, '<F2>', '<CMD>w<CR> <CMD>!pdflatex %<CR><CR>')
-- Open evince for pdf of current LaTeX
    map(nvo, '<F3>', "<CMD>!evince $(echo % | sed 's/tex$/pdf/') & disown<CR><CR>")

-- Keeping cursor in center for next/previous search occurence
    map(n, 'n', 'nzz')
    map(n, 'N', 'Nzz')

-- Mimic shell movements
    map(i, '<C-E>', '<C-o>$')
    map(i, '<C-A>', '<C-o>^')

-- Quickly save the current buffer or all buffers
    map(n, '<leader>w', '<CMD>update<CR>')
    map(n, '<leader>W', '<CMD>wall<CR>')

-- Quit neovim
    map(n, '<C-Q>', '<CMD>q<CR>')

-- Move to the next, previous, or last buffer
    map(n, '<leader>[', '<CMD>bp<CR>')
    map(n, '<leader>]', '<CMD>bn<CR>')
    map(n, '<leader>\\', '<CMD>bn<CR>')

-- Copying the vscode behaviour of making tab splits
    map(n, '<C-\\>', '<CMD>vsplit<CR>')
    map(n, '<A-\\>', '<CMD>split<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
    map(nvo, '<A-j>', '<CMD>move .+1<CR>')
    map(nvo, '<A-k>', '<CMD>move .-2<CR>')

-- Perform dot commands over visual blocks:
    vim.cmd.vnoremap('. :normal .<CR>')
-- Spell-check set to <leader>o, 'o' for 'orthography'<CMD>
    map(nvo, '<leader>o', '<CMD>setlocal spell! spelllang=en_us<CR>')

-- Shortcutting split navigation, saving a keypress:
    map(nvo, '<C-h>', '<C-w>h')
    map(nvo, '<C-j>', '<C-w>j')
    map(nvo, '<C-k>', '<C-w>k')
    map(nvo, '<C-l>', '<C-w>l')

-- Replace ex mode with gq
    map(nvo, 'Q', 'gq')

-- Check file in shellcheck:
    map(nvo, '<leader>s', '<CMD>!clear && shellcheck -x %<CR>')

-- Open my bibliography file in split
    map(nvo, '<leader>b', '<CMD>vsp<space>$BIB<CR>')
    map(nvo, '<leader>r', '<CMD>vsp<space>$REFER<CR>')

-- Replace all is aliased to S. (lua cannot do <CMD> without ending the value with <CR>)
    vim.cmd.nnoremap('S :%s//g<Left><Left>')

-- Compile document, be it groff/LaTeX/markdown/etc.
    map(nvo, '<leader>c', '<CMD>w! | !compiler "%:p"<CR>')

-- Open corresponding .pdf/.html or preview
    map(nvo, '<leader>p', '<CMD>!opout "%:p"<CR>')

-- Load command shortcuts generated from bm-dirs and bm-files via shortcuts script.
-- Here leader is ";".
-- So ":vs ;cfz" will expand into ":vs /home/<user>/.config/zsh/.zshrc"
-- if typed fast without the timeout.
-- source ~/.config/nvim/shortcuts.vim