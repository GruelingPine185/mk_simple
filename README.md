# Mk-Simple

Mk-Simple (pronounced make simple) is an small and intuitive library to help streamline recipe writing Makefiles.

## Features

- Builds both static and dynamic libraries
- Builds static and dynamic objects

## Usage

First, include Mk-Simple in your Makefile script.

```makefile
include path/to/mk_simple.mk
```

Define your macros.


```makefile
source_ext := c
sources := $(wildcard *.$(source_ext))
objects := $(patsubst %.$(source_ext), %.o, $(sources))
lib_name := test
lib_ext = dylib
lib_name_full := lib$(lib_name).$(lib_ext)
compiler_c = clang
flags_c := -std=c11 -O2 -Wall -Wextra -pedantic
# ...
```

Lastly, construct your recipes.

```makefile
.PHONY: all clean
all:
	@$(MAKE) $(lib_name_full)
clean:
	rm -rf *.o *.$(lib_ext)

# Construts a dynamic library
$(eval $(call mk_dynamic_objs, $(objects), $(compiler_c), $(source_ext), $(flags_c),))
$(eval $(call mk_dynamic_lib, $(lib_name_full), $(compiler_c), $(flags_c),, $(objects),))
# ...
```

It couldn't be more simple than that!
