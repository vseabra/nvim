return {
	"axkirillov/easypick.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		local easypick = require("easypick")

		local list_make_targets = [[
make -qp |
awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}' |
grep -wv Makefile
]]
    local command_list = [[
    << EOF
    :Mason
    :Telescope find_files
    :Git blame
    EOF
    ]]

		easypick.setup({
			pickers = {
				{
					name = "make_targets",
					command = list_make_targets,
					action = easypick.actions.nvim_commandf("term make %s"),
				},
				{
					name = "command_palette",
					command = "cat " .. command_list,
					action = easypick.actions.nvim_commandf("%s"),
				},
			},
		})
	end,
}
