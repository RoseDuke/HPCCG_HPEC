#!/bin/bash -l
#$ -P caad
#$ -l h_rt=2:00:00
#$ -N mpi_HPCCG
#$ -j y

#$ -pe mpi_28_tasks_per_node 896
#$ -l cpu_type=Gold-6132

module load gcc
module load openmpi

exec > ${SGE_O_WORKDIR}/${JOB_NAME}-${JOB_ID}_32node_896proc.scc.out 2>&1

mpirun -np $NSLOTS --map-by socket --bind-to core ./test_HPCCG 100 100 100