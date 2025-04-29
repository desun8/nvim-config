return {
	init_options = {
		hostInfo = 'neovim',    
		typescript = {
			tsdk = require('mason-registry').get_package('vue-language-server'):get_install_path() .. '/node_modules/typescript/lib'
		},
	},
	cmd = { 'vue-language-server', '--stdio' },
	filetypes = {
		'vue'
	},
	root_markers = { 'package.json', '.git' },
}
