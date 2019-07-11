#!/bin/sh

puppet module uninstall --ignore-changes maany-simple_grid

puppet module install --module_repository=http://lc-02.cern.ch maany-simple_grid
