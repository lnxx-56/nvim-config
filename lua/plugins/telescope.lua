-- return {
--   {
--       'nvim-telescope/telescope-media-files.nvim'
--   }
-- }

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim', -- Improves fuzzy searching
      'nvim-telescope/telescope-media-files.nvim',
      'nvim-telescope/telescope-file-browser.nvim'
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--fixed-strings" -- Prevents issues with special characters
          },
          mappings = {
            i = {
              ["<Esc>"] = actions.close, -- Escape to close search
            }
          }
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          live_grep = {
            additional_args = function() return { "--hidden" } end,
          }
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            hidden = true,
            respect_gitignore = false
          },
          media_files = {
            filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
            find_cmd = "rg"
          }
        }
      })

      -- Load Extensions
      telescope.load_extension("fzf")
      telescope.load_extension("media_files")
      telescope.load_extension("file_browser")

      -- Custom function to filter file types
      local function find_files_with_extension(extension)
        require("telescope.builtin").find_files({
          prompt_title = "Find " .. extension .. " Files",
          find_command = { "rg", "--files", "--type=" .. extension }
        })
      end

      local function grep_files_with_extension(extension)
        require("telescope.builtin").live_grep({
          prompt_title = "Grep " .. extension .. " Files",
          additional_args = function() return { "--type=" .. extension } end
        })
      end
    end
  }
}
