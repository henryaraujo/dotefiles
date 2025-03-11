local map = vim.keymap.set

-- local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- Tabs
map('n', '<leader>t', ':tabnew<CR>', opts)
for i = 1, 9 do
  map('n', '<leader>' .. i, i .. 'gt', opts)
end
map('n', '<leader>l', ':tablast<CR>', opts)
map('n', '<leader>w', ':tabclose<CR>', opts)
map('n', '<Tab>', ':tabnext<CR>', opts)
map('n', '<S-Tab>', ':tabprevious<CR>', opts)

-- Editor
-- Save file
map('n', '<C-s>', ':w<CR>', opts)
-- Open new window
map('n', '<leader>n', ':new<CR>', opts)
-- Open file explorer
map('n', '<leader>fe', ':Ex<CR>', opts)
-- Move lines
map('n', '<C-Up>', ':m .-2<CR>==', opts)
map('n', '<C-Down>', ':m .+1<CR>==', opts)
map('v', '<C-Down>', ":m '>+1<CR>gv=gv", opts)
map('v', '<C-Up>', ":m '<-2<CR>gv=gv", opts)

--Indent lines
map('n', '<', '<<', opts)
map('n', '>', '>>', opts)
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- format code
map("n", "<leader>{", ":lua require('conform').format()<CR>", opts)

for _, key in ipairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
  map('n', key, '<NOP>', opts) -- Modo Normal
  map('v', key, '<NOP>', opts) -- Modo Visual
end

-- Resize windows with Alt + hjkl
map('n', '<C-j>', ':resize -2<CR>', opts)
map('n', '<C-k>', ':resize +2<CR>', opts)
map('n', '<C-h>', ':vertical resize -2<CR>', opts)
map('n', '<C-l>', ':vertical resize +2<CR>', opts)

-- Opens a new terminal in vertical split
-- map('n', '<leader>b', ':term<CR>', opts)
map('n', '<leader>b', ':split | terminal<CR>', opts)
map('t', '<leader>n', '<C-\\><C-n>', opts)

-- EASY CAPS - Shift + u = upper case, u = lower case
map('i', '<C-u>', '<ESC>viwUi', { noremap = true })
map('n', '<S-u>', 'viwU<ESC>', { noremap = true })

-- Copy lines in visual mode
map('v', '<C-c>', '"+y', { noremap = true })

-- Change all occurrences for the text that you have typed
map('n', '<leader>r', ':%s///g<Left><Left>', opts)
map('n', '<leader>rc', ':%s///gc<Left><Left><Left>', opts)

-- Change occurrences in visual mode
map('x', '<leader>r', ':s///g<Left><Left>', opts)
map('x', '<leader>rc', ':s///gc<Left><Left><Left>', opts)

-- telescope open
-- map('n', '<C-f>', ':Telescope live_grep<CR>', opts)
-- map('n', '<C-p>', ':Telescope find_files<CR>', opts)
-- Lsp float diagnostic
map('n', '<leader>d', vim.diagnostic.open_float, opts)
