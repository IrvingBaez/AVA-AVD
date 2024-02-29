# Activate your virtual environment
source ~/miniconda3/etc/profile.d/conda.sh
conda activate ava-avd

CUDA_VISIBLE_DEVICES=`/home/gkumar/scripts/free-gpu` python  "$@"