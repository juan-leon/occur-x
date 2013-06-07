## Overview

`occur-x.el` adds some extra functionality to occur-mode.  It allows the user to
refine any occur mode with extra regexp based filters.  Use commands
`occur-x-filter-out` and `occur-x-filter` to add positive and negative filters.
By default those commands are bind to keys "f" and "k" (from flush and keep).
Use command `occur-x-undo-filter` to remove filters.  Filters are kept if the
buffer is reverted (shortcut "g") or cloned (shortcut "c").

Another useful addition of occur-x to occur-mode is the possibility to
displaying the line numbers in the margin of your choice, instead of "inside"
the occur buffer.  This way every match line in the occur buffer is exactly the
same as in the original buffer.  Customize variable
`occur-linenumbers-in-margin` and face `occur-margin-face` to your liking.  When
displayed in the margin, line numbers won't interfere with the regexps of the
additional filters.

### Installation

Add `occur-x.el` to your load-path and this line to your config file:

```lisp
(require 'occur-x)
(add-hook 'occur-mode-hook 'turn-on-occur-x-mode)
```

### Usage

To refine your occur buffer, removing or keeping lines that match any regular
expression of your choice, press "k" ([K]eep) or "f" ([F]lush).  Press "u" to
undo the last filter in the stack.

### Customization

Use function `occur-x-enable` to toggle on or off this functionality.

Type `M-x customize-variable RET occur-linenumbers-in-margin` to customize where
the line numbers should appear.  Type `M-x customize-face RET occur-margin-face` if
you want another face for line numbers when they are in a margin.

### Contributing

Ideas, bug reports, patches, etc. are most welcomed
