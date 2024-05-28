{ config, pkgs, inputs, ... }: {
  programs.neovim = let
    toLua = str: ''
      lua << EOF
      ${str}
      EOF
    '';
    toLuaFile = file: ''
      lua << EOF
      ${builtins.readFile file}
      EOF
    '';
  in {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      nil
      ccls
      nodePackages.bash-language-server
      nodePackages.pyright
      vscode-extensions.vadimcn.vscode-lldb
      nixfmt
      clang-tools
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = betterTerm-nvim;
        config = toLua "require('betterTerm').setup()";
      }

      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./lua/plugins/lsp.lua;
      }
      {
        plugin = nvim-dap-ui;
        config = toLuaFile ./lua/plugins/dap-ui.lua;
      }
      {
        plugin = nvim-dap;
        config = toLua ''
          local dap = require('dap')
          dap.adapters.codelldb = {
              type = 'server',
              port = "''${port}",
              executable = {
                  command = '${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb',
                  args = {'--port', "''${port}"},
              }
          }

          dap.configurations.c = {
            {
              name = "Launch file",
              type = "codelldb",
              request = "launch",
              program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
              end,
              cwd = "''${workspaceFolder}",
              stopOnEntry = false,
            },
          }
        '';
      }
      vim-tmux-navigator
      harpoon
      header_42_vim
      undotree
      neodev-nvim
      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets
      vim-nix
      vim-fugitive
      norminette-vim
      formatter_42
      {
        plugin = nvim-colorizer-lua;
        config = toLua "require('colorizer').setup()";
      }
      {
        plugin = nvim-cmp;
        config = toLuaFile ./lua/plugins/cmp.lua;
      }
      {
        plugin = null-ls-nvim;
        config = toLuaFile ./lua/plugins/null-ls.lua;
      }
      {
        plugin = kanagawa-nvim;
        config = toLuaFile ./lua/plugins/kanagawa.lua;
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        config = toLuaFile ./lua/plugins/treesitter.lua;
      }
      {
        plugin = telescope-nvim;
        config = toLuaFile ./lua/plugins/telescope.lua;
      }
      telescope-fzf-native-nvim
      nvim-web-devicons
      {
        plugin = comment-nvim;
        config = toLua "require('Comment').setup()";
      }
      {
        plugin = lualine-nvim;
        config = toLuaFile ./lua/plugins/lualine.lua;
      }
    ];
    extraLuaConfig = ''
      ${builtins.readFile ./lua/options.lua}
      ${builtins.readFile ./lua/remap.lua}
    '';
  };
}
