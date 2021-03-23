TARGETS = parmetis \
				superlu_dist \
				scalapack \
				scotch \
				hypre \
				mumps-par \
				archimedes-tools \
				petsc \
				slepc \
				petsc4py \
				slepc4py \
				python-ufl \
				python-dijitso \
				python-fiat \
				python-ffc \
				dolfin \
				python-dolfin \
				mshr \
				python-mshr \

all: $(TARGETS)

$(TARGETS):
	cd $@; makepkg -sri; cd ..

# for TARGET in $(TARGETS); do cd $(TARGET); makepkg -sri; cd ..; done


.DEFAULT: all
.PHONY: all $(TARGETS)
