-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- enable mason
mason.setup({
  ensure_installed = {
    "pyright",
    "rust_analyzer",
    "gopls",
  },
  automatic_installation = true,
})

mason_lspconfig.setup({
  ensure_installed = { "rust_analyzer", "gopls","pyright"}
})
