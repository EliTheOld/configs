--[[ require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python") ]]
require("dap-python").setup("/usr/bin/python")
require("dapui").setup()
table.insert(require("dap").configurations.python, {
})
local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
