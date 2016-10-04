
from itertools import combinations

import numpy as np 


#---------- Sparse graph generation algo ----------
x = np.random.rand(100,100)

x[x>0.99] = 1
x[x<=0.99] = 0
x = x.astype(int)
print x.shape
np.savetxt('out.dat',x, fmt='%d')
# -------------------------------------------------



# gathered from vbgi collections... 
common_species = [
    ''
    
    ]