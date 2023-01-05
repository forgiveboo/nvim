local status, bufferline = pcall(require, "bufferline")
if (not status) then
  return
end

vim.opt.termguicolors = true
bufferline.setup {
  options = {
  	-- 使用 nvim 内置lsp
    diagnostics = "nvim_lsp",
    -- 左侧让出 nvim-tree 的位置
    offsets = {{
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "left"
    }},
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
		local icon = level:match("error") and " " or " "
		return " " .. icon .. count
		end
  }
}

--按键映射
--nnoremap <silent> gb :BufferLinePick<CR>
vim.api.nvim_set_keymap("n", "gb", "<Cmd>BufferLinePick<CR>", {noremap = true, silent = true})
