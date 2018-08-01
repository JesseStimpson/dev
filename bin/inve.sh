#!/bin/sh
export VIRTUAL_ENV="/home/jstimpson/.venv/sre"
export PATH="$VIRTUAL_ENV/bin:$PATH"
unset PYTHON_HOME
exec "${@:-$SHELL}"
