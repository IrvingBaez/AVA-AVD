env_name='ava-avd'

source ~/miniconda3/etc/profile.d/conda.sh

if conda info --envs | grep -q ${env_name}
then
  echo "Environment ${env_name} already exists"

  # If env existis, just activate it
  # eval "$(conda shell.bash hook)"
  # conda activate ${env_name}
else
  # Create env if it doesn't exists.
  echo "Creating environment ${env_name}"
  conda create -y -n ${env_name} python=3.7

  # Activate env
  eval "$(conda shell.bash hook)"
  conda activate ${env_name}

  # Download retinaface weights
  pip install gdown
  gdown '1ZggExiXzl1Uiq8eOYoCnQKQkN0bY1CHi';
  mv R50-0000.params dataset/third_party/insightface/detection/retinaface/

  # Install dependencies
  conda install pytorch==1.8.0 torchvision==0.9.0 torchaudio==0.8.0 cudatoolkit=10.2 -c pytorch -y
  conda install -c conda-forge nccl -y

  pip3 install mxnet-cu102
  pip3 install scikit-image
  pip3 install Cython
  pip3 install opencv-python-headless==4.5.1.48
  pip3 install -r requirements.txt
fi

# At this point, the env with all the necesary libraries is active.

# Adjustments for CUDA and cuDNN paths:
# Determine the path to the active conda environment.
# CONDA_ENV_PATH=$(conda info --envs | grep -Po "${env_name}\K.*" | sed 's: ::g')

# Assuming CUDA and cuDNN are installed within the conda environment, set the environment variables.
# export LD_LIBRARY_PATH=${CONDA_ENV_PATH}/lib:$LD_LIBRARY_PATH
# export CUDA_HOME=${CONDA_ENV_PATH}
# export PATH=$CUDA_HOME/bin:$PATH

# Excecute code.
# export PYTHONPATH=./dataset/third_party/insightface/detection/retinaface:$PYTHONPATH

# task_file=$@
# clsp_grid_wrapper/submit_grid.sh $task_file

# For test:
# ./scheduele.sh clsp_grid_wrapper/test_pytorch.py

# For preprocessing:
# ./scheduele.sh dataset/scripts/preprocessing.py dataset/videos