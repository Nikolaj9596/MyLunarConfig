local ok, ai = pcall(require, "codecompanion")
if not ok then
  return
end

ai.setup {
  strategies = {
    chat = {
      adapter = "deepseek",
    },
    inline = {
      adapter = "deepseek",
    },
    cmd = {
      adapter = "deepseek",
    },
  },
  adapters = {
    openai = function()
      return require("codecompanion.adapters").extend("deepseek", {
        env = {
          api_key = "sk-b30a45076e444ffdb2a153e61576fefc",
        },
      })
    end,
  },
  extensions = {
    mcphub = {
      callback = "mcphub.extensions.codecompanion",
      opts = {
        make_vars = true,
        make_slash_commands = true,
        show_result_in_chat = true,
      },
    },
  },
}
