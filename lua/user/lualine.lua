-- if lvim.colorscheme == "darkplus" then
-- if lvim.colorscheme == "gruvbox" then
-- if lvim.colorscheme == "lunar" then
if lvim.colorscheme == "onedark" then
  -- if lvim.colorscheme == "solarized-osaka" then
  -- if lvim.colorscheme == "catppuccin-macchiato" then
  local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)
  vim.api.nvim_create_autocmd({ "Colorscheme" }, {
    callback = function()
      vim.api.nvim_set_hl(0, "SLGitIconDark", { fg = "#E8AB53", bg = "#333333" })
      vim.api.nvim_set_hl(0, "SLBranchNameDark", { fg = normal_hl.foreground, bg = "#333333" })

      vim.api.nvim_set_hl(0, "ObsidianTodo", { bold = true, fg = "#f78c6c" })
      vim.api.nvim_set_hl(0, "ObsidianDone", { bold = true, fg = "#89ddff" })
      vim.api.nvim_set_hl(0, "ObsidianRightArrow", { bold = true, fg = "#f78c6c" })
      vim.api.nvim_set_hl(0, "ObsidianTilde", { bold = true, fg = "#ff5370" })
      vim.api.nvim_set_hl(0, "ObsidianImportant", { bold = true, fg = "#d73128" })
      vim.api.nvim_set_hl(0, "ObsidianBullet", { bold = true, fg = "#89ddff" })
      vim.api.nvim_set_hl(0, "ObsidianRefText", { underline = true, fg = "#c792ea" })
      vim.api.nvim_set_hl(0, "ObsidianExtLinkIcon", { fg = "#c792ea" })
      vim.api.nvim_set_hl(0, "ObsidianTag", { italic = true, fg = "#89ddff" })
      vim.api.nvim_set_hl(0, "ObsidianBlockID", { italic = true, fg = "#89ddff" })
      vim.api.nvim_set_hl(0, "ObsidianHighlightText", { bg = "#75662e" })
    end,
  })

  local branch_icon = "%#SLGitIconDark#" .. lvim.icons.git.Branch .. "%*" .. "%#SLBranchNameDark#"

  local branch = {
    "b:gitsigns_head",
    icon = branch_icon,
    color = { gui = "bold" },
  }

  lvim.builtin.lualine.sections.lualine_b = { branch }
end
