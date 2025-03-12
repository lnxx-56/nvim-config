return {
  {
    "mcauley-penney/visual-whitespace.nvim",
    opts = {
      highlight = { link = "Visual" },
      space_char = "",
      tab_char = "",
      nl_char = "↲",
      cr_char = "",
    },
    config = function(_, opts)
      require("visual-whitespace").setup(opts)
    end,
  }
}
