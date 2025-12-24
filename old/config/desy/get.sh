#!/bin/bash

# Get the folder name from the output of phdnweeks

source ~/dotfiles/config/commands.sh
TARGET_PARENT=~/PhD/presentations/qgan/weeks
FOLDER_NAME=${1:-$(phdnweeks)}
TARGET_DIR="$TARGET_PARENT/$FOLDER_NAME"

# Check if the directory already exists
if [ -d "$TARGET_DIR" ]; then
  echo "Directory '$TARGET_DIR' already exists. Skipping clone."
  exit 0
fi

# Clone into a temporary folder
TEMP_DIR=$(mktemp -d)
git clone git@github.com:SaverioMonaco/QGANbeamer.git "$TEMP_DIR"

# Remove the .git folder
rm -rf "$TEMP_DIR/.git"

# Move the folder to the final destination with the desired name
mv "$TEMP_DIR" "$TARGET_DIR"

# Path to main.tex
MAIN_TEX="$TARGET_DIR/main.tex"

# Replace the \week{...} line if main.tex exists
if [ -f "$MAIN_TEX" ]; then
  sed -i "s/\\\\week{[0-9]*}/\\\\week{$FOLDER_NAME}/" "$MAIN_TEX"
  echo "Updated \week{$FOLDER_NAME} in main.tex"
else
  echo "Warning: main.tex not found in $TARGET_DIR — skipping \week{} update."
fi

echo "Repository cloned and moved to '$TARGET_DIR', with .git removed."