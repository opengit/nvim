# ReadMe

## My neovim configuration

In my development environment, I will install the following plugins:

```Bash
:CocInstall coc-pyright @yaegassy/coc-ruff coc-pairs coc-prettier coc-tsserver coc-json
```

To support the normal development of Python, it is necessary to install `ruff-lsp`:

```Bash
:CocCommand ruff.builtin.installServer
```

## Screenshots

![start-screen](./docs/images/start-screen.png)

![float-term](./docs/images/float-term.png)

![cmdline](./docs/images/cmdline.png)

## Changelog

-   2024-04-11 00:23

*   从`nvim-lspconfig`迁移至`coc.nvim`。

-   2024-06-27 16:39

*   完善了一下使用文档。
