# PLINK-ng

**PLINK-ng** is a comprehensive update to the original **PLINK toolset**, designed for **efficient whole-genome association analysis**. It offers a range of functionalities to perform large-scale genetic analyses in a computationally efficient manner.

## Key Features
* **Enhanced Performance**: Optimized for speed and memory efficiency, allowing analysis of larger datasets.
* **Expanded Data Support**: Handles VCF files and dosage data, accommodating modern genomic data formats.
* **Modular Libraries**: Includes libraries like plink2_text for efficient text processing and pgenlib for reading and writing PLINK 2.x genotype files.


## Directory Structure
The repository is organized into several key directories:
* **Python/**: Contains a basic Python .pgen read/write library.
* **pgenlibr/**: Includes a basic R .pgen reader.
* **include/**: Houses two LGPL3-licensed major libraries, with the PLINK 2.0 application built on top of them.


## Libraries Overview
### plink2_text
This library provides classes designed to replace traditional methods of iterating over text lines, such as std::getline() and fgets(). Key features include:

* **Efficient Line Access**: Returns pointers to the beginning and end of each line in the underlying binary stream, reducing the need for copying.
* **Automatic Decompression**: Detects and decompresses gzipped and Zstd-compressed files, supporting pipe file descriptors.
* **Multithreaded Decompression**: Automatically reads and decompresses ahead, with multithreading enabled by default for BGZF-compressed files.
* **Efficient String-to-Double Conversion**: Includes the ScanadvDouble() utility function for rapid conversion, beneficial for parsing standard-locale formatted output.

### pgenlib
This library supports reading and writing of PLINK 2.x genotype files (.pgen). Key properties:

* **Backward Compatibility**: A PLINK 1 .bed file is a valid .pgen file.
* **Extended Representation**: Can represent multiallelic, phased, and/or dosage information.
* **Compression**: Utilizes domain-specific compression for fast operations, allowing computations like allele frequency directly on the compressed data.

Python and R wrappers for pgenlib are available in the Python/ and pgenlibr/ directories, respectively. These wrappers are currently basic but can be extended as needed.

## Compilation Instructions
The **build_dynamic/** directory contains a Makefile suitable for Linux and macOS dynamic builds. On Linux, if Intel MKL or AOCL static libraries are installed, you can link to them during compilation.

For Windows builds, the **build_win/** directory provides a Makefile for producing static builds, requiring MinGW[-w64] and zlib.

Additionally, the **build_cuda/** directory contains a Makefile for producing an Nvidia GPU-using build on Linux, though GPU support is currently minimal.

## Statistical Functions
The LGPL3-licensed plink2_stats component includes a function for computing the 2x2 Fisher's exact test p-value in approximately O(sqrt(n)) time, **significantly faster than traditional O(n) algorithms**. It also offers several log-p-value computations that remain **accurate beyond the limits of analogous functions** in many other libraries.

## Documentation
For more detailed information and documentation, please visit [www.cog-genomics.org/plink/2.0](https://).