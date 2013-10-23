OCAMLC = ocamlfind ocamlc
OCAMLOPT = ocamlfind ocamlopt

INSTALL = ocamlfind install

lib: qrencode_stubs.o qRencode.cmo qRencode.cmx
	ocamlmklib -o qRencode qRencode.cmo qRencode.cmx qrencode_stubs.o -lpng -lqrencode

%.cmo: %.ml
	$(OCAMLC) -c $^

%.cmx: %.ml
	$(OCAMLOPT) -c $^

%.o: %.c
	$(OCAMLC) -c -ccopt -Wall -ccopt -Wextra -ccopt -std=c99 $^

test:
	$(OCAMLC) -custom qrencode_stubs.o test.ml -o test -cclib -lqrencode -cclib -lpng

clean:
	rm -f *.o
	rm -f *.a
	rm -f *.so
	rm -f *.cm*
	rm -rf *~
	rm -f test


install:
	$(INSTALL) qrencode META qRencode.cmi qRencode.cma qRencode.cmxa qRencode.a dllqRencode.so libqRencode.a

remove:
	ocamlfind remove qrencode

reinstall: remove install

