{
  programs.nixvim.keymaps = [
    {
      key = "<leader>fs";
      action = "<CMD>w<CR>";
      options.desc = "Save";
    }
    {
      key = "<leader>qq";
      action = "<CMD>wq<CR>";
      options.desc = "Save & Quit";
    }
    {
      key = "<leader>qQ";
      action = "<CMD>q!<CR>";
      options.desc = "Force Quit";
    }
    {
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Select Window - Left";
    }
    {
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Select Window - Down";
    }
    {
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Select Window - Up";
    }
    {
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Select Window - Right";
    }
    {
      key = "<S-h>";
      action = "<CMD>:bprev<CR>";
      options.desc = "Select Buffer - Previous";
    }
    {
      key = "<S-l>";
      action = "<CMD>:bnext<CR>";
      options.desc = "Select Buffer - Next";
    }
    {
      key = "<leader>bd";
      action = "<CMD>BufferClose<CR>";
      options.desc = "Buffer - Delete";
    }
    {
      key = "<leader>bb";
      action = "<CMD>BufferPick<CR>";
      options.desc = "Buffer - View";
    }

  ];
}
