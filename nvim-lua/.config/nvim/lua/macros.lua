-- This is a neovim config for defining macros

local n = "n"
local v = "v"
local i = "i"
local nvo = {"n", "v", "o"} -- map

-- local function map(mode, key, value)
    -- vim.keymap.set(mode, key, value, { remap = true, silent = true })
-- end

-- local function noremap(mode, key, value)
    -- vim.keymap.set(mode, key, value, { remap = false, silent = true })
-- end

-- LaTeX:
    -- Compile
        -- vim.cmd("imap <F2> <CMD>w<CR> <CMD>!pdflatex %<CR><CR>")
    -- Add section
        -- vim.cmd("map <leader>.a i\\section{}\n\n<++><ESC>kk\$i")
        -- vim.cmd("imap <leader>.a \\section{}\n\n<++><ESC>kk\$i")
    -- Add subsection
        -- vim.cmd("map <leader>.A i\\subsection{}\n\n<++><ESC>kk\$i")
        -- vim.cmd("imap <leader>.A \\subsection{}\n\n<++><ESC>kk\$i")
    -- Insert table environment
        -- vim.cmd("map <leader>.t i\\begin{table}[htbp]\n\\caption{<++>}\n\\centering\n\\begin{tabular}{|c|c|}\n<++>\n\\end{tabular}\n\\label{tab:<++>}\n\\end{table}%<ESC>{j^")
        -- vim.cmd("imap <leader>.t \\begin{table}[htbp]\n\\caption{<++>}\n\\centering\n\\begin{tabular}{|c|c|}\n<++>\n\\end{tabular}\n\\label{tab:<++>}\n\\end{table}%<ESC>{j^")
    -- -- Insert \hline
    --     -- below current line
    --         vim.cmd("map <leader>.h o\\hline<ESC>")
    --         vim.cmd("imap <leader>.h <ESC>o\\hline<ESC>")
    --     -- above current line
    --         vim.cmd("map <leader>.H O\\hline<ESC>")
    --         vim.cmd("imap <leader>.H <ESC>O\\hline<ESC>")
    -- Insert figure environment
        -- vim.cmd("map <leader>.f i\\begin{figure}[htbp]\n\\centering\n<++>\n\\caption{<++>}\n\\label{fig:<++>}\n\\end{figure}%<ESC>{j^")
        -- vim.cmd("imap <leader>.f \\begin{figure}[htbp]\n\\centering\n<++>\n\\caption{<++>}\n\\label{fig:<++>}\n\\end{figure}%<ESC>{j^")
