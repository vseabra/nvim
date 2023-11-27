return {
  {
    "zbirenbaum/copilot.lua",
    event = { "InsertEnter", "LspAttach" },
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    }
  },
  {
    "zbirenbaum/copilot-cmp",
    config = true
  }
}
