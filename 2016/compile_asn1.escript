#!/usr/bin/env escript
%% Compile all the modules

main(_) ->
    file:make_dir("ebin"),
    compile("AddGrpB"),
	compile("AddGrpC"),
	compile("DSRC"),
	compile("ITIS"),
	compile("NTCIP"),
	compile("REGION").

compile(Filename) ->
    asn1ct:compile(Filename, [uper,jer,verbose, {i, "./asn"}, {outdir, "./ebin"} ]).