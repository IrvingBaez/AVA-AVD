# Activate your virtual environment
source ~/miniconda3/etc/profile.d/conda.sh
env_name='ava-avd'

if conda info --envs | grep -q ${env_name}
then
    echo 'env already exists' >> log_environment.txt
    conda activate ${env_name} >> log_environment.txt
else
    echo 'creating env' >> log_environment.txt
    bash ../environment.sh >> log_environment.txt
    conda activate ${env_name} >> log_environment.txt
fi

CUDA_VISIBLE_DEVICES=`/home/gkumar/scripts/free-gpu` python  "$@"
