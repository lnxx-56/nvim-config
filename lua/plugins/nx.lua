-- use the original repository when the pr is merged!!!
-- "Equilibris/nx.nvim",
return {
  {
    "gnikolaos/nx.nvim", 

    lazy = false,
    branch = "fix/read-configs",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },

    opts  = {
      -- See below for config options
      nx_cmd_root = "npx nx",
    },

    -- Plugin will load when you use these keys
    keys = {
      { "<leader>nxa", "<cmd>Telescope nx actions<CR>", desc = "nx actions"},
      { "<leader>nxg", "<cmd>Telescope nx generators<CR>", desc = "nx generators" }
    },

    name = "nx"
  },
}
