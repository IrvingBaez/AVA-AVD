# Activate your virtual environment
source /export/b03/carlosc/miniconda3/etc/profile.d/conda.sh
conda activate ava-avd

# export PATH="/export/b03/carlosc/miniconda3/envs/ava-avd/bin:$PATH"
# source activate /export/b03/carlosc/miniconda3/envs/ava-avd

export PYTHONPATH=../model
CUDA_VISIBLE_DEVICES=$(free-gpu -n 1) python  "$@"