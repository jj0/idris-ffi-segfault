include config.mk

CFLAGS:=-Wextra -fPIC -Wno-unused-parameter $(CFLAGS)
SOURCES=defs.c
OBJECTS=$(SOURCES:.c=.o)
LIB=libfirst.a

build: $(SOURCES) $(LIB)

$(LIB): $(OBJECTS) 
	ar r $@ $(OBJECTS)
	ranlib $@

.c.o:
	$(CC) -c $(CFLAGS) $< -o $@

install: $(LIB) .PHONY
	mkdir -p $(TARGET)
	install $(LIB) $(TARGET)

clean: .PHONY
	rm -f $(OBJECTS) $(LIB)

.PHONY:
