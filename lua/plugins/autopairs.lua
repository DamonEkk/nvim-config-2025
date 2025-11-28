return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,  -- smart Treesitter integration
      fast_wrap = {},
    })
  end
}

