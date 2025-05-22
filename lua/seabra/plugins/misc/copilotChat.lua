return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "claude-sonnet-4",
      window = {
        -- layout = "float", 
        -- width = 0.7,
        -- height = 0.7,
        border = 'solid',
      },
      context = { "buffer", "filenames" }, -- Include both current buffer and filenames
      -- See Configuration section for options
    },
  },
}
