import h5py
import numpy as np

d_gamma = h5py.File('data/gamma.hdf5', 'r')
d_eplus = h5py.File('data/eplus.hdf5', 'r')

gamma_energy = d_gamma['energy'][:]

gamma_0 = d_gamma['layer_0'][:]
gamma_1 = d_gamma['layer_1'][:]
gamma_2 = d_gamma['layer_2'][:]

eplus_0 = d_eplus['layer_0'][:]
eplus_1 = d_eplus['layer_1'][:]
eplus_2 = d_eplus['layer_2'][:]

## sparsity test ######

signal = np.array([[0,2,1,1], [2,0,1,0], [3,0,0,0]])
sparsity = map(lambda x: (x>0).mean(), signal)
print(sparsity)

########################


## real_images_eplus sparsity #####

real_images_eplus = [eplus_0, eplus_1, eplus_2]
real_sparsity_eplus = map(lambda x: (x>0).mean((1,2)), real_images_eplus)

print(real_sparsity_eplus)

########################
