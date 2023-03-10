local o = vim.o

-- Function for toggling the bottom statusbar:
local HiddenAll = 0
function ToggleHiddenAll()
    if hidden_all == 0 then
        hidden_all = 1
        o.showmode = true
        o.ruler = true
        o.laststatus = 0
        o.showcmd = true
    else
        hidden_all = 0
        o.showmode = false
        o.ruler = false
        o.laststatus = 2
        o.showcmd = false
    end
end
vim.keymap.set({'n', 'v', 'o'}, '<leader>h', ToggleHiddenAll)

-- Function for cycling themes (onedark, dracula):
local theme = 0
function CycleThemes()
    if theme == 0 then
        vim.cmd.source('$XDG_CONFIG_HOME/nvim/themes/onedark.vim')
        theme = theme + 1
    elseif theme == 1 then
        vim.cmd.source('$XDG_CONFIG_HOME/nvim/themes/dracula.vim')
        theme = theme + 1
    elseif theme == 2 then
        vim.cmd.source('$XDG_CONFIG_HOME/nvim/themes/tokyonight-night.vim')
        theme = theme + 1
    elseif theme == 3 then
        vim.cmd.source('$XDG_CONFIG_HOME/nvim/themes/tokyonight-moon.vim')
        theme = theme + 1
    elseif theme == 4 then
        vim.cmd.source('$XDG_CONFIG_HOME/nvim/themes/tokyonight-storm.vim')
        theme = theme + 1
    elseif theme == 5 then
        vim.cmd.source('$XDG_CONFIG_HOME/nvim/themes/tokyonight-day.vim')
        theme = 0
    end
end
vim.keymap.set({'n', 'v', 'o'}, '<leader>tt', CycleThemes)
