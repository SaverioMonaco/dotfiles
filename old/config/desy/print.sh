#!/bin/bash

# Default values
HOST="naf"
PRINTER_BW="cmsps1"
PRINTER_COLOR="cmscp2"
TMPFILE="/home/samonaco/Documents/printjob.pdf"

usage() {
  echo "Usage: $0 [-u url] [-f file] [-c] [-t]"
  echo "  -u url     URL of PDF to download and print"
  echo "  -f file    Local PDF file to print"
  echo "  -c         Use color printer (default: B/W)"
  echo "  -t         Print two-sided (duplex)"
  exit 1
}

# Parse options
while getopts "u:f:ct" opt; do
  case $opt in
    u) URL="$OPTARG" ;;
    f) FILE="$OPTARG" ;;
    c) COLOR=1 ;;
    t) TWOSIDE=1 ;;
    *) usage ;;
  esac
done

# Check input
if [ -n "$URL" ] && [ -n "$FILE" ]; then
  echo "Error: specify either URL or file, not both."
  usage
fi

if [ -z "$URL" ] && [ -z "$FILE" ]; then
  echo "Error: must specify a URL or a file."
  usage
fi

# Fetch file
if [ -n "$URL" ]; then
  echo "Downloading $URL..."
  curl -L -f -A "Mozilla/5.0" -o "$TMPFILE" "$URL" || { echo "Download failed"; exit 1; }
  FILE="$TMPFILE"
fi

# Pick printer
if [ "$COLOR" = "1" ]; then
  PRINTER="$PRINTER_COLOR"
else
  PRINTER="$PRINTER_BW"
fi

# Build lp options
LP_OPTS="-d $PRINTER"
if [ "$TWOSIDE" = "1" ]; then
  LP_OPTS="$LP_OPTS -o sides=two-sided-long-edge"
else
  LP_OPTS="$LP_OPTS -o sides=one-sided"
fi

# Copy and print
BASENAME=$(basename "$FILE")
scp "$FILE" "$HOST:/tmp/$BASENAME" && \
ssh "$HOST" "lp $LP_OPTS /tmp/$BASENAME"

echo "Print job sent."
