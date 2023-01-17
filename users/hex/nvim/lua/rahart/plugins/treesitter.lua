local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = { "yaml", "json", "go", "rust", "python", "lua" },
  sync_install = false,
  ignore_install = {""},
  highlight = {
    enable = true,
    disable = {""},
  },
  indent = {
    enable = true,
    disable = {
      "yaml"
    },
  }
}
