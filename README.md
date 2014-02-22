## Preambel

**Duo Color** is a template for the static site generator [Middleman](http://middlemanapp.com/)
and its [blog extension](http://middlemanapp.com/basics/blogging/).

It features a responsive HTML5 CSS3 based design based on [Bootstrap](http://getbootstrap.com/)
which makes it easy to modify.

## Features

This template incorporates a lot of features:

* LaTeX formulas using [MathJax](http://mathjax.org), see [demo](/demo/)
* syntax highlighting using pygmentize-compatible [Rouge](http://www.rubydoc.info/gems/rouge/) which looks exactly like embedded gists, see [demo](/demo/)
* Middleman uses the kramdown markdown parser by default, which makes it very to use table of contents (TOC), see [original post](http://blog.riemann.cc/2013/04/10/table-of-contents-in-octopress/)
* [Bower](http://bower.io/) is used to ease the updating of javascript libs (modernizer, jquery)
* this templates comes not only with a `robots.txt`, but also with a `humans.txt`
* to help search engines to find your content, a `sitemap.txt` and `sitemap.xml` is generated for you
* blog search provided by [DuckDuckGo](https://duckduckgo.com)
* you do not only get one feed for your blog posts, but also feeds separted by tags (middleman proxies to the win)
* all css files and javascript files are jointly minified to save bandwith and elements to loads
* nice icon fonts [Fontello](http://fontello.com/) (see [demo](/demo/) and [Glyphicons](http://glyphicons.com/) at your disposal
* disqus recent comments for your blog as aside
* disqus number of comments per post on your blog post overview page

There have been made some attempts to increase the privacy of visitors:

* we host most js and css ourself (not the mathjax one, if you use it; not the Google Webfont)
* we use [DuckDuckGo](https://duckduckgo.com) instead of google
* For sure, you better don't use Google Analytics. If you do, the provided script
  lets google remove the last bits of the IP address.
* Be aware that embedding widgets (G+, Twitter, Gist) will reveal information about your visitors to these services.

The template is somehow prepared for hosting on github, that's why the errorpage
will be named `404.html` and a `CNAME` file will be put in your document root with
your hostname. If you don't have a custom domain, you may remove this file.

## Checklist

* read the [Middleman](http://middlemanapp.com/) docs
* check `data/site.yml`
* check `config.rb`
* check updates of javascript lists: `bower install`, `bower update`
* decide, if you want to keep the `CNAME` file (meant for github users)
* if you want to use more than one language, consider which naming scheme you want to use:
  If you tweak it the right way, you can use Apaches content-negotiation feature to direct
  your visitors directly to the appropiate landing page using their browser language settings.
* setup your `.htaccess` file to use the error page `404.html` or change its name
* there is a placeholder picture in the file `404.html` – take another one!
* The duckduckgo results page is customized by some post variables next to the
  search string. Have a look in `_site-search.slim` to make it fit your needs
* add the missing lines to ease your deployment: `middleman-deploy`



## Thanks
 * <http://noisepng.com/> for providing some `noize` `:p`
 * <https://github.com/shkm/middleman-neato> for the bower setup
 * <http://binary-btemplates.blogspot.fr/> for the initial design idea, whoever the realization is totally different (read better `;)`)
 
## Issues and Comments

If you find a bug, please [issue a bug report](https://github.com/rriemann/middleman-blog-template-duocolor/issues)
right at the Github project. Patches are most welcome by push requests, but I
don't mind emails as well. You find my contact details in the section below.


## Author

Mail

: <robert@riemann.cc> <br>
  pgp fingerprint: `F6A9 332D AA28 625E 59A8  F758 7BF6 0F4A 861B C3A3`

Twitter

: [@rriemann_eu](https://twitter.com/rriemann_eu)
{: style="margin-top:0" }

GitHub

: [rriemann](https://github.com/rriemann)

## About This Template

This template was originally developed for my personal blog <http://blog.riemann.cc>

## License

Template Duo Color (c) 2014 by Robert Riemann <robert@riemann.cc>

Except where otherwise noted, Template Duo Color is licensed under a
Creative Commons Attribution 4.0 International License.

You should have received a copy of the license along with this
work. If not, see <http://creativecommons.org/licenses/by/4.0/>.

[![Creative Commons License][cc-image]][cc]

[cc-image]:  https://i.creativecommons.org/l/by/4.0/88x31.png
[cc]: https://creativecommons.org/licenses/by/4.0/ "Creative Commons Attribution 4.0 International license"