# Activate your virtual environment
source ~/miniconda3/etc/profile.d/conda.sh
env_name='ava-avd'

if conda info --envs | grep -q ${env_name}
then
    conda activate ${env_name} >> ../log_environment.txt
else
    bash ../environment.sh
fi

CUDA_VISIBLE_DEVICES=`/home/gkumar/scripts/free-gpu` python  "$@"
