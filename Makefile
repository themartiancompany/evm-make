# SPDX-License-Identifier: GPL-3.0-or-later

#    ----------------------------------------------------------------------
#    Copyright © 2024, 2025  Pellegrino Prevete
#
#    All rights reserved
#    ----------------------------------------------------------------------
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

PREFIX ?= /usr/local
_PROJECT=evm-make
_PROJECT_NPM=evm-make.js
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
LIB_DIR=$(DESTDIR)$(PREFIX)/lib/$(_PROJECT)
MAN_DIR?=$(DESTDIR)$(PREFIX)/share/man

_INSTALL_FILE=\
  install \
    -vDm644
_INSTALL_DIR=\
  install \
    -vdm755
_INSTALL_EXE=\
  install \
    -vDm755
_MAKE_EXE=\
  chmod \
    755
_MAKE_LINK=\
  ln \
    -sv

DOC_FILES=\
  $(wildcard \
      *.rst) \
  $(wildcard \
      *.md)
SCRIPT_FILES=\
  $(wildcard \
      $(_PROJECT)/*)

all: build-scripts

build-scripts:

	git \
	  submodule \
	    update \
	    --init \
	      "$(_PROJECT)/nodejs" || \
	true

check: shellcheck

shellcheck:

	shellcheck \
	  -s \
	    "bash" \
	    $(SCRIPT_FILES)

install: install-bash-scripts install-doc install-man

install-bash-scripts:

	$(_INSTALL_EXE) \
	  "$(_PROJECT)/bash/$(_PROJECT)" \
	  "$(BIN_DIR)/$(_PROJECT)"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/bash/libevm-config-convert" \
	  "$(BIN_DIR)/libevm-config-convert"

install-doc:

	$(_INSTALL_FILE) \
	  $(DOC_FILES) \
	  -t \
	  $(DOC_DIR)

install-man:

	$(_INSTALL_DIR) \
	  "$(MAN_DIR)/man1"
	rst2man \
	  "man/$(_PROJECT).1.rst" \
	  "$(MAN_DIR)/man1/$(_PROJECT).1"
	rst2man \
	  "man/libevm-config-convert.1.rst" \
	  "$(MAN_DIR)/man1/libevm-config-convert.1"

uninstall: uninstall-man uninstall-bash-scripts

uninstall-man:

	rm \
	  -vrf \
	  "$(MAN_DIR)/man1/$(_PROJECT).1" \
	  "$(MAN_DIR)/man1/libevm-config-convert.1"

uninstall-bash-scripts:

	rm \
	  -vrf \
	  "$(BIN_DIR)/$(_PROJECT)"
	rm \
	  -vrf \
	  "$(BIN_DIR)/libevm-config-convert"

.PHONY: build-scripts check install install-doc install-man install-bash-scripts shellcheck uninstall-bash-scripts
