
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

# ------ Symmectrical mat gen -----------
x = np.random.rand(100,100)
x = 0.5*(np.triu(x) + np.tril(x))
x[30,70] = x[30,70] + 0.1
x[4,9] = x[4,9] + 0.1

x[13,64] = x[13, 64] + 1.0
x[64,13]=x[13,64]
print x[64,13], x[4,9], x[30,70]
np.savetxt('ss.dat', x, fmt='%1.4e')
# -------------------------------------



# gathered from vbgi collections... 
# common_species = [
#     'Pseuderanthemum atropurpureum',
#     'Strobilanthes isophyllus',
#     'Agave stricta',
#     'Onychium japonicum',
#     'Agave filifera',
#     'Hosta rectifolia',
#     'Hosta rectifolia',
#     'Lithops aucampiae',
#     'Caldesia reniformis',
#     'Allium schoenoprasum',
#     'Allium spirale',
#     'Aloe zebrina',
#     'Aloe aristata',
#     'Plumeria rubra'
#     ]


# res = [[],[]]
# 
# for k in range(100):
#     res[0].append(np.random.choice(common_species[2:]))
#     res[1].append(np.random.choice(common_species[:-2]))
    
# np.savetxt('output.dat', np.array(res).T, fmt='%s', delimiter=';')    
    

