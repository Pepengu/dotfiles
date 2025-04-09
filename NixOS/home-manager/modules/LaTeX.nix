_: {
    programs.texlive = {
        enable = true;

        extraPackages = tpkgs: {
            inherit(tpkgs)
            scheme-full
            latexmk;
        };
    };
}


#(texlive.combine { inherit (texlive) scheme-full latexmk; })
