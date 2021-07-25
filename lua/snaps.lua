local snap = require'snap'
local selectFile = snap.get'select.file'
local io = require("snap.common.io")
local positions = snap.get("consumer.positions")
local tbl = snap.get("common.tbl")
local fzf = snap.get'consumer.fzf'


-- local function fzf(producer)
--   local files = {}
--   local function consumer(request)
--     local needsdata = true
--     local cwd = snap.sync(vim.fn.getcwd)
--     local stdout = vim.loop.new_pipe(false)
--     local args = {"-f", request.filter}
--     if request.filter == "" then
--        files = {}
--     end
--     for data, err, cancel in io.spawn("fzf", args, cwd, stdout) do
--       if request.canceled() then
--         cancel()
--         coroutine.yield(nil)
--       elseif (err ~= "") then
--         coroutine.yield(nil)
--       else
--         if needsdata then
--           if table.getn(files) == 0 or table.getn(files) >= 10000 then
--             files = {}
--             for data in snap.consume(producer, request) do
--               tbl.accumulate(files, data)
--               snap.continue()
--             end
--           end
--           local plain_files = vim.tbl_map(tostring, files)
--           files_string = table.concat(plain_files, "\n")
--           stdout:write(files_string)
--           stdout:shutdown()
--           needsdata = false
--         end
--         if (data == "") then
--           snap.continue()
--         else
--           coroutine.yield(vim.split(data:sub(1, -2), "\n", true))
--         end
--       end
--     end
--   end
--   return positions(consumer)
-- end
-- 
-- snap.register.map({"n"}, {"<leader><space>"}, function ()
--   snap.run {
--     producer = fzf(snap.get'producer.vim.oldfile'),
--     select = selectFile.select,
--     multiselect = selectFile.multiselect,
--   }
-- end)
-- 
-- snap.register.map({"n"}, {"<leader>fb"}, function ()
--   snap.run {
--     producer = fzf(snap.get'producer.vim.buffer'),
--     select = selectFile.select,
--     multiselect = selectFile.multiselect,
--   }
-- end)
-- 
-- snap.register.map({"n"}, {"<leader>fj"}, function ()
--   snap.run {
--     prompt = "JUMP",
--     producer = snap.get'producer.vim.jumplist',
--     select = snap.get'select.jumplist'.select,
--     views = {snap.get'preview.jumplist'}
--   }
-- end)
-- 
-- snap.register.map({"n"}, {"<leader>fd"}, function ()
--   snap.run {
--     prompt = "CD",
--     producer = fzf(snap.get'producer.luv.directory'),
--     select = snap.get'select.cwd'.select,
--   }
-- end)
-- 
local selectFile = snap.get'select.file'
local previewFile = snap.get'preview.file'
local selectVimgrep = snap.get'select.vimgrep'
local previewVimgrep = snap.get'preview.vimgrep'
local ripgrepFile = snap.get'producer.ripgrep.file'
local ripgrepVimgrep = snap.get'producer.ripgrep.vimgrep'

snap.register.map({"n"}, {"<leader>ff"}, function ()
  snap.run {
    prompt = "Files",
    producer = fzf(ripgrepFile),
    select = selectFile.select,
    multiselect = selectFile.multiselect,
  }
end)

snap.register.map({"n"}, {"<leader>fg"}, function ()
  snap.run {
    prompt = "Grep",
    producer = fzf(ripgrepVimgrep),
    select = selectVimgrep.select,
    multiselect = selectVimgrep.multiselect,
    views = {previewVimgrep}
  }
end)
