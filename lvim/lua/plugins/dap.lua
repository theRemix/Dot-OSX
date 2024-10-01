--[[
.  _
 _| |___ ___
| . | .'| . |
|___|__,|  _|
.       |_|

Debugger Adapter Protocol

See :help dap-adapter
See :help dap-configuration
See :help dap-mappings
See :help dap-go
See :help dap-vscode-js

--]]

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
table.insert(lvim.plugins, { "mfussenegger/nvim-dap" })
table.insert(lvim.plugins, { "nvim-neotest/nvim-nio" })
table.insert(lvim.plugins, {
	"folke/neodev.nvim",
	dependencies = { "rcarriga/nvim-dap-ui" },
	config = function()
		local ok, neodev = pcall(require, "neodev")
		if ok then
			neodev.setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})
		end
	end,
})

table.insert(lvim.plugins, {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
})

table.insert(lvim.plugins, {
	"ravenxrz/DAPInstall.nvim",
	config = function()
		local ok, dap_install = pcall(require, "dap-install")
		if ok then
			dap_install.setup({
				installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
			})
			dap_install.config("go_delve", {})
			dap_install.config("jsnode", {})
			dap_install.config("python", {})
		end
	end,
})

-----------------------------------------------------------
-- Configurations
-----------------------------------------------------------

local dap, dapui = require("dap"), require("dapui")

dapui.setup()

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			type = "jsnode",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			skipFiles = { "<node_internals>/**", "node_modules/**" },
		},
		{
			type = "jsnode",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
	}
end

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

vim.fn.sign_define("DapBreakpoint", { text = "⬤", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⏭", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
