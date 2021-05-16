# Fortran Unsigned Wrapper (funsignedwrapper)

## Motivation
In contrast to C, Fortran does not provide unsigned data types.
This can cause problem when interfacing C functions that require 
unsigned arguments. For example the components of RGB-values or
parts of IPv4 adresses are often expressed as unsigned 8-bit integers.

In principle it is possible to pass signed integers with the same bit
pattern as the unsigned value one wants to pass (For example,
both an unsigned 8-bit integer with the value 128 and a signed integer
with the value -128 have the same bit pattern (binary: 1000 0000) if
the Two's complement is used as is it the case for most systems.
This may, however, lead to code that is difficult to read and maintain.

## Functions

There are two types of functions in the module `funsignedwrapper`
that try to address the problem in an easier readable way.


### Create an unsigned value

`intX_to_uintY` stores the numerical value of a larger (i.e., stored
using Y bits) integer in a smaller (signed) integer variable (stored using X
bits) using bit pattern that corresponds to a (C-type) unsigned variable
of the same size.

Here `Y` > `X`.

For `X` the values `8`, `16`and  `32` are possible.
For `Y` tha values `16`, `32` and `64` are possible

The algorithm assumes that the signed Fortran integers are described using
the Two's complement. Furthermore it assumes the same endianness for all
interger values, i.e. it is not possible to convert big-endian in 
little-endian variables and vice versa.

### Read an unsigned value

`uintX_to_intY` performs the inverse operation, i.e. the bit pattern of a
"smaller" variable is interpreted as the bit pattern of an unsigned integer.

The possible range for `X` and `Y` is the same as for the functions that create
the bit patterns for the unsigned integers.


## Building the Module

By downloading the code and calling `make` the code of the module is generated
including the object file (`funsignedwrapper.o` for Unix systems) and the 
module file (`funsignedwrapper.mod`).

Furthermore a set of test programs are written and executed during the make process
that output whether the comversions lead to the expected results.

`make clean` removes the generated files.

## Requirements

The module requires a Fortran compiler that supports the constants `int8`, `int16`,
`int32` and `int64` in the module `iso_fortran_env`.
This is the case for all compilers comforming to the Fortran 2008
standard but may also be supported by Compilers that otherwise do not fully support
Fortran 2008.

The test programs further require a C99 comforming C compiler where the typedefs
`uint8_t`, `uint16_t`, `uint_32_t` and `uint64_t` are defined in `stdint.h`.

The Module has been tested with `gfortran` and `gcc` 9.3 on an AMD64 system.

## TODOS 

* Compiling the code will fail if one of the integer sizes 8, 16, 32 or 64 bit
  is not available.
  
  If a value is passed to a function that does not " fit" into the samller variable,
  a modulo operation is performed and no error flag is set.
  
* The code is not optimized for high performance.  

* Cleanup of the `Makefile`.

* More testing...







