local setup, comment = pcall(require, "Comment")
if not setup then
  return
end

-- enable comment
comment.setup{
  opleader = {
    line = "gc",
    block = "gb",
  },
  mappings = {
    basic = true,
    extra = true,
  },
}

