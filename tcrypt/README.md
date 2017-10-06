# Experiments accessing libtomcrypt via ctypes

To run the notebooks in this directory, you need to install [libtomcrypt](https://github.com/libtom/libtomcrypt).

On macOS with Homebrew, you can get its build dependency `libtommath` with:

```bash
brew install libtommath
```

Libtomcrypt is what the Python SHA-2 implementation is based on, though from what I can tell, [the code in CPython](https://github.com/python/cpython/blob/master/Modules/sha256module.c) and [the one in libtomcrypt](https://github.com/libtom/libtomcrypt/blob/develop/src/hashes/sha2/sha256.c) by now have diverged quite a bit, b/c big parts don't look copy/pasted at all anymore.
