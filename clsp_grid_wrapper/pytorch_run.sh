# Activate your virtual environment
source /export/b03/carlosc/miniconda3/etc/profile.d/conda.sh
conda activate ava-avd

CUDA_VISIBLE_DEVICES=`/home/gkumar/scripts/free-gpu` python  "$@"