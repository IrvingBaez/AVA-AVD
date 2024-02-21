env_name='ava-avd'

if conda info --envs | grep -q ${env_name}
then
  echo "Environment ${env_name} already exists"

  # If env existis, just activate it
  eval "$(conda shell.bash hook)"
  conda activate ${env_name}
else
  # Create env if it doesn't exists.
  conda create -y -n ${env_name} python=3.7

  # Activate env
  eval "$(conda shell.bash hook)"
  conda activate ${env_name}

  # Download retinaface weights
  pip install gdown
  gdown '1ZggExiXzl1Uiq8eOYoCnQKQkN0bY1CHi';
  mv R50-0000.params dataset/third_party/insightface/detection/retinaface/

  # In case torch-1.0.0-cp37-cp37m-linux_x86_64.whl is needed:
  gdown '1SGgqL3gOrAL97flWAwtxdyTs7AkDZbK0'
  pip3 install torch-1.0.0-cp37-cp37m-linux_x86_64.whl

  # Install dependencies
  conda install pytorch==1.1.0 torchvision==0.3.0 cudatoolkit=9.0 -c pytorch -y
  pip install mxnet-cu90
  pip3 install scikit-image
  pip3 install Cython
  pip3 install opencv-python-headless==4.5.1.48
  pip3 install -r requirements.txt
fi

# At this point, the env with all the necesary libraries is active.

# Prepare CUDA for code execution:
CONDA_ENV_PATH=$(conda info --envs | grep -Po "${env_name}\K.*" | sed 's: ::g')
echo ${CONDA_ENV_PATH}

export LD_LIBRARY_PATH=${CONDA_ENV_PATH}/lib:$LD_LIBRARY_PATH
export CUDA_HOME=${CONDA_ENV_PATH}
export PATH=$CUDA_HOME/bin:$PATH

# Excecute code.
export PYTHONPATH=./dataset/third_party/insightface/detection/retinaface
python_script="$1"
clsp_grid_wrapper/submit_grid.sh "$python_script" "$@"

# For preprocessing:
# ./avr_net.sh dataset/scripts/preprocessing.py dataset/videos