Doug Rohde's SVD C library
==========================

[SVDLIBC][1] is a fast implementation of SVD matrix decomposition by Doug Rohde.
It works particularly efficiently in the following cases:

- the matrix is sparse,
- only a few singular values are needed.

These properties make it particularly well suited for [latent semantic
analysis][2], for example.

I ran an experiment on an Amazon EC2 [m2.xlarge][3] instance - which might be
way overkill - with a 70k × 500k matrix containing 8M entries (density: 0.02%).
Here is the running time for different values of `d` (= dimensions = number of
singular values):

- `-d 50`: 39s wall time
- `-d 300`: 4m53s wall time
- `-d 1000`: 31m48s wall time

Why this fork ?
---------------

The latest official release of the library (version 1.34) dates back from 2005.
It has a few quirks, such as:

- `make` / `make install` don't work "as expected"
- it doesn't compile on Mac OS X out of the box
- some bugs have been found, e.g. by [piskvorky][4]

A caveat
--------

I'm not a release engineer, and have only limited knowledge of the different
languages (C, Makefile) and tools (`make`, `gcc`) involved. The modifications in
this fork are working for me, but nothing guarantees they'll work for you.

If you find a bug and fix it yourself, I'd be happy to get a pull your changes
over.

Installation instructions
-------------------------

Easy as pie:

    # Download the code. Alternatively you can also download the zip file.
    git clone git://github.com/lucasmaystre/svdlibc.git
    cd svdlibc

    # Just like any other sane program...
    make
    make install

    # You're done. Start using it!
    svd -o result -d 10 THE_MATRIX

[1]: http://tedlab.mit.edu/~dr/SVDLIBC/
[2]: http://en.wikipedia.org/wiki/Latent_semantic_analysis
[3]: http://aws.amazon.com/ec2/instance-types/
[4]: https://github.com/piskvorky/sparsesvd/commit/4ad18096334636e0eae180964284c6dd7b7749c3
