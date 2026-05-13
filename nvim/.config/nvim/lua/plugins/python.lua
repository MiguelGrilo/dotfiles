return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                basedpyright = {
                    settings = {
                        basedpyright = {
                            analysis = {
                                typeCheckingMode = "basic", -- "standard" para ser mais rigoroso
                                autoImportCompletions = true,
                            },
                        },
                    },
                },
            },
        },
    },
}
