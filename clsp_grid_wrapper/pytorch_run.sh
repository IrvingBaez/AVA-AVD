# Activate your virtual environment
conda activate ava-avd

CUDA_VISIBLE_DEVICES=`/home/gkumar/scripts/free-gpu` python  "$@"
