
from itertools import combinations

import numpy as np 


#---------- Sparse graph generation algo ----------
# x = np.random.rand(100,100)
# 
# x[x>0.99] = 1
# x[x<=0.99] = 0
# x = x.astype(int)
# print x.shape
# np.savetxt('out.dat',x, fmt='%d')
# -------------------------------------------------



# gathered from vbgi collections... 
common_species = [
    'Pseuderanthemum atropurpureum',
    'Strobilanthes isophyllus',
    'Agave stricta',
    'Onychium japonicum',
    'Agave filifera',
    'Hosta rectifolia',
    'Hosta rectifolia',
    'Lithops aucampiae',
    'Caldesia reniformis',
    'Allium schoenoprasum',
    'Allium spirale',
    'Aloe zebrina',
    'Aloe aristata',
    'Plumeria rubra'
    ]


res = [[],[]]

for k in range(100):
    res[0].append(np.random.choice(common_species[2:]))
    res[1].append(np.random.choice(common_species[:-2]))
    
np.savetxt('output.dat', np.array(res).T, fmt='%s', delimiter=';')    
    

