ifndef ComSpec
	CLEAN =	(cd alib; $(MAKE) clean) && (cd csvfix; $(MAKE) clean)
else
	CLEAN = pwsh.exe -c "./clean.ps1"
endif

default:
	@echo "use 'make win', 'make lin' or 'make mac'"

win:
	pwsh.exe -c "./mkdirs.ps1"
	cd alib && $(MAKE) win
	cd csvfix && $(MAKE) win

lin:
	mkdir -p alib/obj alib/lib csvfix/obj csvfix/bin
	cd alib; $(MAKE) lin
	cd csvfix; $(MAKE) lin

mac:
	mkdir -p alib/obj alib/lib csvfix/obj csvfix/bin
	cd alib; $(MAKE) lin CCTYPE=clang
	cd csvfix; $(MAKE) lin CCTYPE=clang

clean:
	$(CLEAN)
