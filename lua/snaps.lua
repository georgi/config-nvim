local snap = require'snap'
local fzf = snap.get'consumer.fzf'
local selectFile = snap.get'select.file'

snap.register.map({"n"}, {"fg"}, function ()
  snap.run {
    producer = snap.get'producer.ripgrep.vimgrep',
    select = snap.get'select.vimgrep'.select,
    multiselect = snap.get'select.vimgrep'.multiselect,
    views = {snap.get'preview.vimgrep'}
  }
end)

snap.register.map({"n"}, {"ff"}, function ()
  snap.run {
    producer = snap.get'consumer.fzf'(snap.get'producer.ripgrep.file'),
    select = snap.get'select.file'.select,
    multiselect = snap.get'select.file'.multiselect,
    views = {snap.get'preview.file'}
  }
end)

snap.register.map({"n"}, {"fo"}, function ()
  snap.run {
    producer = fzf(snap.get'producer.vim.oldfile'),
    select = selectFile.select,
    multiselect = selectFile.multiselect,
  }
end)

snap.register.map({"n"}, {"fb"}, function ()
  snap.run {
    producer = fzf(snap.get'producer.vim.buffer'),
    select = selectFile.select,
    multiselect = selectFile.multiselect,
  }
end)

snap.register.map({"n"}, {"fj"}, function ()
  snap.run {
    prompt = "JUMP",
    producer = snap.get'producer.vim.jumplist',
    select = snap.get'select.jumplist'.select,
    views = {snap.get'preview.jumplist'}
  }
end)

snap.register.map({"n"}, {"fd"}, function ()
  snap.run {
    prompt = "CD",
    producer = snap.get'consumer.fzy'(snap.get'producer.luv.directory'),
    select = snap.get'select.cwd'.select,
  }
end)
