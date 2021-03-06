#!/bin/sh
set -e

pushd `dirname $0` > /dev/null
CURRENT_DIR=`pwd`
popd > /dev/null
# ================================================================ #

SDK_ROOT=`xcodebuild -version -sdk macosx Path`
echo "Target SDK Path: ${SDK_ROOT}"
# ================================================================ #

# LIBDISPATCH_DIR_NAME="libdispatch-703.1.4"
# LIBDISPATCH_DIR_NAME="libdispatch-703.20.1"
# LIBDISPATCH_DIR_NAME="libdispatch-703.30.5"
# LIBDISPATCH_DIR_NAME="libdispatch-703.50.37"
LIBDISPATCH_DIR_NAME="libdispatch-913.1.6"

echo "Install: ${LIBDISPATCH_DIR_NAME}"
# ================================================================ #

TARGET_HEADER_DIR="${SDK_ROOT}/usr/local/include/kernel/os"
TARGET_LIB_DIR="${SDK_ROOT}/usr/local/lib/kernel"
# ================================================================ #

mkdir -p "${TARGET_HEADER_DIR}"
mkdir -p "${TARGET_LIB_DIR}"
# ================================================================ #

cp -rf "${CURRENT_DIR}/${LIBDISPATCH_DIR_NAME}/firehose_buffer_private.h" "${TARGET_HEADER_DIR}/"
cp -rf "${CURRENT_DIR}/${LIBDISPATCH_DIR_NAME}/libfirehose_kernel.a" "${TARGET_LIB_DIR}/"
# ================================================================ #

echo "======== Done ========"
# ================================================================ #
