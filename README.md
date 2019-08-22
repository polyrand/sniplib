# SnipLib ⚡️
> Fast and simple organizer for your code snippets.

The main purpose of this script is having a fast ⚡️ and easy way to search
through your code snippets, mixing the power of
[ripgrep](https://github.com/BurntSushi/ripgrep) and
[fzf](https://github.com/junegunn/fzf).

## Installation


**Requirements:**
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [fzf](https://github.com/junegunn/fzf)
* Optional for fancier preview (any of the following):
  * [bat](https://github.com/sharkdp/bat)
  * [highlight](https://github.com/felixfbecker/cli-highlight)
  * [coderay](https://github.com/rubychan/coderay)
  * [rougify](https://github.com/rouge-ruby/rouge)

This utility relies on `pbcopy` or `xclip`, so if you are not using macOS install xclip with `sudo apt-get install -y xclip`:


macOS & linux:

```sh
git clone https://github.com/rickaa/sniplib.git
chmod +x sniplib.sh
./sniplib.sh [SNIPPETS FOLDER] [SEARCH QUERY - optional]
```

**Recommended usage:**

Add an alias to your `.bashrc` (or whatever you use) to launch the script with your snippets folder as an argument (or
you can use mine 😊):

```bash
#sniplib (with custom folder)
alias snip='~/Projects/sniplib/sniplib.sh ~/Projects/sniplib/snips'
```

## Usage example

See it in action (first copying to clipboard then editing the snippet):

[![asciicast](https://asciinema.org/a/FKI3CtC094xsBP1Eks9frPmDw.svg)](https://asciinema.org/a/FKI3CtC094xsBP1Eks9frPmDw)

If you want to sort alphabetically the tags in all the snippets, run:

```bash
chmod +x sort_tags.py
./sort_tags.py
```

## Release History

* 0.3
	* Enable custom folder 
* 0.2
	* Add tag sort script
* 0.1
    * First release

## Meta

Ricardo Ander-Egg Aguilar – [@ricardoanderegg](https://twitter.com/ricardoanderegg) –

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/rickaa/](https://github.com/rickaa/)

## Contributing

1. Fork it (<https://github.com/rickaa/sniplib/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request
