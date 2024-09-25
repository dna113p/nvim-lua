return {
  "yetone/avante.nvim",
  dev = true,
  event = "VeryLazy",
  build = "make",
  opts = {
    provider = "openai",
    openai = {
      endpoint = "http://127.0.0.1:11434",
      model = "codestral:22b-v0.1-q8_0",
      temperature = 0,
      max_tokens = 8192,
      ["local"] = true,
    },
    mappings = {
      window_cycle_forward = "<Tab>",
      window_cycle_backward = "<S-Tab>",
    },
    system_prompt = "You are a helpful assistant.",
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below is optional, make sure to setup it properly if you have lazy=true
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
