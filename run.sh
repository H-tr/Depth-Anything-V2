#!/bin/bash

# Base directory containing subfolders
BASE_DIR="../recon"

# Loop over each item in the base directory
for SUBDIR in "$BASE_DIR"/*; do
  # Check if the item is a directory
  if [ -d "$SUBDIR" ]; then
    # Define the images path
    IMG_PATH="$SUBDIR/images"
    # Check if the images directory exists
    if [ -d "$IMG_PATH" ]; then
      # Define the output directory
      OUTDIR="$SUBDIR/depth"
      # Create the output directory if it doesn't exist
      mkdir -p "$OUTDIR"
      echo "Processing images in $IMG_PATH"
      echo "Outputting depth maps to $OUTDIR"
      # Run the Python script with the specified parameters
      python run.py \
        --encoder vitl \
        --img-path "$IMG_PATH" \
        --outdir "$OUTDIR" \
        --pred-only \
        --grayscale
    else
      echo "No 'images' directory found in $SUBDIR. Skipping..."
    fi
  fi
done
