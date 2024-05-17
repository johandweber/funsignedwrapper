program write_fortran_testoutput
  use iso_fortran_env
  use funsignedwrapper
  implicit none

  integer(int16), parameter::   int16_128 = 128_int16
  integer(int16), parameter::   int16_255 = 255_int16
  integer(int32), parameter::   int32_128 = 128_int32
  integer(int32), parameter::   int32_255 = 255_int32
  integer(int64), parameter::   int64_128 = 128_int64
  integer(int64), parameter::   int64_255 = 255_int64

  integer(int32), parameter::   int32_32768 = 32768_int32
  integer(int32), parameter::   int32_65535 = 65535_int32  
  integer(int64), parameter::   int64_32768 = 32768_int64
  integer(int64), parameter::   int64_65535 = 65535_int64
  

  integer(int64), parameter::   int64_2147483648 = 2147483648_int64
  integer(int64), parameter::   int64_4294967295 = 4294967295_int64

  integer(int8) ::   uint_8_from_16_128 
  integer(int8) ::   uint_8_from_16_255
  integer(int8) ::   uint_8_from_32_128 
  integer(int8) ::   uint_8_from_32_255
  integer(int8) ::   uint_8_from_64_128
  integer(int8) ::   uint_8_from_64_255

  integer(int16) ::  uint_16_from_32_32768
  integer(int16) ::  uint_16_from_32_65535  
  integer(int16) ::  uint_16_from_64_32768
  integer(int16) ::  uint_16_from_64_65535

  integer(int32) ::  uint_32_from_64_2147483648
  integer(int32) ::  uint_32_from_64_4294967295

  integer(int16) :: int16_form_uint8
  integer(int32) :: int32_form_uint8
  integer(int64) :: int64_form_uint8
 
  integer(int32) :: int32_form_uint16
  integer(int64) :: int64_form_uint16

  integer(int64) :: int64_form_uint32

  integer:: testunit
  
  open(newunit=testunit, file='output_fortran.bin', form='unformatted',access='stream')

  uint_8_from_16_128 = int16_to_uint8(int16_128)
  write(testunit) uint_8_from_16_128 
  uint_8_from_16_255 = int16_to_uint8(int16_255)
  write(testunit) uint_8_from_16_255
  uint_8_from_32_128 = int32_to_uint8(int32_128)
  write(testunit) uint_8_from_32_128 
  uint_8_from_32_255 = int32_to_uint8(int32_255)
  write(testunit) uint_8_from_32_255
  uint_8_from_64_128 = int64_to_uint8(int64_128)
  write(testunit) uint_8_from_64_128 
  uint_8_from_64_255 = int64_to_uint8(int64_255)
  write(testunit) uint_8_from_64_255 

  uint_16_from_32_32768 = int32_to_uint16(int32_32768)
  write(testunit) uint_16_from_32_32768
  uint_16_from_32_65535 = int32_to_uint16(int32_65535)
  write(testunit) uint_16_from_32_65535
  uint_16_from_64_32768 = int64_to_uint16(int64_32768)
  write(testunit) uint_16_from_64_32768
  uint_16_from_64_65535 = int64_to_uint16(int64_65535)
  write(testunit) uint_16_from_64_65535
  
  uint_32_from_64_2147483648 = int64_to_uint32(int64_2147483648)
  write(testunit) uint_32_from_64_2147483648
  uint_32_from_64_4294967295 = int64_to_uint32(int64_4294967295)
  write(testunit) uint_32_from_64_4294967295
  

  close(testunit)  
  
end program write_fortran_testoutput
 
