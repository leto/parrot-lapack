# Parrot Virtual Machine bindings to LAPACK

This is library for Parrot Virtual Machine to provide [LAPACK](http://www.netlib.org/lapack/) bindings to all
languages running on Parrot Virtual Machine.

## Compiling

You need [Parrot VM](http://parrot.org) 3.5.0 or higher to compile parrot-lapack . 3.6.0
or higher is recommended.

The language [Winxed](http://winxed.org) is included in Parrot >= 3.5.0, and the build system of parrot-lapack
uses it. To build parrot-lapack:

    winxed setup.winxed build

## Running Tests

parrot-lapack uses [Rosella](http://whiteknight.github.com/Rosella/) to run
and implement a test suite. You currently need Rosella installed to run the
tests.

Instructions on compiling and installing Rosella can be found are [here](https://github.com/Whiteknight/Rosella/blob/master/README.md)

Once you have Rosella, run the parrot-lapack test suite with:

    winxed setup.winxed test

## Installing

    winxed setup.winxed install

If you installed Parrot into a system-wide directory that only root can write to, you
will need sudo:

    sudo winxed setup.winxed install

## Cleaning up

    winxed setup.winxed clean

## Contributing

Beer, pull requests and patches welcome! Fork and be merry.

## Authors

Jonathan "Duke" Leto.

## Developer

Jashwanth Reddy M

## License

Artistic 2.0
