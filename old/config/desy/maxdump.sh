#!/usr/bin/env bash
#
# fetch_dust_assets.sh – copy selected file types from a remote directory over SSH
#
# Usage:
#   ./fetch_dust_assets.sh [DESTINATION_DIRECTORY]
#
# If DESTINATION_DIRECTORY is omitted, files are downloaded into ./dust_download.
#
# Requirements:
#   • rsync installed locally (brew/apt/yum or similar).
#   • SSH access to host "max" set up (either via ~/.ssh/config Host max … or user@host form).
#
# Customisation:
#   Adjust REMOTE, REMOTE_DIR, EXTENSIONS, or EXCLUDE_DIRS as needed.  You can also export
#   them before running the script to override, e.g.:
#     EXCLUDE_DIRS="envs .cache logs" ./fetch_dust_assets.sh ~/dust_subset
#
# Notes on filtering order:
#   rsync stops at the *first* matching rule.  Directory‑wide exclusions must therefore
#   come *before* the general include rules, otherwise an earlier "include */" would allow
#   the directory in.  The arrays below are ordered accordingly.
#
set -euo pipefail

# --- User‑adjustable parameters (can be overridden via environment variables) ---
: "${REMOTE:=max}"                       # SSH host alias or user@host
: "${LOCAL_DIR:=/home/samonaco/PhD/presentations/qgan/maxdump/}"   # Remote directory to scan
: "${EXTENSIONS:=pdf}"       # Space‑separated list of extensions (no dots)
: "${EXCLUDE_DIRS:=envs .cache QAG}"         # Space‑separated list of directory names to skip entirely (any depth)

REMOTE_DIR="${1:-/home/samonaco/dust}"

mkdir -p "$LOCAL_DIR"

# Split EXTENSIONS and EXCLUDE_DIRS into bash arrays
IFS=' ' read -r -a EXT_ARR <<< "$EXTENSIONS"
IFS=' ' read -r -a EXCL_ARR <<< "$EXCLUDE_DIRS"

# Build directory‑exclusion rules *first* (first match wins!)
FILTER_ARGS=( )
for d in "${EXCL_ARR[@]}"; do
  # Exclude the dir whether it is top‑level or nested anywhere
  FILTER_ARGS+=("--exclude=$d/**" "--exclude=*/$d/**")
done

# Build the include rules for wanted file extensions and traversal
for ext in "${EXT_ARR[@]}"; do
  FILTER_ARGS+=("--include=*/" "--include=*.$ext")
done

# Finally, exclude everything not explicitly included
FILTER_ARGS+=("--exclude=*")

# Execute rsync.  The trailing slash after REMOTE_DIR is important so rsync
# copies the *contents* of the directory rather than the directory itself.
rsync -av "${FILTER_ARGS[@]}" "${REMOTE}:${REMOTE_DIR}/" "$LOCAL_DIR/"

printf '\n✅  Finished.  Matching files copied to %s (excluded dirs: %s)\n' "$LOCAL_DIR" "$EXCLUDE_DIRS"
