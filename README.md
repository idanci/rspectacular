RSpectacular
==============================================================================

**It's like RSpec, but more spectacularer**

<img src="http://cdn.memegenerator.net/instances/300x/34275719.jpg" align="right" />

When installing many of the most popular gems, they typically require some form
of configuration to be added to your `spec_helper.rb` file in order to make them
work properly in test mode.

Additionally, there are RSpec settings which are pretty standard for most users
of the framework. Personally we found ourselves copying and pasting files from
project to project. This was a huge nightmare.

What we decided to do was to package it all up as a gem so that we can simply
include it in the project and update it as necessary. Version 1.x won't allow
for too many different customizations, but the plan for 2.x is _selective_
overriding of RSpectacular configuration decisions.

The philosophy behind this gem is to:

* Retain uber-fast test startup times
* Keep per-project configurations to a minimum

Obviously there may still need to be project-specific configurations that will
need to take place.  However, what you should see when you look at your spec's
configuration should be things that are exceptional to your project; nothing
more.

[Welcome to RSpectacular](#wiki).

Usage
------------------------------------------------------------------------------

Take a look at the project's [Wiki](#wiki) for full details and usage.

Issues
------

If you have problems, please create a [Github issue](issues).

Credits
-------

![thekompanee](http://www.thekompanee.com/public_files/kompanee-github-readme-logo.png)

rspectacular is maintained by [The Kompanee, Ltd.](http://www.thekompanee.com)

The names and logos for The Kompanee are trademarks of The Kompanee, Ltd.

License
-------

rspectacular is Copyright &copy; 2013 The Kompanee. It is free software, and may be redistributed under the terms specified in the LICENSE file.
