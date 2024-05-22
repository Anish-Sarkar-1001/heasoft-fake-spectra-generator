# Heasoft Xspec fake spectra generator

The script is used to simulate fake data sets according to the guidelines of the `fakeit` in *Xspec*, **Heaosft**

### Instructions:

- Load a dataset in Xspec and obtain the best fit parameters
- Save it to a `.xcm` file
- Download and move the `fake-spectra.sh` script in the folder that contains the `.xcm` file along with the `.fits` spectrua file, `.fits` background file and `.rmf` response file. **NOTE: All these files need to be in the same directory**
- Run the script using
  
  > ```console
  > ./fake-spectra.sh
  > ```
- You will be prompted to supply a file prefix, the `.xcm` file name and the number of fake spectra you want to generate
- A new folder named `fake-spectra` will be generated containing the fake spectra and background files
