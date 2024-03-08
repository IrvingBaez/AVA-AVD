env_name='ava-avd'

source /export/b03/carlosc/miniconda3/etc/profile.d/conda.sh

if conda info --envs | grep -q ${env_name}
then
  echo "Environment ${env_name} already exists"
else
  # Create env if it doesn't exists.
  echo "Creating environment ${env_name}"
  conda create -y -n ${env_name} python=3.7
fi

# Activate env
eval "$(conda shell.bash hook)"
conda activate ${env_name}

# Check if PyTorch and torchvision are installed, if not, install them
if ! conda list | grep -q "pytorch"
then
  conda install pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=10.2 -c pytorch -y
fi

# Install other dependencies
conda install -c conda-forge nccl -y

# pip3 install gdown
# gdown '1ZggExiXzl1Uiq8eOYoCnQKQkN0bY1CHi';
# mv R50-0000.params dataset/third_party/insightface/detection/retinaface/

pip3 install "setuptools<58.0.0"
pip3 install mxnet-cu102
pip3 install scikit-image
# pip3 install Cython
# pip3 install opencv-python-headless==4.5.1.48
# pip3 install --upgrade setuptools wheel
# pip3 install -r dataset/third_party/insightface/requirements.txt
pip3 install -r requirements.txt

# Build retinaface
# cd dataset/third_party/insightface/detection/retinaface/
# make

# Environment Variables adjustment
# CONDA_ENV_PATH=$(conda info --envs | grep -Po "${env_name}\K.*" | sed 's: ::g')
# export LD_LIBRARY_PATH=${CONDA_ENV_PATH}/lib:$LD_LIBRARY_PATH
# export CUDA_HOME=${CONDA_ENV_PATH}
# export PATH=$CUDA_HOME/bin:$PATH

# At this point, the env with all the necessary libraries is active.
