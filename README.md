# ReadMe

## My neovim configuration

In my development environment, I will install the following plugins:

```Bash
:CocInstall @yaegassy/coc-pylsp coc-sumneko-lua coc-html-css-support coc-pairs coc-prettier coc-tsserver coc-json coc-emmet coc-markdown-preview-enhanced coc-markdownlint
```

If the support of Python or Lua is not enough, it is necessary to install language server:

```Bash
:CocCommand pylsp.installServer
:CocCommand sumneko-lua.install
```

## Screenshots

![start-screen](./docs/images/start-screen.png)

![float-term](./docs/images/float-term.png)

![cmdline](./docs/images/cmdline.png)

## Changelog

-   2024-04-11 00:23

> 从`nvim-lspconfig`迁移至`coc.nvim`。

-   2024-06-27 16:39

> 完善了一下使用文档。

-   2024-07-02 01:09

> Python 的支持转为使用`coc-pylsp`。
