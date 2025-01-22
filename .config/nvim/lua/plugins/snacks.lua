return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      enabled = true,
    },
    input = { enabled = true },
    gitbrowse = { enabled = true },
    terminal = { enabled = true },
  },
  keys = {
    {
      "<leader>gh",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
    },
    {
      "<leader>t",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle terminal",
    },
  },
}
