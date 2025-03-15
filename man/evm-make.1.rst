..
   SPDX-License-Identifier: AGPL-3.0-or-later

   ----------------------------------------------------------------------
   Copyright © 2024, 2025  Pellegrino Prevete

   All rights reserved
   ----------------------------------------------------------------------

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU Affero General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Affero General Public License for more details.

   You should have received a copy of the GNU Affero General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.


==================
evm-make
==================

-------------------------------------------------------
Ethereum Virtual Machine (EVM) build and install tool.
-------------------------------------------------------
:Version: evm-make |version|
:Manual section: 1

Synopsis
========

evm-make *[options]* *command*

Description
===========

Ethereum Virtual Machine (EVM) GNU Make-like
build and install tool for applications developed
using libEVM and the EVM Toolchain.

This project is part of the EVM Toolchain.

Commands
========

* build
* install
* install_sources
* install_deployments_config
* install_deployments

Options
=======

-b backend           Compiler backend.
-C project_dir       Project directory.
-b compiler_backend  Backend for solidity-compiler;
                     can be 'solc' or 'hardhat'.
-w work_dir          Work directory.
-o lib_dir           Install directory.
-l y/n               Whether to pass the clean cache
                     option to solidity-compiler.
                     When the backend is 'hardhat'
                     defaults to 'y', while for 'solc' is 'n'.
-f y/n               If 'y', skip rebuilding the contracts
                     if artifacts are found already in the
                     directory.

-h                   Display help.
-c                   Enable color output.
-v                   Enable verbose output.

Bugs
====

https://github.com/themartiancompany/evm-make/-/issues

Copyright
=========

Copyright Pellegrino Prevete. AGPL-3.0.

See also
========

* solidity-compiler
* libevm

.. include:: variables.rst
