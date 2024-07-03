require('hurl').setup({
  debug = false,
  show_notification = false,
  mode = 'popup',        -- Change to 'popup' to display responses in a popup window
  -- mode = "split",
  env_file = { '.env.rest.local' }, -- Change this to use a different environment file name
  formatters = {
    json = { 'jq' },    -- Customize the JSON formatter command
    html = {
      'prettier',       -- Customize the HTML formatter command
      '--parser',
      'html',
    },
  },
})
