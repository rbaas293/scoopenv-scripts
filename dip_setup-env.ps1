# Script to setup enviorment for DIP Final NN Project. 

# programming languages (need anaconda3 which has Jupiter Kernal + notebook pre packaged)
scoop install anaconda3

# Once we have anaconda3, lets make sure things are installed
RefreshEnv.cmd
#tensorflow
conda install tensorflow
# Uncomment following line if you have a GPU:
#conda install tensorflow-gpu

# install tensorflow-tensorboard so we can watch our tensors flow!
conda install tensorflow-tensorboard

# install matplotlib if for some reason its not there:
conda install matplotlib
#pip install matplotlib

# freeimage - Supports popular graphics image formats like PNG, BMP, JPEG, TIFF / GPLv2 and FreeImage Public License
#conda install freeimage


# These are cool and I dont want to forget them:

# mkl_fft - NumPy-based implementation of Fast Fourier Transform using Intel (R) Math Kernel Library. / BSD 3-Clause
#conda install mkl_fft

# freeimage - Supports popular graphics image formats like PNG, BMP, JPEG, TIFF / GPLv2 and FreeImage Public License
#conda install freeimage
