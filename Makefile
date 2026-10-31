.PHONY: build lint test

IVERILOG ?= iverilog
VVP ?= vvp
BUILD_DIR := build
SIM := $(BUILD_DIR)/mem

build:
	@mkdir -p $(BUILD_DIR)
	$(IVERILOG) -g2012 -Wall -s mem_tb -o $(SIM) mem.v mem_tb.v

lint: build
	@echo "Icarus warning check completed during build."

test: build
	$(VVP) $(SIM)
