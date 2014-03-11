import pyquasirand as qr
import matplotlib.pyplot as plt
ndims = 2
npts = 100
generators = ['sobol', 'halton', 'reverse_halton', 'niederreiter']
plt.figure("Testing generators")
for i, gen in enumerate(generators):
    points = qr.generate(ndims, npts, gen)
    plt.subplot(2, 2, i + 1)
    plt.title(gen)
    plt.axis('equal')
    plt.plot(points[:,0], points[:, 1], 'o')
plt.show()
