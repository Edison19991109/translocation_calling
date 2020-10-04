#!/bin/bash
# BSUB -R "span[ptile=1]"
# BSUB -o ./log/BWA_log
# BSUB -e ./log/BWA_error
# BSUB -n 1
    normal_sample_ID=
    reference_genome=
    working_directory=
    digit_lc_bed=
    digit_reference_Chrlen=
    digit_reference=
    digit_reference_idx=

bwa mem -M -R '@RG\tID:SRR8427194\tSM:NORMAL\tLB:WXS\tPL:Illumina' ${reference_genome} ./3_CUTADAPT/${normal_sample_ID}_1_trimmed.fastq ./3_CUTADAPT/${normal_sample_ID}_2_trimmed.fastq  | samtools sort -o ./4_BWA/${normal_sample_ID}.bam -
samtools index ./4_BWA/${normal_sample_ID}.bam

picard MarkDuplicates \
    INPUT=./4_BWA/${normal_sample_ID}.bam \
    OUTPUT=./4_BWA/${normal_sample_ID}_dupmark.bam \
    REMOVE_SEQUENCING_DUPLICATES=true \
    METRICS_FILE=./4_BWA/${normal_sample_ID}_dupmark_metrics.txt \
    CREATE_INDEX=true \
    VALIDATION_STRINGENCY=STRICT

samtools sort -n ./4_BWA/${normal_sample_ID}_dupmark.bam -o ./4_BWA/${normal_sample_ID}_nmsorted.bam

samtools view -F 256 -F 2048 ./4_BWA/${normal_sample_ID}_nmsorted.bam -o ./4_BWA/${normal_sample_ID}_DIGIT_FINAL.sam

digit analyse -i ${working_directory}/4_BWA/${normal_sample_ID}_DIGIT_FINAL.sam -o ${working_directory}/5_DIGIT -s 2.33 -a false -lc ${digit_lc_bed} -r ${digit_reference_Chrlen} -q 0

digit proxval -T 100 -c 3 -i ${working_directory}/5_DIGIT${normal_sample_ID}_DIGIT_FINAL_trl.sam -o ${working_directory}/5_DIGIT/trl_clusters -g ${digit_reference} -x ${digit_reference_idx} -M -1 -t file=${working_directory}/5_DIGIT${normal_sample_ID}_DIGIT_FINAL_summary.txt -r ${digit_reference_Chrlen}


####################################
    tumor_sample_ID=

bwa mem -M -R '@RG\tID:${read_group_ID}\tSM:NORMAL\tLB:WXS\tPL:Illumina' ${reference_genome} ./3_CUTADAPT/${tumor_sample_ID}_1_trimmed.fastq ./3_CUTADAPT/${tumor_sample_ID}_2_trimmed.fastq  | samtools sort -o ./4_BWA/${tumor_sample_ID}.bam -
samtools index ./4_BWA/${tumor_sample_ID}.bam

picard MarkDuplicates \
    INPUT=./4_BWA/${tumor_sample_ID}.bam \
    OUTPUT=./4_BWA/${tumor_sample_ID}_dupmark.bam \
    REMOVE_SEQUENCING_DUPLICATES=true \
    METRICS_FILE=./4_BWA/${tumor_sample_ID}_dupmark_metrics.txt \
    CREATE_INDEX=true \
    VALIDATION_STRINGENCY=STRICT

samtools sort -n ./4_BWA/${tumor_sample_ID}_dupmark.bam -o ./4_BWA/${tumor_sample_ID}_nmsorted.bam

samtools view -F 256 -F 2048 ./4_BWA/${tumor_sample_ID}_nmsorted.bam -o ./4_BWA/${tumor_sample_ID}_DIGIT_FINAL.sam

digit analyse -i ${working_directory}/4_BWA/${tumor_sample_ID}_DIGIT_FINAL.sam -o ${working_directory}/5_DIGIT -s 2.33 -a false -lc ${digit_lc_bed} -r ${digit_reference_Chrlen} -q 0

digit proxval -T 100 -c 3 -i ${working_directory}/5_DIGIT/${tumor_sample_ID}_DIGIT_FINAL_trl.sam -o ${working_directory}/5_DIGIT/trl_clusters -g ${digit_reference} -x ${digit_reference_idx} -M -1 -t file=${working_directory}/5_DIGIT${tumor_sample_ID}_DIGIT_FINAL_summary.txt -r ${digit_reference_Chrlen}
