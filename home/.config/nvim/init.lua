local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

opt.number = true
opt.cursorline = true
opt.colorcolumn = { "100" }
opt.shortmess:append({ I = true })

opt.ignorecase = true
opt.smartcase = true

opt.scrolloff = 1
opt.sidescrolloff = 4
opt.wrap = false

opt.tabstop = 4
opt.softtabstop = -1
opt.shiftwidth = 4
opt.expandtab = true
opt.shiftround = true
opt.smartindent = true

opt.list = true
opt.listchars = {
    tab = "→ ",
    leadmultispace = "▏   ",
    multispace = "·",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "%",
}

autocmd("BufEnter", {
    pattern = "*",
    callback = function ()
        local sw = vim.opt_local.shiftwidth:get()
        local lms = "▏" .. string.rep(" ", sw - 1)
        vim.opt_local.listchars:append({ leadmultispace = lms })
    end,
})

opt.clipboard = { "unnamedplus" }

if vim.env.WAYLAND_DISPLAY ~= nil then
    vim.g.clipboard = {
        name = "wl-clipboard",
        copy = {
            ["*"] = "wl-copy --foreground --type text/plain --primary",
            ["+"] = "wl-copy --foreground --type text/plain",
        },
        paste = {
            ["*"] = { "bash", "-c", "wl-paste --no-newline --type 'text/plain;charset=utf-8' --primary 2> /dev/null | sed -e 's/\r$//'" },
            ["+"] = { "bash", "-c", "wl-paste --no-newline --type 'text/plain;charset=utf-8' 2> /dev/null | sed -e 's/\r$//'" },
        },
        cache_enabled = true,
    }
end

local jetpackfile = vim.fn.stdpath("data") .. "/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim"
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"

if not vim.fn.filereadable(jetpackfile) then
    vim.fn.system({ "curl", "-fsSLo", jetpackfile, "--create-dirs", jetpackurl })
end

vim.cmd.packadd("vim-jetpack")

require("jetpack.packer").add {
    { "tani/vim-jetpack", opt = true },
    { "tpope/vim-sleuth" },
    { "ntpeters/vim-better-whitespace",
        config = function ()
            vim.g.strip_whitelines_at_eof = true
            vim.g.strip_whitespace_on_save = true
            vim.g.strip_whitespace_confirm = false
        end,
    },
    { "sickill/vim-monokai", opt = true,
        setup = function ()
            vim.cmd.colorscheme("monokai")
        end,
    },
    { "nvim-lualine/lualine.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function ()
            require("lualine").setup {
                options = { theme = "onedark" },
            }
        end,
    },
}
