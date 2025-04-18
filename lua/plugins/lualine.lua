return {{'wuelnerdotexe/vim-enfocado', opts={},
  config = function()
    vim.api.nvim_create_augroup("enfocado_customization", { clear = true })

    vim.api.nvim_create_autocmd("ColorScheme", {
        group = "enfocado_customization",
        pattern = "enfocado",
        nested = true,
        callback = function()
            if vim.o.background == "dark" then
                vim.api.nvim_set_hl(0, "Normal", { ctermbg = "black"})
            end
        end,
    })
    vim.cmd("colorscheme enfocado")
    end
  },
{
  "nvim-lualine/lualine.nvim",
  dependencies  = { 'nvim-tree/nvim-web-devicons' },
  opts = {
      theme = 'enfocado',
      sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { 'filename' },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress'},
          lualine_z = { 'location' },
      },
  }    
}}
