# Translocation Calling Pipeline

This is the pipeline for DNA translocation calling. 

If you get any question about the pipeline, you can directly contact Edison Jianning KANG (e-mail address: <jianning.18@intl.zju.edu.cn>).


# Outline

<!-- TOC -->

- [Translocation Calling Pipeline](#translocation-calling-pipeline)
- [Outline](#outline)
- [Introduction](#introduction)
- [Copyright](#copyright)
- [Running Environment](#running-environment)
- [Useage](#useage)
    - [0. Introduction](#0-introduction)
    - [1. Data Downloading and Quality Control](#1-data-downloading-and-quality-control)
    - [2. Data Cleaning and its Quality Control, Alignment， Translocation Calling](#2-data-cleaning-and-its-quality-control-alignment-translocation-calling)
- [Reference](#reference)

<!-- /TOC -->

# Introduction

This pipeline can be used for analyzing the next generation sequencing data. It includes five steps:
1. Data Downloading (*This step can be skipped if the sequencing data is already on hand.*)

2. Quality Control

3. Data Cleaning and its Quality Control

4. Alignment

5. Translocation Calling

The corresponding running scripts are provided. For their useage, please refer to the later content.

# Copyright

Copyright (C) 2020 Edison Jianning KANG

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.

![ [Large GPLv3 logo with “Free as in Freedom”] ](https://www.gnu.org/graphics/gplv3-with-text-136x68.png)

# Running Environment

1. FastQC >=0.11.9

2. CutAdapt >=2.10

3. BWA >=0.7.17-r1188

4. GATK, both v3 and v4

   The output of `gatk --version`:

   ```
   The Genome Analysis Toolkit (GATK) v4.1.4.1
   HTSJDK Version: 2.21.0
   Picard Version: 2.21.2
   ```

   GATK 3 >=`3.8-1-0-gf15c1c3ef`

5. IBM Aspera

    ```
    Aspera Connect version 3.9.8.176272
    ascp version 3.9.1.168302
    ```
    
6. R>=4.0.2

7. gzip>=1.10

8. Unzip>=6.00

# Useage
## 0. Introduction
All the scripts and an example directory structure for running those scripts have been added to this repository. To use the pipeline, you can directly fork or clone the repository to the local computer. 

(**Notice: Any further change may be added to the pipeline. If you want to keep using the latest one, it is better to fork the repository rather than clone it.**)

The structure of this repository is illustrated below:
```
    - codes
    It stores all the scripts and an example directory structure
        - 1_ORIGINAL
        - 2_FASTQC
        - 3_CUTADAPT
        - 4_BWA
        - 5_DIGIT
        - log

        Above directories are an example directory strcture. Running results of each steps will be stored in corresponding dicretory. For log directory, it will store the log file of all the steps.

          1_Aspera&FASTQC.sh
          2_Cutadapt.sh
          3_BWA_DIGIT.sh

    - LICENSE
    It is the lincense file for this pipeline

    - README.md
    It is the ReadMe file that shown here.
```

## 1. Data Downloading and Quality Control
To perform the first two steps, you can run the script [`1_Aspera&FASTQC.sh`](https://github.com/Edison19991109/translocation_calling/blob/master/1_Aspera%26FastQC.sh). Downloading is conducted by using the `IBM Aspera` and an example downloading ftp link is provided. Quality control is conducted by using `FastQC`. To run the script, sample header and sample ID are needed.

*(Detail version information of all the programs that are mentioned here are provided in an early section.)*

## 2. Data Cleaning and its Quality Control, Alignment， Translocation Calling
To run the last four steps, you can run the script [`2_Cutadapt.sh`](https://github.com/Edison19991109/translocation_calling/blob/master/2_Cutadapt.sh) and [3_BWA&DIGIT.SH](https://github.com/Edison19991109/translocation_calling/blob/master/3_BWA%26DIGIT.sh). Data cleaning is done through `Cutadapt`. Qulity control is also conducted by using `FastQC` (ommited in this version of the script). Alignment is conducted by `BWA-MEM`. Translocation calling is conducted by `DIGIT` pipeline.

*(Detail version information of all the programs that are mentioned here are provided in an early section.)*

# Reference
It will be added later.