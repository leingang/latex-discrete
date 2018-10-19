# leindisc
LaTeX package for typesetting discrete math documents

## Installation

Download or clone the repository.  Within the repository's directory, execute:

    $ l3build install --full

This should install the package in a place that your TeX installation can find it
and also that you can write to.  

If your TeX installation doesn't have `l3build`, try instead:

    $ texlua build.lua install --full
    
If the `--full` option isn't recognized, update your TeX distribution.  Or, skip
it and install the documentation separately:

    $ cp -r build/doc/* `kpsewhich --var-value TEXMFHOME`/doc 

## Documentation

To view the documentation, execute:

    $ texdoc leindisc
