return {
  "carlos-algms/agentic.nvim",

  ---@type agentic.PartialUserConfig
  opts = {
    provider = "copilot-acp",
  },

  keys = {
    {
      "<leader>\\",
      function()
        require("agentic").toggle()
      end,
      mode = { "n", "v", "i" },
      desc = "Toggle Agentic chat",
    },
    {
      "<leader>ac",
      function()
        require("agentic").add_selection_or_file_to_context()
      end,
      mode = { "n", "v" },
      desc = "Add file or selection to Agentic context",
    },
    {
      "<leader>an",
      function()
        require("agentic").new_session()
      end,
      mode = { "n", "v", "i" },
      desc = "New Agentic session",
    },
    {
      "<leader>ar",
      function()
        require("agentic").restore_session()
      end,
      desc = "Restore Agentic session",
      silent = true,
      mode = { "n", "v", "i" },
    },
    {
      "<leader>ad",
      function()
        require("agentic").add_current_line_diagnostics()
      end,
      desc = "Add line diagnostics to Agentic",
      mode = "n",
    },
    {
      "<leader>aD",
      function()
        require("agentic").add_buffer_diagnostics()
      end,
      desc = "Add buffer diagnostics to Agentic",
      mode = "n",
    },
  },
}
