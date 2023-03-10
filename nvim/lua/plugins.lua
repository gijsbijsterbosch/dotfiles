
return require('packer').startup(function(use)
-- use { '52617365/nvimanki', requires = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim"}}

use 'wbthomason/packer.nvim'
use "nvim-lua/plenary.nvim"
use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}

end)


