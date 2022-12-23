vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'sonph/onehalf'
	use 'joshdick/onedark.vim'
end)
