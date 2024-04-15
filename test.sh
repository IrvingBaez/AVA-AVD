export PYTHONPATH=./model \
CUDA_VISIBLE_DEVICES=0 \
clsp_grid_wrapper/submit_grid model/mmsc_exp/predict.py \
  config=projects/token/avaavd.yaml \
  datasets=avaavd \
  model=token \
  run_type=test \
  env.save_dir=save/token/avaavd
