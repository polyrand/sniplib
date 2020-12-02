# SnipLib ⚡️
> Fast and simple organizer for your code snippets.

The main purpose of this script is having a fast ⚡️ and easy way to search
through your code snippets, mixing the power of
[ripgrep](https://github.com/BurntSushi/ripgrep) and
[fzf](https://github.com/junegunn/fzf).

I created this to manage code snippets that I saw myself using and searching for regularly. But now I also store short notes or cheatsheets I need to go back.

## Why

The amount of tools to keep notes / snippets is huge. I created sniplib for the
following reasons:

* No lock-in, files are just text and you can keep them however you want.
* Interactive finding + grepping. Since ripgrep is very fast, I can afford
    running it every time I type something so that I can have **content
    grepping** + **fuzzy file matching**.
* No need to install any app.

Apart from that, I am constantly updating my snippets. Every time I find myself googling the same thing more than twice I put it in a snippet, so next time I can save some time and I know where I can find and answer that works.

## Installation

**Requirements:**

* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [fzf](https://github.com/junegunn/fzf)
* Optional for fancier preview (any of the following):
  * [bat](https://github.com/sharkdp/bat)
  * [highlight](https://github.com/felixfbecker/cli-highlight)
  * [coderay](https://github.com/rubychan/coderay)
  * [rougify](https://github.com/rouge-ruby/rouge)

**Note**: if you want to use a highligther that is not `bat`, edit the `sniplib.sh`. Uncomment the 17th line and place in in the `preview` command, between `bat` and `cat`.

This utility relies on `pbcopy` or `xclip`, so if you are not using macOS install xclip with `sudo apt-get install -y xclip`:


macOS & linux:

```sh
git clone https://github.com/polyrand/sniplib.git
chmod +x sniplib.sh
./sniplib.sh [SNIPPETS FOLDER] [SEARCH QUERY - optional]
```

**Note**: this has been developed and tested only on macOS, but it should be compatible with anything that can run `xclip` too. If not, please open an issue so that I can look at it.

**Recommended usage:**

Add an alias to your `.bashrc` (or whatever you use) to launch the script with your snippets folder as an argument (or
you can use mine 😊):

```bash
#sniplib (with custom folder)
alias snip='~/Projects/sniplib/sniplib.sh ~/Projects/sniplib/snips'
```

(*Note:* `~/Projects/sniplib/sniplib.sh` would be where you download the script and `~/Projects/sniplib/snips` would be you snippets/notes folder).

Color configuration:

Since `sniplib` relies on fzf, you can (and should) set up the colors as you want to have a better experience:

* https://github.com/junegunn/fzf/wiki/Color-schemes
* https://minsw.github.io/fzf-color-picker/


**BUG CAUTION**

The `sort_tags.py` script does what it says, it sorts alphabetically all the tags. There was a bug in which if a file had no tags, all its content would get deleted. The bug is fixed now and tested, but it is a reminder to use a version control system.

## Usage example

See it in action (first copying to clipboard then editing the snippet):

[![asciicast](https://asciinema.org/a/FKI3CtC094xsBP1Eks9frPmDw.svg)](https://asciinema.org/a/FKI3CtC094xsBP1Eks9frPmDw)

If you want to sort alphabetically the tags in all the snippets, run:

```bash
chmod +x sort_tags.py
./sort_tags.py
```

For a better experience, set up FZF colors as you like. The ones I use are different from that terminal video:

```sh
export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git --color=always'

export FZF_DEFAULT_OPTS='
  --color hl:#e84343,hl+:#23a4fa
'

```

## Benchmarks

I replicated my personal snippets folder many times. Total size is 604Mb and there are 163680 files inside the directory tree (`find load/ -type f | wc -l`). Take into account this is an very deeply nested tree of folders.

```bash
# load/ is the test folder full of files
# 'pandas where' is a random query I chose.

time ./sniplib.sh load/ 'pandas where'
```

```
real	0m27.536s
user	0m7.713s
sys		0m23.021s
```

That's the time it takes to traverse the whole directory looking for those tags. The timing is not very precise because I have to `ctrl + C` for it to finish. On average (of a few runs) it was taking 21 seconds.

Using that same folder, the interactive search works perfectly, just slightly more laggy than with a *not huge* folder.

## Notice

If you find a snippet without the appropriate source inside please let me know so that I can give credit to its author.

## Release History

* 1.0
	* Bugs fixed
* 0.3
	* Enable custom folder
* 0.2
	* Add tag sort script
* 0.1
    * First release

## Meta

Ricardo Ander-Egg Aguilar – [@ricardoanderegg](https://twitter.com/ricardoanderegg) –

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/polyrand/](https://github.com/polyrand/)

## Contributing

1. Fork it (<https://github.com/polyrand/sniplib/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request
