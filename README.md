# ```Rake::TestTask``` raises an error when the test path includes non-ascii charactors


### Environment

  * Windows 10 Pro
  * ruby 2.6.5p114 (2019-10-01 revision 67812) [x64-mingw32]


### Phe



### How to reproduce

  1. clone this repo.
  1. open a command prompt. move to this directory.
  1. type the commands below.

```
> cd あいうえお
> rake --trace
```
