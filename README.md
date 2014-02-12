[![Build Status](https://travis-ci.org/LittleHelicase/ContentsJS.png?branch=master)](https://travis-ci.org/LittleHelicase/ContentsJS)

ContentsJS
==========

Non-Linear System for Content presentation

Running Examples
================

# Web example
Simply open the index.html under examples/documentation. Browsers like Chrome complain because ContentsJS dynamically loads file from your file system. You can either enable local file loading (but you shouldn't) or run a local HTTP Server. The simplest way is probably to run
```
python -m SimpleHTTPServer
```
or (after installing the http-server npm package globally)
```
http-server
```
in the base directory. Currently it is necessary to build the project with grunt build beforehand. Or you can use grunt continuous to watch for file changes and recompile everything automatically when needed.

BUT AS THIS IS REALLY ANNOYING I WILL SWITCH TO REQUIREJS... :(


#Terminal example


```
lsc examples/terminal/blessed-terminal.ls ../examples/documentation
```
from the base directory, where lsc is the livescript interpreter. The contents directory (first parameter for blessed-terminal.ls is still relative to the contents.ls file).

License
=======
Released under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
