export PYTHONPATH=$(pwd)
export CUDA_VISIBLE_DEVICES=0
clsp_grid_wrapper/submit_grid.sh model/mmsc_exp/run.py \
  config=projects/token/mix.yaml \
  datasets=ava,voxceleb1,voxceleb2,avaavd \
  model=token \
  run_type=train \
  training.batch_size=8 \
  training.num_workers=4 \
  env.save_dir=./save/token/output
