import h5py
import numpy as np

d_gamma = h5py.File('data/gamma.hdf5', 'r')
d_eplus = h5py.File('data/eplus.hdf5', 'r')

gamma_0 = d_gamma['layer_0'][:]
gamma_1 = d_gamma['layer_1'][:]
gamma_2 = d_gamma['layer_2'][:]

eplus_0 = d_eplus['layer_0'][:]
eplus_1 = d_eplus['layer_1'][:]
eplus_2 = d_eplus['layer_2'][:]

print(eplus_2.shape)
