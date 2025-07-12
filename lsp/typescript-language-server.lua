return {
	init_options = { 
		hostInfo = 'neovim',
		plugins = {
			{
				name = '@vue/typescript-plugin',
				location = require('mason-registry').get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server',
				languages = { 'vue' },
			}, 
		},
	},
	cmd = { 'typescript-language-server', '--stdio' },
	filetypes = {
		'javascript',
		'javascriptreact',
		'javascript.jsx',
		'typescript',
		'typescriptreact',
		'typescript.tsx',
		'vue'
	},
	root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
}
