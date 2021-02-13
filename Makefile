# ---------------------------------------------------------------
# https://www.rapidtables.com/code/linux/gcc/gcc-l.html <- how to link libs

CC := gcc

C_FLAGS :=

I_FLAGS :=

L_FLAGS :=

SOURCES := base64.c
LIB_NAME := base64_c.a
BUILD_DIR := ./

ARCHIVER := ar -rcs

# ---------------------------------------------------------------

OBJS := $(SOURCES:.c=.o)

OBJS_BUILD := $(addprefix $(BUILD_DIR), $(notdir $(SOURCES:.c=.o)))

# ---------------------------------------------------------------

.PHONY : build

build : C_FLAGS += -g
build : $(OBJS)

release : C_FLAGS += -O3
release : $(OBJS) dist

%.o : %.c
	$(CC) $(C_FLAGS) $(I_FLAGS) -c $< -o $(addprefix $(BUILD_DIR), $(notdir $@))

dist : $(OBJS_BUILD) 
	$(ARCHIVER) $(LIB_NAME) $< 

clear : 
	@rm -f $(OBJS_BUILD)
