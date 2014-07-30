vkg
===

_This is a proof of concept, I will be releasing a stable and better application soon._

The package manager for Vim
---------------------------

This is *vkg* (pronounced vackage), the package manager for Vim.  *vkg* relies
on the data from the folks at [Vimawesome](http://vimawesome.com).

*vkg* works alongside [Pathogen](https://github.com/tpope/vim-pathogen), and presumes
that your infected dir is ~/.vim/bundle.

*vkg* needs [Coffeescript](http://coffeescript.org) to be installed globally in the system, and the
```coffee``` binary to be accesible in the path.

Installation
------------
```
npm install -g vkg
```

Usage
-----
```
vkg search gundo
vkg install gundo
```

TODO
----
* LOTS OF THINGS
* Option for customized config file (~/.vkgrc)
* Moar commands
* tests

Contributing
------------
Yes, please
