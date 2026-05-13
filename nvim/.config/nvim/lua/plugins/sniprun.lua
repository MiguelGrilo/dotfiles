return {
  {
    "michaelb/sniprun",
    build = "sh ./install.sh",
    keys = {
      -- Podes usar <leader>rr (Barra de Espaço + r + r) para correr o código
      { "<leader>rr", "<Plug>SnipRun", mode = { "n", "v" }, desc = "Executar bloco de código" },
    },
  },
}
