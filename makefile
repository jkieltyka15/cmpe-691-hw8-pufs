CC = gcc
CFLAGS = -std=c11 -Wall

SDIR = ./src
BUILD = ./build
BDIR = $(BUILD)/bin

$(shell mkdir -p $(BUILD))
$(shell mkdir -p $(BDIR))

all: pufmetric

pufmetric:
	$(CC) $(SDIR)/puf-metric.c -o $(BDIR)/puf-metric  $(CFLAGS)

.PHONY: clean

clean:
	@rm -f $(BDIR)/*
