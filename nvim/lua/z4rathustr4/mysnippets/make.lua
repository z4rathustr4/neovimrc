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
TARGET  := PROJECT_NAME

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
	@echo "[all] Nothing left to do: '$(TARGET)' is built from $(TOTAL) object(s):"
	@for o in $(OBJS); do echo "[all]   - $$o"; done
	@echo "[all] Run ./$(TARGET) to use it."

build: $(TARGET)
	@echo "[build] Finished: $(TOTAL) object(s) linked into '$(TARGET)':"
	@for o in $(OBJS); do echo "[build]   - $$o"; done
	@echo "[build] Progress: $(STEPS)/$(STEPS) steps (100%)"

$(TARGET): $(OBJS)
	@echo "[100%] Linking $(TARGET) ($(STEPS)/$(STEPS))"
	@echo "       Objects: $(OBJS)"
	@$(CC) $(OBJS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@printf "[%3d%%] Compiling %s (%s/%s)\n" $$((100 * $(IDX_$@) / $(STEPS))) $< $(IDX_$@) $(STEPS)
	@$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

$(OBJ_DIR):
	@echo "[info] Creating object directory '$(OBJ_DIR)'"
	@mkdir -p $@

clean:
	@echo "[clean] Removing '$(OBJ_DIR)/' and '$(TARGET)'"
	@rm -rf $(OBJ_DIR) $(TARGET)

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  all      Default target. Runs 'build' and prints a summary of what was linked"
	@echo "  build    Compiles every src/*.c into obj/*.o and links them into '$(TARGET)'"
	@echo "  clean    Removes the '$(OBJ_DIR)/' directory and the '$(TARGET)' binary"
	@echo "  help     Shows this message"
	@echo ""
	@echo "Internal targets (run automatically):"
	@echo "  $(TARGET)       Links all object files into the final executable"
	@echo "  $(OBJ_DIR)/%.o  Compiles a single source file into an object file"
	@echo "  $(OBJ_DIR)      Creates the object directory"

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
