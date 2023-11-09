ghc-version=${shell ghc --numeric-version}

# -I${shell find ${hs_to_c} -name include}

#fib: src/main.c
#	${CC} -o $@ src/main.c -I ${shell find ${hs-to-c} -name include} -I ${shell find ${ghc} -name HsFFI.h | xargs dirname} -L ${shell find ${ghc} -name "libHSrts_thr-ghc*.so" | xargs dirname} -L ${shell find ${hs-to-c} -name "libHShs-to-c*.so" | xargs dirname} -l HSrts_thr -l HShs-to-c-0-F08eZePK8mrFMbdPz3rxjP-ghc${ghc-version} -L ${shell find ${ghc} -name "libHSghc-prim-*.so" | xargs dirname} -l libHSghc-prim

fib: src/main.c
	${CC} -o $@ src/main.c -lHsToC

#fib2: src/main.c
#	${ghc}/bin/ghc --make -no-hs-main -optc-O src/main.c -o $@ -I${shell find ${hs-to-c} -name include} -L${shell find ${hs-to-c} -name "libHShs-to-c*.so" | xargs dirname} -l HShs-to-c-0-F08eZePK8mrFMbdPz3rxjP-ghc${ghc-version}

install: fib
	mkdir -p ${out}/bin && cp fib ${out}/bin
