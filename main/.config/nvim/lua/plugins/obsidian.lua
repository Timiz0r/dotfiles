return {
  "obsidian-nvim/obsidian.nvim",
  lazy = false,
  version = "*", -- recommended, use latest release instead of latest commit
  ft = "markdown",
  opts = {
    workspaces = {
      {
        name = "main",
        path = "~/obsidian/main",
      },
    },
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
    local wk = require("which-key")
    wk.add({
      { "<leader>o",  group = "[O]bsidian" },
      { "<leader>oq", "<cmd>Obsidian quick_switch<CR>", desc = "[Q]uickswitch" },
      { "<leader>ob", "<cmd>Obsidian backlinks<CR>", desc = "[B]acklinks" },
      { "<leader>od", "<cmd>Obsidian dailies<CR>",   desc = "[D]aily notes" },
      { "<leader>on", "<cmd>Obsidian new<CR>",       desc = "[N]ew note" },
      { "<leader>oo", "<cmd>Obsidian open<CR>",      desc = "[O]pen note in obsidian" },
      { "<leader>op", "<cmd>Obsidian paste_img<CR>", desc = "[P]aste image" },
      { "<leader>os", "<cmd>Obsidian search<CR>",    desc = "[S]earch in notes" },
      { "<leader>ot", "<cmd>Obsidian tags<CR>",      desc = "Search [T]ags" },
      {
        mode = "v",
        { "<leader>ol", group = "[L]ink" },
        {
          "<leader>oll",
          ":Obsidian link ",
          desc = "[L]ink selection to existing note",
          mode = "v",
          silent = false,
        },
        {
          "<leader>oln",
          ":Obsidian link_new ",
          desc = "Link selection to [N]ew note",
          mode = "v",
          silent = false,
        },
      },
    })
  end
}
