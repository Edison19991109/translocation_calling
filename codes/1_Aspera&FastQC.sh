#!/usr/bin/env bash
    # ascp -P 33001 -QT -l 300m  -i asperaweb_id_dsa.openssh era-fasp@fasp.sra.ebi.ac.uk:/vol1/fastq/SRR842/004/SRR8427194/SRR8427194_1.fastq.gz ./1_ORIGINAL >./log/SRR8427194_1_ASCP_standard_output 2>./log/SRR8427194_1_RAW_log
    # ascp -P 33001 -QT -l 300m  -i asperaweb_id_dsa.openssh era-fasp@fasp.sra.ebi.ac.uk:/vol1/fastq/SRR842/004/SRR8427194/SRR8427194_2.fastq.gz ./1_ORIGINAL >./log/SRR8427194_2_ASCP_standard_output 2>./log/SRR8427194_2_RAW_log

    gunzip ./1_ORIGINAL/ 2>./log/_gunzip_log
    gunzip ./1_ORIGINAL/ 2>./log/_gunzip_log

    fastqc --threads 3 -o ./2_FASTQC ./1_ORIGINAL/.fastq >./log/_FASTQC_standard_output 2>./log/_FASTQC_log;
    fastqc --threads 3 -o ./2_FASTQC ./1_ORIGINAL/.fastq >./log/_FASTQC_standard_output 2>./log/_FASTQC_log;
