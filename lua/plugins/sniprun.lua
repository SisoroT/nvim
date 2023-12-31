-- quickly run code
return {
	"michaelb/sniprun",
	build = "bash ./install.sh",
	keys = {
		{ "<leader>sr", "<cmd>%SnipRun<CR> `. zz" },
		{ "<leader>sr", "<Plug>SnipRun", mode = "v" },
	},
}
