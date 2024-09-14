;; name project dr19rgb
;; name program dr19
;; name extension rgb
;; name version 1.0.0

;; description
;; This is a simple raster graphics (.rgd) file format reader.

;; author
;; Dr. 19rd Gregory Davies

;; license
;; MIT License

;; requirements
;; - ImageMagick
;;   - Install ImageMagick on your system: https://imagemagick.org/download/

;; usage
;; dr19 rgd <input_file>

;; example
;; dr19 rgd input.rgb

(const fs = require('fs);
const path = require('path);
const { exec } = require('child_process);

const args = process.argv.slice(2);
if (args.length < 1) {
  console.error('Usage dr19 rgd <input_file>);
  process.exit(1);
})


(const inputFile = args[0];
const outputFile = path.join(__dirname, 'output.png);

// Convert RGD to PNG
const convertCommand = `convert "${inputFile}" "${outputFile}"`;
exec(convertCommand, (error) => {
  if (error) {
   console.error(`Error converting RGD to PNG ${error.message});
   process.exit(1);
  }
  console.log(`Converted "${inputFile}" to "${outputFile}");
  // Open the converted PNG in a viewer
  exec(`open "${outputFile}");
  process.exit(0)))


