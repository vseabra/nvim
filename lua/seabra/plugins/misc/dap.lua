return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			local dap = require("dap")
			local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")

			--- BEGIN GO CONFIG ---

			local function get_arguments()
				return coroutine.create(function(dap_run_coroutine)
					local args = {}

					vim.ui.input({ prompt = "Args: " }, function(input)
						args = vim.split(input or "", " ")
					end)

					coroutine.resume(dap_run_coroutine, args)
				end)
			end

			dap.adapters.delve = {
				type = "server",
				port = "${port}",
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:${port}" },
				},
			}

			dap.configurations.go = {
				{
					type = "delve",
					name = "Debug",
					request = "launch",
					showLog = false,
					program = "${file}",
				},

				{
					type = "delve",
					name = "Debug (with arguments)",
					request = "launch",
					showLog = false,
					program = "${file}",
					args = get_arguments,
				},
				{
					type = "delve",
					name = "Debug test", -- configuration for debugging test files
					request = "launch",
					mode = "test",
					program = "${file}",
				},
				{
					type = "delve",
					name = "Debug test (go.mod)", -- works with go.mod packages and sub packages
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
				},
			}

			--- END GO CONFIG ---

			--- BEGIN JS CONFIG ---
			local js_based_languages = { "typescript", "javascript", "typescriptreact" }

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = { "-r", mason_path .. "bin/js-debug/src/dapDebugServer.js ", "${port}" },
				},
			}

			for _, language in ipairs(js_based_languages) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
				}
			end

			--- END JS CONFIG ---
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			-- dap.listeners.before.event_exited["dapui_config"] = function()
			-- 	dapui.close({})
			-- end
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		config = true,
	},
}
