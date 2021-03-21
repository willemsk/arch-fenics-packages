TARGETS = parmetis-sm \
				superlu \
				scalapack \
				scotch-sm \
				hypre-sm \
				mumps-par \
				petsc \
				slepc \
				petsc4py \
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
.PHONY: $(TARGETS)
