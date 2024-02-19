PATH_PREFIX=$1

if conda info --envs | grep -q ava; then echo "Environment ava already exists"; else conda create -y -n ava python=3.7; fi
eval "$(conda shell.bash hook)"
conda activate ava

conda install pytorch==1.1.0 torchvision==0.3.0 cudatoolkit=9.0 -c pytorch
pip3 install -r requirements.txt
pip install mxnet-cu90

pip3 install scikit-image
pip3 install Cython
pip3 install opencv-python-headless==4.5.1.48

export LD_LIBRARY_PATH=/home/irving/miniconda3/envs/ava/lib:$LD_LIBRARY_PATH
export CUDA_HOME=/home/irving/miniconda3/envs/ava/
export PATH=$CUDA_HOME/bin:$PATH

export PYTHONPATH=./dataset/third_party/insightface/detection/retinaface
python3 dataset/scripts/preprocessing.py