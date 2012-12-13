## Redmine screenshot paste plugin

This a rework of the Jean-Philippe Lang's [Redmine Screenshot paste](http://www.redmine.org/projects/redmine/wiki/PluginScreenshotPaste)
plugin.

This plugin is compatible and has been tested with Redmine 2.0.x and 2.1.x.

## Features

Allow pasting a screenshot from the clipboard on :

* the issue form.
* the document form.
* the wiki form.

## Installation

Follow the [standard procedure](http://www.redmine.org/projects/redmine/wiki/Plugins) (no migration required).

**Note**: Please, check that the plugin's directory is named **`redmine_screenshot_paste`**. Otherwise, rename it.

## Limitations

For Wiki and documents, you have to be on a form. Using the `New file` link doesn't
handle screenshots.
