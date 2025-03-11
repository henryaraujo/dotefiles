vim.opt.backup = false
vim.opt.number = true
vim.opt.encoding = "utf-8"
vim.opt.cursorline = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true -- Usar espaços em vez de tabulações
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = true
-- filetype plugin indent on
vim.opt.termguicolors = true
--vim.opt.t_Co= 256
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 250
vim.opt.shell = '"C:\\Program Files\\Git\\bin\\bash.exe"'
vim.opt.mouse = ""
-- vim.opt.guifont = "FiraCode"
vim.api.nvim_create_autocmd("CursorHold", {
  buffer = 0,
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
