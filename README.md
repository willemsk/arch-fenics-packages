# FEniCS 2019.1 for Arch Linux

Collection of `PKGBUILD` files for installing FEnICS 2019.1 on Arch linux. Adapted from [Sigvald Marholm's repo](https://github.com/sigvaldm/arch-fenics-packages) for FEnICS 2018.1. 

## Installing FEniCS

First, make sure the following packages are installed from the official Arch repository (the command can be copy-pasted):

```
sudo pacman -S \
    gcc-fortran \
    python-mpi4py \
    python-matplotlib \
    python-scipy \
    python-sympy \
    hdf5-openmpi \
    fftw \
    valgrind \
    suitesparse \
    superlu \
    metis
```
This should cover missing dependencies from the AUR packages, as well as optional dependencies which are nice to have. (There may be fewer missing dependencies now than when I made this list, but it doesn't hurt to install them in advance anyway).
Next, clone this repository, and run `make` in it:
```bash
$ git clone https://github.com/willemsk/arch-fenics-packages.git
$ cd arch-fenics-packages
$ make
```

Then, install the packages in the following order (this order takes into account dependencies):

- `parmetis`
- `combblas`
- `superlu_dist`
- `scalapack`
- `scotch`
- `hypre`
- `mumps-par`
- `archimedes-tools` (in case you don't have `triangle`)
- `petsc`
- `slepc`
- `petsc4py` (will be included with `petsc` in the future)
- `slepc4py` (will be included with `slepc` in the future)
- `python-ufl`
- `python-dijitso`
- `python-fiat`
- `python-ffc`
- `dolfin`
- `python-dolfin`
- `mshr`
- `python-mshr`

This is done by entering the respective directory in this repository and running `makepkg -sri`.

I might try to make this less cumbersome in the future, but it should work for now.

## Gmsh notes

Note on Gmsh: the `dolfin-convert` command appears to have issues with `.msh` files generated using Gmsh 4. You cam use Gmsh 3.0.6 instead. The package `gmsh-bin` on AUR currently provides this.

To provide `.msh` files with Gmsh 4 that can be parsed by `dolfin-convert`, you should run Gmsh with the following flags:
```
gmsh -format msh2 <input_file>.geo
```
