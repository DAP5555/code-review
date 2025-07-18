# batch size 6 for 16 GB GPU

mnt_dir="/home/codereview"

MASTER_HOST=localhost && echo MASTER_HOST: ${MASTER_HOST}
MASTER_PORT=23333 && echo MASTER_PORT: ${MASTER_PORT}
RANK=0 && echo RANK: ${RANK}
PER_NODE_GPU=1 && echo PER_NODE_GPU: ${PER_NODE_GPU}
WORLD_SIZE=1 && echo WORLD_SIZE: ${WORLD_SIZE}
NODES=1 && echo NODES: ${NODES}
NCCL_DEBUG=INFO

bash test_nltk.sh

torchrun --nproc_per_node ${PER_NODE_GPU} --node_rank=${RANK} --nnodes=${NODES} --master_addr=${MASTER_HOST} --master_port=${MASTER_PORT} ../run_test_ref.py  \
  --model_name_or_path microsoft/codereviewer \
  --output_dir ../../save/ref-batchsize-6 \
  --load_model_path ../../save/ref-without-lovion/checkpoints-16940-80.11 \
  --eval_file ../../dataset/Code_Refinment/ref-test.jsonl \
  --max_source_length 200 \
  --max_target_length 200 \
  --eval_batch_size 6 \
  --mask_rate 0.15 \
  --save_steps 1800 \
  --beam_size 10 \
  --log_steps 100 \
  --train_steps 120000 \
  --gpu_per_node=${PER_NODE_GPU} \
  --node_index=${RANK} \
  --seed 2233 \
