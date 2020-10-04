#!/usr/bin/env bash
cutadapt ./1_ORIGIN/.fq -u -3 -o ./3_CUTADAPT/_trimmed.fastq  >./log/_Cutadapt_standard_output 2>./log/_Cutadapt_log
cutadapt ./1_ORIGIN/.fq -u -2 -o ./3_CUTADAPT/_trimmed.fastq  >./log/_Cutadapt_standard_output 2>./log/_Cutadapt_log
cutadapt ./1_ORIGIN/.fq -u -5 -o ./3_CUTADAPT/_trimmed.fastq  >./log/_Cutadapt_standard_output 2>./log/_Cutadapt_log
