#!/bin/bash

# Default values
SOURCE_DIR=""
OUTPUT_SHAPEFILE="combined.shp"

# Function to display usage
usage() {
    echo "Usage: $0 -d <directory> [-o <output_file>]"
    echo "  -d  Directory containing the zipped shapefiles (required)"
    echo "  -o  Output combined shapefile name (default: combined.shp)"
    exit 1
}

# Parse command-line options
while getopts "d:o:" opt; do
    case $opt in
        d)
            SOURCE_DIR=$OPTARG
            ;;
        o)
            OUTPUT_SHAPEFILE=$OPTARG
            ;;
        *)
            usage
            ;;
    esac
done

# Check if source directory is provided
if [ -z "$SOURCE_DIR" ]; then
    echo "Error: Source directory is required."
    usage
fi

# Create a directory for unzipped shapefiles
UNZIP_DIR="unzipped_shapefiles"
mkdir -p $UNZIP_DIR

# Unzip all shapefiles in the source directory
echo "Unzipping shapefiles..."
for zipfile in "$SOURCE_DIR"/*.zip; do
    unzip -o "$zipfile" -d "$UNZIP_DIR"
done

# Find all .shp files in the unzipped directory
shapefiles=("$UNZIP_DIR"/*.shp)

# Check if there are any shapefiles to process
if [ ${#shapefiles[@]} -eq 0 ]; then
    echo "No shapefiles found in the unzipped directory."
    exit 1
fi

# Combine shapefiles using ogr2ogr
echo "Combining shapefiles into $OUTPUT_SHAPEFILE..."
first_file=${shapefiles[0]}
ogr2ogr -f "ESRI Shapefile" "$OUTPUT_SHAPEFILE" "$first_file"

for shapefile in "${shapefiles[@]:1}"; do
    ogr2ogr -f "ESRI Shapefile" -update -append "$OUTPUT_SHAPEFILE" "$shapefile" -nln combined
done

echo "Combined shapefile created: $OUTPUT_SHAPEFILE"