local fzf = require'fzf'.fzf
local action = require("fzf.actions").action
local fzf_helpers = require("fzf.helpers")
local core = require "fzf-lua.core"

local M = {}

M.tbgs = function()
  opts = {}
  query = vim.fn.input("TBGS: ")
  opts.fzf_fn = fzf_helpers.cmd_line_transformer("tbgs -i -n 100000 " .. query,
    function(x)
      return core.make_entry_file(opts, x)
    end
  )
  core.fzf_files(opts)
end

return M
