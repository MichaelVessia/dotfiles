
  return function(use)
    -- Enable telescope git-worktree, if installed
    --pcall(require('telescope').load_extension, 'git_worktree')
    

    use { 'alexghergh/nvim-tmux-navigation', config = function()
      require'nvim-tmux-navigation'.setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        }
      }
    end
    }

    -- Enable Whichkey
    use({
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup({})
      end
    })

    -- Enable dressing (UI styling)

    use {'stevearc/dressing.nvim',
    config = function()
      require("dressing").setup({
        input = {
          default_prompt = "➤ ",
          winhighlight = "Normal:Normal,NormalNC:Normal",
        },
        select = {
          backend = { "telescope", "builtin" },
          builtin = { winhighlight = "Normal:Normal,NormalNC:Normal" },
        }
      })
    end
  }

    use { 'epwalsh/obsidian.nvim',
      tag = 'v1.*',
      config = function() require("obsidian").setup({
        dir = "~/vault",
        completion = {
          nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        },
        note_id_func = function(title)
          -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
          local suffix = ""
          if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
          else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ in 1, 4 do
              suffix = suffix .. string.char(math.random(65, 90))
            end
          end
          return tostring(os.time()) .. "-" .. suffix
        end
      })
      end
    }

    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }
    use { 'rcarriga/nvim-notify', config = function () require("notify").setup { stages = 'fade_in_slide_out', background_colour = 'FloatShadow', timeout = 3000, } vim.notify = require('notify') end }
  end
