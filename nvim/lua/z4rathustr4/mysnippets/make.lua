local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node

local function lines(str)
	return vim.split(str, "\n", { plain = true })
end

-- Recipe lines start with <T>, which becomes a real tab below.
-- @@TARGET@@ becomes the editable project name.
local body = [=[
CC      := cc
CFLAGS  := -std=c17 -Wall -Wextra -Werror -Wno-unused-parameter -Wno-unused-function -Iinclude
TARGET  := @@TARGET@@

SRC_DIR := src
OBJ_DIR := obj

SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

# progress tracking
TOTAL := $(words $(OBJS))
STEPS := $(shell expr $(TOTAL) + 1)

# idx_obj/foo.o := 1, idx_obj/bar.o := 2, ...
$(foreach i,$(shell seq 1 $(TOTAL)),$(eval IDX_$(word $(i),$(OBJS)) := $(i)))

.DEFAULT_GOAL := all

all: build
<T>@echo "[all] Nothing left to do: '$(TARGET)' is built from $(TOTAL) object(s):"
<T>@for o in $(OBJS); do echo "[all]   - $$o"; done
<T>@echo "[all] Run ./$(TARGET) to use it."

build: $(TARGET)
<T>@echo "[build] Finished: $(TOTAL) object(s) linked into '$(TARGET)':"
<T>@for o in $(OBJS); do echo "[build]   - $$o"; done
<T>@echo "[build] Progress: $(STEPS)/$(STEPS) steps (100%)"

$(TARGET): $(OBJS)
<T>@echo "[100%] Linking $(TARGET) ($(STEPS)/$(STEPS))"
<T>@echo "       Objects: $(OBJS)"
<T>@$(CC) $(OBJS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
<T>@printf "[%3d%%] Compiling %s (%s/%s)\n" $$((100 * $(IDX_$@) / $(STEPS))) $< $(IDX_$@) $(STEPS)
<T>@$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

$(OBJ_DIR):
<T>@echo "[info] Creating object directory '$(OBJ_DIR)'"
<T>@mkdir -p $@

clean:
<T>@echo "[clean] Removing '$(OBJ_DIR)/' and '$(TARGET)'"
<T>@rm -rf $(OBJ_DIR) $(TARGET)

help:
<T>@echo "Usage: make [target]"
<T>@echo ""
<T>@echo "Targets:"
<T>@echo "  all      Default target. Runs 'build' and prints a summary of what was linked"
<T>@echo "  build    Compiles every src/*.c into obj/*.o and links them into '$(TARGET)'"
<T>@echo "  clean    Removes the '$(OBJ_DIR)/' directory and the '$(TARGET)' binary"
<T>@echo "  help     Shows this message"
<T>@echo ""
<T>@echo "Internal targets (run automatically):"
<T>@echo "  $(TARGET)       Links all object files into the final executable"
<T>@echo "  $(OBJ_DIR)/%.o  Compiles a single source file into an object file"
<T>@echo "  $(OBJ_DIR)      Creates the object directory"

-include $(DEPS)

.PHONY: all build clean help

]=]

body = (body:gsub("\n<T>", "\n\t"))
local before, after = body:match("^(.-)@@TARGET@@(.*)$")

return {
	s({ trig = "make", dscr = "default ass C project Makefile" }, {
		t(lines(before)),
		i(1, "PROJECT_NAME"),
		t(lines(after)),
		i(0),
	}),
}
