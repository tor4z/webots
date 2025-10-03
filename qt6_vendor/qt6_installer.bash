#!/bin/env bash


QT_VERSION=$1
BUILD_PATH=$2

INSTALL_QT_DIR=$BUILD_PATH/.Qt
VENV_PATH=$BUILD_PATH/.venv
SYS_PYTHON=python3


VENV_BIN_PATH=$VENV_PATH/bin
VENV_PIP=$VENV_BIN_PATH/pip
VENV_AQT=$VENV_BIN_PATH/aqt


$SYS_PYTHON -m venv $VENV_PATH
$VENV_PIP install aqtinstall > /dev/null 2>&1
$VENV_AQT install-qt --outputdir $INSTALL_QT_DIR linux desktop $QT_VERSION gcc_64 -m qtwebsockets > /dev/null 2>&1
