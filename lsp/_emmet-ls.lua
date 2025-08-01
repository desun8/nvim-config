
return {
  cmd = { 'emmet-ls', '--stdio' },
  filetypes = { 'css', 'scss', 'less', 'html' },
  root_markers = { 'package.json', '.git' },
  init_options = {provideFormatter = true,
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
}
