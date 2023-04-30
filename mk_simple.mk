# 1: The output file
# 2: The archive program to use
# 3: Flags for the archive program
# 4: Object files
# 5: Additional recipe prerequisites (not including the object files)
define mk_static_lib
$(1): $(4) $(5)
	$$(strip $(2) $(3) $$@ $(4))
endef

# 1: The output file
# 2: Compiler
# 3: Compiler flags
# 4: Compiler linker flags
# 5: Object files
# 6: Additional recipe prerequisites (not including the object files)
define mk_dynamic_lib
$(1): $(5) $(6)
	$$(strip $(2) $(3) -shared $(5) -o $(1) $(4))
endef

# 1: The output file
# 2: Compiler
# 3: Object file pattern: <output dir>/%.o
# 4: Source file pattern: <source dir>/%.<source ext>
# 5: Compiler flags
# 6: Additional recipe prerequisites (not including the object files)
define mk_static_objs
$(1): $(3): $(4) $(6)
	$$(strip $(2) $(5) -c $$< -o $$@)
endef

# 1: The output file
# 2: Compiler
# 3: Object file pattern: <output dir>/%.o
# 4: Source file pattern: <source dir>/%.<source ext>
# 5: Compiler flags
# 6: Additional recipe prerequisites (not including the object files)
define mk_dynamic_objs
$(1): $(3): $(4) $(6)
	$$(strip $(2) $(5) -fPIC -c $$< -o $$@)
endef
