# TermLineHide.nvim

A Neovim plugin that automatically hides line numbers when entering terminal mode and restores them when leaving.

## Features
- Automatically hides line numbers in terminal buffers
- Restores line numbers when leaving terminal mode
- Configurable exceptions
- Toggle functionality

## Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):
```
use {
    'your-username/termlinehide.nvim',
    config = function()
        require('termlinehide').setup({
            enabled = true,
            exceptions = {}
        })
    end
}
```

Using lazy.nvim:
```
luaCopy{
    'your-username/termlinehide.nvim',
    opts = {
        enabled = true,
        exceptions = {}
    }
}
```

Configuration
```
luaCopyrequire('termlinehide').setup({
    -- Default configuration
    enabled = true,
    exceptions = {} -- Add buffer types where line numbers should remain visible
})
```
Commands
```
:TermLineHideToggle - Toggle the plugin on/off
