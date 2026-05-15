local map = vim.keymap.set

-- Executar o ficheiro atual inteiro (Space + c + p)
map("n", "<leader>cp", ":!python3 %<CR>", { desc = "Executar ficheiro Python atual" })

-- Abrir o menu para escolher o Venv (Space + c + v)
map("n", "<leader>cv", "<cmd>VenvSelect<CR>", { desc = "Selecionar Ambiente Virtual (Venv)" })

-- Correr testes unitários (Space + c + t)
map("n", "<leader>ct", function() require("neotest").run.run() end, { desc = "Correr teste atual" })


-- ==========================================
-- Atalhos Familiares (Estilo IDE / Nano / VS Code)
-- ==========================================

-- Sair de tudo rapidamente (Ctrl + Q)
map({ "i", "v", "n", "s" }, "<C-q>", "<cmd>qa<cr><esc>", { desc = "Sair de Tudo" })

-- Guardar o ficheiro (Ctrl + S)
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Guardar ficheiro" })

-- Desfazer (Ctrl + Z) e Refazer (Ctrl + Y)
map({ "i", "n", "v" }, "<C-z>", "<cmd>undo<cr>", { desc = "Desfazer" })
map({ "i", "n", "v" }, "<C-y>", "<cmd>redo<cr>", { desc = "Refazer" })

-- Selecionar Tudo (Ctrl + A)
map({ "i", "n", "v" }, "<C-a>", "<esc>ggVG", { desc = "Selecionar Tudo" })


-- ==========================================
-- Área de Transferência do Sistema
-- ==========================================

-- Copiar (Ctrl + C) no modo visual para poderes colar no Browser, Discord, etc.
map("v", "<C-c>", '"+y', { desc = "Copiar para o Sistema" })

-- Cortar (Ctrl + X) no modo visual
map("v", "<C-x>", '"+d', { desc = "Cortar para o Sistema" })

-- Colar (Ctrl + V) em qualquer modo (trazendo o texto de fora do Neovim)
map({ "n", "v" }, "<C-v>", '"+p', { desc = "Colar do Sistema" })
map("i", "<C-v>", "<C-r>+", { desc = "Colar do Sistema no modo de Inserção" })

-- ==========================================
-- Produtividade & Navegação
-- ==========================================

-- Comentar / Descomentar código (Ctrl + /)
map("n", "<C-_>", "gcc", { desc = "Comentar linha", remap = true })
map("v", "<C-_>", "gc", { desc = "Comentar seleção", remap = true })

-- Mover a linha/seleção atual para cima ou para baixo (Alt + Setas)
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Mover linha para baixo" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Mover linha para cima" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Mover linha para baixo" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Mover linha para cima" })
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Mover seleção para baixo" })
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Mover seleção para cima" })

-- Alternar Terminal Flutuante rapidamente (Ctrl + T)
map({ "n", "t" }, "<C-t>", function() require("snacks").terminal.toggle() end, { desc = "Alternar Terminal Flutuante" })

-- ==========================================
-- Gestão de Abas e Git
-- ==========================================

-- Fechar o ficheiro/aba atual sem fechar o Neovim (Ctrl + W)
map("n", "<C-w>", function() require("snacks").bufdelete() end, { desc = "Fechar Aba Atual" })

-- Abrir o Lazygit numa janela flutuante (Ctrl + G)
map("n", "<C-g>", function() require("snacks").lazygit() end, { desc = "Abrir Lazygit" })

-- ==========================================
-- Pesquisa e Formatação
-- ==========================================

-- Pesquisar no ficheiro visualmente (Ctrl + F)
map({ "n", "i", "v" }, "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Pesquisar no Ficheiro" })

-- Formatar o código (Alt + Shift + F)
-- (Nota: O LazyVim usa o formatador correspondente à linguagem, ex: Ruff para Python)
map({ "n", "v", "i" }, "<M-S-f>", function() require("conform").format({ lsp_fallback = true }) end, { desc = "Formatar Código" })

-- ==========================================
-- Refatorização e Duplicação
-- ==========================================

-- Duplicar a linha atual para baixo (Shift + Alt + Baixo)
map("n", "<S-A-Down>", "yyp", { desc = "Duplicar linha" })
map("i", "<S-A-Down>", "<esc>yypi", { desc = "Duplicar linha" })
map("v", "<S-A-Down>", "y`>pgv", { desc = "Duplicar seleção" })

-- Renomear Variável em todo o código em tempo real (F2)
map("n", "<F2>", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Renomear Variável" })

-- Ir para a Definição da função/classe (F12)
map("n", "<F12>", vim.lsp.buf.definition, { desc = "Ir para a Definição" })

-- ==========================================
-- Navegação de Erros e Painéis
-- ==========================================

-- Saltar para o próximo Erro/Aviso (F8) e Anterior (Shift + F8)
map("n", "<F8>", vim.diagnostic.goto_next, { desc = "Próximo Erro" })
map("n", "<S-F8>", vim.diagnostic.goto_prev, { desc = "Erro Anterior" })

-- Dividir o ecrã verticalmente (Alt + \)
map("n", "<M-\\>", "<cmd>vsplit<cr>", { desc = "Dividir Ecrã Verticalmente" })

-- Fechar a divisão atual (Alt + Q)
map("n", "<M-q>", "<cmd>close<cr>", { desc = "Fechar Painel Atual" })

-- ==========================================
-- Inteligência Artificial (Codeium)
-- ==========================================

-- Abrir o Chat do Codeium no painel lateral (Alt + C)
-- Perfeito para pedires refatorações ou explicações de código
map({ "n", "v", "i" }, "<M-c>", "<cmd>Codeium Chat<cr>", { desc = "Abrir Codeium Chat" })

-- Atalhos para gerir o código gerado em tempo real (Ghost Text)
-- Aceitar a sugestão atual por inteiro (Alt + Enter)
map("i", "<M-CR>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true, desc = "Aceitar sugestão IA" })

-- Ver próxima sugestão (Alt + Seta Direita) e sugestão anterior (Alt + Seta Esquerda)
map("i", "<M-Right>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true, silent = true, desc = "Próxima Sugestão IA" })
map("i", "<M-Left>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true, silent = true, desc = "Sugestão IA Anterior" })

-- Limpar a sugestão do ecrã se estiver a atrapalhar (Alt + Backspace)
map("i", "<M-BS>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true, desc = "Limpar Sugestão IA" })
