# Activate your virtual environment
source ~/miniconda3/etc/profile.d/conda.sh
bash environment.sh
env_name='ava-avd'

CUDA_VISIBLE_DEVICES=`/home/gkumar/scripts/free-gpu` python  "$@"