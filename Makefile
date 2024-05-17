# File suffix for a object file
OBJEXT = .o

# File suffix for frotran modules
MODEXT = .mod

# File suffix for an executable
EXEEXT = 

# Fortran compiler and linker
FORTRAN = gfortran

# C  compiler and linker
CC = gcc

# Command-line argument that prevents the linker from being invoked
NOLINK = -c

#LINK
LINK = -o

# Command to delete files
REMOVE = rm

FUNSIGNEDWRAPPER_F90 = funsignedwrapper.f90

WRITE_FORTRAN_OUTPUT_F90 = write_fortran_output.f90

READ_FORTRAN_OUTPUT_C   = read_fortran_output.c

WRITE_C_OUTPUT_C = write_c_output.c

READ_C_OUTPUT_F90 = read_c_output.f90

FUNSIGNEDWRAPPER_OBJ = funsignedwrapper$(OBJEXT)

WRITE_FORTRAN_OUTPUT = write_fortran_output$(EXEEXT)

READ_FORTRAN_OUTPUT = read_fortran_output$(EXEEXT)

WRITE_C_OUTPUT = write_c_output$(EXEEXT)

READ_C_OUTPUT = read_c_foutput$(EXEEXT)


READ_FORTRAN_OUTPUT = read_fortran_output$(EXEEXT)

all: $(FUNSIGNEDWRAPPER_OBJ)
	$(FORTRAN) $(LINK) $(WRITE_FORTRAN_OUTPUT) $(WRITE_FORTRAN_OUTPUT_F90) $(FUNSIGNEDWRAPPER_OBJ)
	$(CC) $(LINK) $(WRITE_C_OUTPUT) $(WRITE_C_OUTPUT_C)
	$(CC) $(LINK) $(READ_FORTRAN_OUTPUT) $(READ_FORTRAN_OUTPUT_C)
	$(FORTRAN) $(LINK) $(READ_C_OUTPUT)  $(READ_C_OUTPUT_F90) $(FUNSIGNEDWRAPPER_OBJ)
	./$(WRITE_FORTRAN_OUTPUT)
	./$(READ_FORTRAN_OUTPUT)
	./$(WRITE_C_OUTPUT)
	./$(READ_C_OUTPUT)

$(FUNSIGNEDWRAPPER_OBJ):
	$(FORTRAN) $(NOLINK) $(FUNSIGNEDWRAPPER_F08)

clean:
	$(REMOVE) *$(OBJEXT) *$(MODEXT) $(WRITE_FORTRAN_OUTPUT) $(READ_FORTRAN_OUTPUT)\
                  $(WRITE_C_OUTPUT) $(READ_C_OUTPUT)  *.bin
