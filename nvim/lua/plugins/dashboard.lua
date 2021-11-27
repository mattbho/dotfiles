local g = vim.g
g.dashboard_default_executive = 'telescope'
g.dashboard_session_directory = '~/.config/nvim/.sessions'g.dashboard_custom_section = {
    a = {description = {"  Find File                "}, command = "Telescope find_files"},
    b = {description = {"  Recents                  "}, command = "Telescope oldfiles"},
    c = {description = {"  Find Word                "}, command = "Telescope live_grep"},
    d = {description = {"  New File                 "}, command = "DashboardNewFile"},
    g = {description = {"  Update Plugins           "}, command = "PackerSync"},
    h = {description = {"  Settings                 "}, command = "edit $MYVIMRC"},
    i = {description = {"  Exit                     "}, command = "exit"}
}
