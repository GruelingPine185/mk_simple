# 1: The output file
# 2: The archive program to use
# 3: Flags for the archive program
# 4: Object files
# 5: Additional recipe prerequisites (not including the object files)
define mk_static_lib
$(1): $$(@D) $(4) $(5)
	$$(strip $(2) $(3) $$@ $(4))
endef

# 1: The output file
# 2: Compiler
# 3: Compiler flags
# 4: Compiler linker flags
# 5: Object files
# 6: Additional recipe prerequisites (not including the object files)
define mk_dynamic_lib
$(1): $$(@D) $(5) $(6)
	$$(strip $(2) $(3) -shared $(5) -o $(1) $(4))
endef

# 1: The output file
# 2: Compiler
# 3: source file extension
# 4: Compiler flags
# 5: Additional recipe prerequisites (not including the object files)
define mk_static_objs
$(1): %.o: $$(addsuffix $(3), %.) $$(@D) $(5)
	$$(strip $(2) $(4) -c $$< -o $$@)
endef

# 1: The output file
# 2: Compiler
# 3: source file extension
# 4: Compiler flags
# 5: Additional recipe prerequisites (not including the object files)
define mk_dynamic_objs
$(1): %.o: $$(addsuffix $(3), %.) $$(@D) $(5)
	$$(strip $(2) $(4) -fPIC -c $$< -o $$@)
endef
