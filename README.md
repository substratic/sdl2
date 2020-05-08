# Substratic SDL2 Bindings for Gambit Scheme

This is a minimal set of Gambit Scheme bindings for the SDL2, SDL2_image, and
SDL2_ttf libraries.  It does not (yet) cover all of the APIs provided by these
libraries, only those that are needed by projects that use the Substratic
Engine.  It is meant to be used with the GCC compiler toolchain in an
environment where `pkg-config` is present (like Linux, macOS, or MingW64 on
Windows).

If you need a more complete SDL2 binding, check out https://github.com/alvatar/sdl2.

## License

This code is distributed under the [MIT License](LICENSE).  It is largely
adapted from the work of Álvaro Castro Castilla at
https://github.com/alvatar/sdl2.
