# Copilot Instructions for this repo

This is a personal **LazyVim** (Neovim) configuration, cloned into `~/.config/nvim`. It is not
an application with a build/test pipeline — it's a set of Lua files that `lazy.nvim` loads to
configure Neovim and its plugins.

## Validating changes

There is no build, test, or lint suite. To validate a change:
- Check syntax by opening Neovim: `nvim --headless "+lua print('ok')" +qa` from the repo root
  should exit cleanly with no Lua errors printed.
- To exercise real startup (loads plugins), run `nvim --headless +qa` and check for errors, or
  open Neovim interactively and run `:Lazy sync` / `:Lazy health` to catch plugin/config issues.
- Lua formatting follows `stylua.toml` (4-space indent, 120 column width). Run `stylua .` if
  `stylua` is installed; otherwise match the existing 4-space style by hand.

## Architecture / load order

1. `init.lua` is the entrypoint. It prepends a Node path to `$PATH`, then requires
   `config.lazy` (bootstraps `lazy.nvim` + LazyVim + plugin specs), followed by
   `config.keymaps` and `config.options`. Everything after that in `init.lua` (colorscheme
   loading, transparent theme setup, sqlfluff/nvim-lint wiring, autocmds) runs **after** Lazy
   has set up plugins.
2. `lua/config/lazy.lua` calls `require("lazy").setup(...)` with `spec = { {import = "lazyvim.plugins"}, {import = "plugins"} }` — this is what pulls in every file under `lua/plugins/*.lua` as a plugin spec automatically (no manual registration needed; just add a new file).
3. `lazyvim.json` lists enabled **LazyVim extras** (`lazyvim.plugins.extras.*`) — this is the
   source of truth for which language/editor/UI extras (sql, ruby, python, markdown, gh, etc.)
   are active. Adding language support usually means adding an extra here rather than a custom
   plugin spec, unless you need to override/disable LazyVim's default (see `tsql.lua`).
4. `lua/config/*.lua` are LazyVim's special auto-loaded config modules (`autocmds.lua`,
   `keymaps.lua`, `options.lua` are loaded by LazyVim itself at expected points in startup);
   `catppuccin.lua` and `transparent.lua` are plain helper modules only loaded because something
   else (`init.lua`, `themes.lua`) explicitly `require`s them.
5. Colorscheme selection is dynamic at runtime: `init.lua`'s `load_synced_colorscheme()` reads
   `~/.cache/wezterm-nvim-theme` (written by an external WezTerm integration) and applies that
   colorscheme, falling back to `nord`. Don't hardcode a colorscheme elsewhere expecting it to
   always apply.

## Conventions

- **Plugin specs**: one file per plugin/topic under `lua/plugins/`, each returning a lazy.nvim
  spec table (see `bufferline.lua`, `treesitter.lua`, `tsql.lua`). To override/extend an
  existing LazyVim-provided plugin (e.g. `nvim-lspconfig`, `mason.nvim`, `nvim-lint`), return
  another spec entry for the same plugin name using `opts = function(_, opts) ... return opts end`
  to merge into existing options rather than replacing them (see `tsql.lua`, `ruby.lua`).
- **Indentation**: most files use 4-space indent per `stylua.toml`; a few older files
  (`icons.lua`, `projects.lua`) use 2-space — match the file you're editing.
- **Disabling a default LSP/tool in favor of another**: set `servers.<name> = { enabled = false }`
  plus a no-op `setup.<name> = function() return true end` in the `nvim-lspconfig` opts (see
  `tsql.lua` disabling `sqlls` in favor of dadbod).
- **Filetype/linter wiring for SQL dialects**: both `init.lua` and `tsql.lua` configure
  `nvim-lint`'s `sqlfluff` linter with `--dialect tsql`; keep these in sync if changing the
  SQL dialect.
- Comments above a `return {...}` block are used to explain *why* a plugin/override exists
  (see the header comments in `tsql.lua`, `ruby.lua`) — follow this pattern for non-obvious
  plugin additions.
