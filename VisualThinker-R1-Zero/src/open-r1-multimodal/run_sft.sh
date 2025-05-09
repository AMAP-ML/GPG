export CUDA_VISIBLE_DEVICES=0,1,2,3

accelerate launch --config_file=configs/zero3.yaml src/open_r1/sft.py \
    --model_name_or_path <PATH-TO-Qwen2-VL-2B-Instruct> \
    --dataset_name <DATASET_NAME> \
    --learning_rate 2.0e-5 \
    --num_train_epochs 2 \
    --packing True \
    --max_seq_length 1024 \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 2 \
    --gradient_checkpointing True \
    --report_to wandb \
    --bf16 True \
    --logging_steps 5 \
    --eval_strategy no \
    --output_dir <OUTPUT_DIR> \
    --run_name <RUN_NAME>