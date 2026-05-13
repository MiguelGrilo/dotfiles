-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Atalhos Personalizados para Python / Data Science
local map = vim.keymap.set

-- Executar o ficheiro atual inteiro (Space + c + p)
map("n", "<leader>cp", ":!python3 %<CR>", { desc = "Executar ficheiro Python atual" })

-- Abrir o menu para escolher o Venv (Space + c + v)
map("n", "<leader>cv", "<cmd>VenvSelect<CR>", { desc = "Selecionar Ambiente Virtual (Venv)" })

-- Correr testes unitários (Space + c + t)
map("n", "<leader>ct", function() require("neotest").run.run() end, { desc = "Correr teste atual" })
