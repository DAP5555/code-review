# batch size 6 for 16 GB GPU

mnt_dir="/home/codereview"

MASTER_HOST=localhost && echo MASTER_HOST: ${MASTER_HOST}
MASTER_PORT=23333 && echo MASTER_PORT: ${MASTER_PORT}
RANK=0 && echo RANK: ${RANK}
PER_NODE_GPU=1 && echo PER_NODE_GPU: ${PER_NODE_GPU}
WORLD_SIZE=1 && echo WORLD_SIZE: ${WORLD_SIZE}
NODES=1 && echo NODES: ${NODES}
NCCL_DEBUG=INFO

torchrun --nproc_per_node ${PER_NODE_GPU} --node_rank=${RANK} --nnodes=${NODES} --master_addr=${MASTER_HOST} --master_port=${MASTER_PORT} ../run_test_cls.py  \
  --model_name_or_path microsoft/codereviewer \
  --output_dir ../../save/cls \
  --load_model_path ../../save/cls-full/checkpoints-13500-0.914 \
  --output_dir empty \
  --eval_file ../../dataset/Diff_Quality_Estimation/cls-test.jsonl \
  --max_source_length 512 \
  --max_target_length 128 \
  --eval_batch_size 6 \
  --mask_rate 0.15 \
  --save_steps 1000 \
  --log_steps 1000 \
  --train_steps 120000 \
  --gpu_per_node=${PER_NODE_GPU} \
  --node_index=${RANK} \
  --seed 2233
