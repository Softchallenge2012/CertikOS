# -*-Makefile-*-

OBJDIRS		+= $(USER_OBJDIR)/idle

USER_FORK_SRC	+= $(USER_DIR)/fork/fork.c
USER_FORK_OBJ	:= $(patsubst %.c, $(OBJDIR)/%.o, $(USER_FORK_SRC))
USER_FORK_OBJ	:= $(patsubst %.S, $(OBJDIR)/%.o, $(USER_FORK_OBJ))

KERN_BINFILES	+= $(USER_OBJDIR)/fork/fork

fork: $(USER_OBJDIR)/fork/fork

$(USER_OBJDIR)/fork/fork: $(USER_LIB_OBJ) $(USER_FORK_OBJ)
	@echo + ld[USER/fork] $@
	$(V)$(LD) -o $@ $(USER_LDFLAGS) $(USER_LIB_OBJ) $(USER_FORK_OBJ) $(GCC_LIBS)
	$(V)$(OBJDUMP) -S $@ > $@.asm
	$(V)$(NM) -n $@ > $@.sym

$(USER_OBJDIR)/fork/%.o: $(USER_DIR)/fork/%.c
	@echo + cc[USER/fork] $<
	@mkdir -p $(@D)
	$(V)$(CC) $(USER_CFLAGS) -c -o $@ $<

$(USER_OBJDIR)/fork/%.o: $(USER_DIR)/fork/%.S
	@echo + as[USER/fork] $<
	@mkdir -p $(@D)
	$(V)$(CC) $(USER_CFLAGS) -c -o $@ $<
