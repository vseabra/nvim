return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			local dap = require("dap")
			vim.fn.sign_define('DapBreakpoint', {text='⚑', texthl='red', linehl='', numhl=''})
			local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
			require("dap.ext.vscode").load_launchjs()

			local function get_arguments()
				return coroutine.create(function(dap_run_coroutine)
					local args = {}

					vim.ui.input({ prompt = "Args: " }, function(input)
						args = vim.split(input or "", " ")
					end)

					coroutine.resume(dap_run_coroutine, args)
				end)
			end

			local function get_process_id()
				local name = vim.fn.input("Executable name (filter): ")
				return require("dap.utils").pick_process({ filter = name })
			end

			--- BEGIN GO CONFIG ---

			dap.adapters.go_remote = {
				type = "server",
				host = "127.0.0.1",
				port = 2345,
			}

			dap.adapters.delve = function(callback, config)
				if config.mode == "remote" and config.request == "attach" then
					callback({
						type = "server",
						host = config.host or "127.0.0.1",
						port = config.port or "38697",
					})
				else
					callback({
						type = "server",
						port = "${port}",
						executable = {
							command = "dlv",
							args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
							detached = vim.fn.has("win32") == 0,
						},
					})
				end
			end

			dap.configurations.go = {
				{
					type = "delve",
					name = "[launch] delve",
					request = "launch",
					showLog = false,
					program = "${file}",
				},
				{
					type = "delve",
					name = "[attach] delve - attach to running process",
					request = "attach",
					processId = get_process_id,
					showLog = false,
				},
				{
					type = "delve",
					name = "[launch] delve - with args",
					request = "launch",
					showLog = false,
					program = "${file}",
					args = get_arguments,
				},
				{
					type = "delve",
					name = "[launch] delve - test file", -- configuration for debugging test files
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
				},
				{
					type = "go_remote",
					request = "attach",
					name = "[attach] delve - remote",
					mode = "remote",
					substitutePath = {
						{
							from = "${workspaceFolder}",
							to = "/<PROJECT ROOT FOLDER>/",
						},
					},
					connect = function()
						local host = vim.fn.input("Host [127.0.0.1]: ")
						host = host ~= "" and host or "localhost"
						local port = tonumber(vim.fn.input("Port [<DEBUG_PORT>]: "))
						port = port ~= "" and port or 2345
						return { host = host, port = port }
					end,
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
						name = "[launch] pwa node",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
				}
			end

			--- END JS CONFIG ---

			--- BEGIN RUST CONFIG
			dap.adapters.codelldb = {
				type = "executable",
				command = "codelldb",
			}

			dap.configurations.rust = {
				{
					name = "[launch] codelldb",
					type = "codelldb",
					request = "launch",
					program = function()
						-- vim.fn.jobstart("cargo build")
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					runInTerminal = true,
				},
				{
					name = "[launch] codelldb - attach to running process",
					type = "codelldb",
					request = "attach",
					pid = get_process_id,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					runInTerminal = true,
				},
				{
					name = "[launch] codelldb - with args",
					type = "codelldb",
					request = "launch",
					program = function()
						-- vim.fn.jobstart("cargo build")
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = get_arguments,
				},
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			dapui.setup({
				controls = {
					element = "repl",
					enabled = true,
					icons = {
						disconnect = "𜰔",
						pause = "⏸",
						play = "‣",
						run_last = "↺",
						step_back = "⭦",
						step_into = "↓",
						step_out = "↑",
						step_over = "⭧",
						terminate = "⏻",
					},
				},
				element_mappings = {},
				expand_lines = true,
				floating = {
					border = "single",
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
				force_buffers = true,
				icons = {
					collapsed = "",
					current_frame = "",
					expanded = "",
				},
				layouts = {
					{
						elements = {
							{
								id = "scopes",
								size = 0.25,
							},
							{
								id = "breakpoints",
								size = 0.25,
							},
							{
								id = "stacks",
								size = 0.25,
							},
							{
								id = "watches",
								size = 0.25,
							},
						},
						position = "left",
						size = 40,
					},
					{
						elements = {
							{
								id = "repl",
								size = 0.5,
							},
							{
								id = "console",
								size = 0.5,
							},
						},
						position = "bottom",
						size = 10,
					},
				},
				mappings = {
					edit = "e",
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					repl = "r",
					toggle = "t",
				},
				render = {
					indent = 1,
					max_value_lines = 100,
				},
			})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		config = true,
	},
}
