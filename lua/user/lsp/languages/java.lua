vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

-- Set a formatter.
local jdtls_opts = {
  settings = {
    java = {
      project = {
        referencedLibraries = {
          -- "/home/nikolaj/Universety/Java/Spring Boot/lab1/target/praktik1-0.0.1-SNAPSHOT.jar",
          "/home/nikolaj/Universety/Java/Spring Boot/laba2/target/laba2-0.0.1-SNAPSHOT.jar"
        },
      },
    },
  },
}
require("lvim.lsp.manager").setup("jdtls", jdtls_opts)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "google_java_format", filetypes = { "java" } },
}
