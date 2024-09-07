return {
  {
  "pre-z/telescope-tmuxing.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    -- optionals
    "rcarriga/nvim-notify",
    "stevearc/dressing.nvim", -- for better input windows
  },
  opts = {
    extensions = {
      tmux = {
        use_nvim_notify = true, -- not necessary to specify the true value, if nvim_notify available it will be used, unless this is explicitly false
        create_session = { -- plenary configuration options
          scan_paths = {
            "~/workspace", -- current directory
          },
          scan_pattern = nil,
          scan_depth = 1,
          respect_gitignore = true,
          include_hidden_dirs = false,
          only_dirs = true,
          previewer_command = { "ls", "-la" },
        },
      },
    },
  },
  keys = { -- keymapping
    {
      "<leader>ts",
      "<cmd>lua require('telescope').extensions.tmux.switch_session({ list_sessions = 'simple'})<cr>",
      desc = "Swtich Tmux session",
    },
    {
      "<leader>tS",
      "<cmd>lua require('telescope').extensions.tmux.switch_window()<cr>",
      desc = "Switch Tmux window of current session",
    },
    {
      "<leader>ta",
      "<cmd>lua require('telescope').extensions.tmux.switch_session({ list_sessions = 'full'})<cr>",
      desc = "All other Tmux sessions and windows list",
    },
    {
      "<leader>tc",
      "<cmd>lua require('telescope').extensions.tmux.create_session()<cr>",
      desc = "Tmux create new sessions",
    },
    {
      "<leader>tC",
      "<cmd>lua require('telescope').extensions.tmux.create_window()<cr>",
      desc = "Tmux create new window",
    },

    {
      "<leader>=",
      "<cmd>lua require('telescope').extensions.tmux.switch_prev_session()<cr>",
      desc = "Tmux switch to previous session",
    },
    {
      "<leader>-",
      "<cmd>lua require('telescope').extensions.tmux.switch_prev_window()<cr>",
      desc = "Tmux switch to previous window",
    },

    {
      "<leader>tr",
      "<cmd>lua require('telescope').extensions.tmux.rename_current_session()<cr>",
      desc = "Rename current Tmux session",
    },
    {
      "<leader>tR",
      "<cmd>lua require('telescope').extensions.tmux.rename_current_window()<cr>",
      desc = "Rename current Tmux window",
    },
    {
      "<leader>tk",
      "<cmd>lua require('telescope').extensions.tmux.kill_current_session()<cr>",
      desc = "Kill current Tmux session",
    },
    {
      "<leader>tK",
      "<cmd>lua require('telescope').extensions.tmux.kill_current_window()<cr>",
      desc = "Kill current Tmux window",
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts) -- configure telescope with telescope-tmuxing plugin options
    require("telescope").load_extension("tmux") -- load tmux plugin
  end,
  }
}
