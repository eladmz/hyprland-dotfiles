-- remap leader key
vim.keymap.set("n", "<Space>", "", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.sets
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })
-- better indent handling
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- move text up and down
vim.keymap.set("v", "J", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

-- call vscode commands from neovim
vim.keymap.set({"n", "v"}, "]t", "<cmd>lua require('vscode').action('workbench.action.nextEditorInGroup')<CR>")
vim.keymap.set({"n", "v"}, "]b", "<cmd>lua require('vscode').action('workbench.action.nextEditorInGroup')<CR>")
vim.keymap.set({"n", "v"}, "[t", "<cmd>lua require('vscode').action('workbench.action.previousEditorInGroup')<CR>")
vim.keymap.set({"n", "v"}, "[b", "<cmd>lua require('vscode').action('workbench.action.previousEditorInGroup')<CR>")
vim.keymap.set({"n", "v"}, "<leader>w", "<cmd>lua require('vscode').action('workbench.action.files.save')<CR>")
vim.keymap.set({"n", "v"}, "<leader>q", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>")
vim.keymap.set({"n", "v"}, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
vim.keymap.set({"n", "v"}, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
vim.keymap.set({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
vim.keymap.set({"n", "v"}, "<leader>sv", "<cmd>lua require('vscode').action('workbench.action.splitEditor')<CR>")
vim.keymap.set({"n", "v"}, "<leader>sh", "<cmd>lua require('vscode').action('workbench.action.splitEditorDown')<CR>")
vim.keymap.set({"n", "v"}, "<C-h>", "<cmd>lua require('vscode').action('workbench.action.focusLeftGroup')<CR>")
vim.keymap.set({"n", "v"}, "<C-l>", "<cmd>lua require('vscode').action('workbench.action.focusRightGroup')<CR>")
vim.keymap.set({"n", "v"}, "<C-j>", "<cmd>lua require('vscode').action('workbench.action.focusBelowGroup')<CR>")
vim.keymap.set({"n", "v"}, "<C-k>", "<cmd>lua require('vscode').action('workbench.action.focusAboveGroup')<CR>")

vim.keymap.set({"n", "v"}, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
vim.keymap.set({"n", "v"}, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
vim.keymap.set({"n", "v"}, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
vim.keymap.set({"n", "v"}, "<leader>r", "<cmd>lua require('vscode').action('editor.action.rename')<CR>")

vim.keymap.set({"n", "v"}, "<leader>gd", "<cmd>lua require('vscode').action('gitlens.showQuickCommitDetails')<CR>")
vim.keymap.set({"n", "v"}, "<leader>gh", "<cmd>lua require('vscode').action('gitlens.quickOpenFileHistory')<CR>")
vim.keymap.set({"n", "v"}, "<leader>gb", "<cmd>lua require('vscode').action('gitlens.toggleFileBlame')<CR>")
vim.keymap.set({"n", "v"}, "<leader>l", "<cmd>lua require('vscode').action('turboConsoleLog.displayLogMessage')<CR>")

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
      vim.highlight.on_yank { higroup = 'IncSearch', timeout = 150 }
    end,
})