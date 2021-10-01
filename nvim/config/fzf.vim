lua <<EOF
require'fzf-lua'.setup {
  default_previewer = "bat",
  previewers = {
    bat = {
      cmd             = "bat",
      args            = "--style=numbers,changes --color always",
      theme           = 'TwoDark', -- bat preview theme (bat --list-themes)
      config          = nil,            -- nil uses $BAT_CONFIG_PATH
    },
  builtin = {
      title           = false,         -- preview title?
      scrollbar       = true,         -- scrollbar?
      scrollchar      = '█',          -- scrollbar character
      wrap            = false,        -- wrap lines?
      syntax          = false,         -- preview syntax highlight?
      syntax_limit_l  = 0,            -- syntax limit (lines), 0=nolimit
      syntax_limit_b  = 1024*1024,    -- syntax limit (bytes), 0=nolimit
      expand          = false,        -- preview max size?
      hl_cursor       = 'Cursor',     -- cursor highlight
      hl_cursorline   = 'CursorLine', -- cursor line highlight
      hl_range        = 'IncSearch',  -- ranger highlight (not yet in use)
      keymap = {
        toggle_full   = '<F2>',       -- toggle full screen
        toggle_wrap   = '<F3>',       -- toggle line wrap
        toggle_hide   = '<F4>',       -- toggle on/off (not yet in use)
        page_up       = '<S-up>',     -- preview scroll up
        page_down     = '<S-down>',   -- preview scroll down
        page_reset    = '<S-left>',      -- reset scroll to orig pos
      }
    }
  }
}
EOF
map <C-p> :FzfLua git_files <CR>
command! -nargs=0 Rg :FzfLua live_grep
