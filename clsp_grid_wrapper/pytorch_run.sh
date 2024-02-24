# Activate your virtual environment
if [[ -f ~/miniconda3/etc/profile.d/conda.sh ]]; then
    source ~/miniconda3/etc/profile.d/conda.sh
elif [[ -f ~/anaconda3/etc/profile.d/conda.sh ]]; then
    source ~/anaconda3/etc/profile.d/conda.sh
else
    echo "Conda not found. Please ensure Miniconda3 or Anaconda3 is installed."
    exit 1
fi

conda activate ava-avd

CUDA_VISIBLE_DEVICES=`/home/gkumar/scripts/free-gpu` python  "$@"
