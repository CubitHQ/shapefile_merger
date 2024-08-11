Here's a `README.md` file for your repository, detailing the usage of the script and listing the requirements:

---

# Shapefile Merger

This repository contains a shell script, `merge_shapefiles.sh`, that automates the process of unzipping and merging multiple shapefiles into a single shapefile using `ogr2ogr`. This tool is designed for use on macOS systems with `gdal` tools installed.

## Requirements

Before using the script, ensure you have the following installed:

- **macOS**: The script is designed to run on macOS.
- **GDAL**: The script requires `ogr2ogr`, which is part of the GDAL suite. You can install GDAL via Homebrew:
  ```bash
  brew install gdal
  ```

## Usage

To run the script, use the following command format:

```bash
./merge_shapefiles.sh -d <directory> [-o <output_file>]
```

### Parameters

- `-d <directory>`: (Required) The directory containing the zipped shapefiles.
- `-o <output_file>`: (Optional) The name of the output combined shapefile. Defaults to `combined.shp` if not provided.

### Examples

1. **Basic Usage:**

   Unzip and merge all shapefiles in the specified directory, outputting to `combined.shp`:

   ```bash
   ./merge_shapefiles.sh -d /path/to/zipped_shapefiles_directory
   ```

2. **Specify Output File:**

   Unzip and merge all shapefiles, specifying the output file name:

   ```bash
   ./merge_shapefiles.sh -d /path/to/zipped_shapefiles_directory -o output_filename.shp
   ```

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/cubithq/shapefile-merger.git
   cd shapefile-merger
   ```

2. **Make the Script Executable:**

   Before running the script, ensure it is executable:

   ```bash
   chmod +x merge_shapefiles.sh
   ```

## Troubleshooting

- **No Shapefiles Found:** Ensure that your zipped files contain valid shapefiles and that the directory path is correct.
- **Permission Denied:** Make sure the script is executable and you have the necessary permissions to read/write in the directories specified.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributions

Contributions are welcome! Please feel free to submit a pull request or open an issue if you have suggestions or find any bugs.

---

Feel free to modify the `README.md` as needed to fit your specific use case or to add additional details. Let me know if there's anything else you'd like to include!