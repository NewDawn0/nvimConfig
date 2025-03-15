require("neogen").setup({
  snippet_engine = "luasnip",
  languages = {
    sh = { template = { annotation_convention = "google_bash" }  },
    c = { template = { annotation_convention = "doxygen" }  },
    cs = { template = { annotation_convention = "doxygen" }  },
    cpp = { template = { annotation_convention = "doxygen" }  },
    go = { template = { annotation_convention = "godoc" }  },
    java = { template = { annotation_convention = "javadoc" }  },
    javascript = { template = { annotation_convention = "jsdoc" }  },
    javascriptreact = { template = { annotation_convention = "jsdoc" }  },
    julia = { template = { annotation_convention = "julia" }  },
    kotlin = { template = { annotation_convention = "kdoc" }  },
    lua = { template = { annotation_convention = "emmylua" }  },
    php = { template = { annotation_convention = "phpdoc" }  },
    python = { template = { annotation_convention = "numpydoc" }  },
    ruby = { template = { annotation_convention = "rdoc" }  },
    rust = { template = { annotation_convention = "rustdoc" }  },
    typescript = { template = { annotation_convention = "jsdoc" }  },
    typescriptreact = { template = { annotation_convention = "jsdoc" }  },
    vue = { template = { annotation_convention = "jsdoc" }  },
  },
})
require("lib.keys").setKb({
  {
    "<leader>cd",
    action = ":Neogen<cr>",
    desc = "Create documentation template",
    modes = {"n", "v"},
  },
})
