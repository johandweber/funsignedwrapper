! 

module funsignedwrapper
  use iso_fortran_env
  implicit none
  
  integer(int8)  , parameter:: max8bitsignedin8bit  =                     127
  integer(int16) , parameter:: max8bitsignedin16bit =                     127
  integer(int32) , parameter:: max8bitsignedin32bit =                     127
  integer(int64) , parameter:: max8bitsignedin64bit =                     127
  
  integer(int16) , parameter:: max8bitunsignedin16bit =                   255
  integer(int32) , parameter:: max8bitunsignedin32bit =                   255
  integer(int64) , parameter:: max8bitunsignedin64bit =                   255

  integer(int8)  , parameter:: min8bitsignedin8bit  =                    -128
  integer(int16) , parameter:: min8bitsignedin16bit =                    -128
  integer(int32) , parameter:: min8bitsignedin32bit =                    -128
  integer(int64) , parameter:: min8bitsignedin64bit =                    -128

  
  integer(int16) , parameter:: max16bitsignedin16bit  =                 32767
  integer(int32) , parameter:: max16bitsignedin32bit  =                 32767
  integer(int64) , parameter:: max16bitsignedin64bit  =                 32767
  
  integer(int32) , parameter:: max16bitunsignedin32bit =                65535
  integer(int64) , parameter:: max16bitunsignedin64bit =                65535

  integer(int16) , parameter:: min16bitsignedin16bit   =               -32768
  integer(int32) , parameter:: min16bitsignedin32bit   =               -32768
  integer(int64) , parameter:: min16bitsignedin64bit   =               -32768
  

  integer(int32) , parameter:: max32bitsignedin32bit   =           2147483647
  integer(int64) , parameter:: max32bitsignedin64bit   =           2147483647
  
  integer(int64) , parameter:: max32bitunsignedin64bit =           4294967295_int64

  integer(int32) , parameter:: min32bitsignedin32bit   =          -2147483647-1
  integer(int64) , parameter:: min32bitsignedin64bit   =          -2147483648_int64

  
  integer(int64) , parameter:: max64bitsignedin64bit   =  9223372036854775807_int64

  ! Hack: At least gfortran can not handle the  literal 9223372036854775808 and thus also
  ! not - 9223372036854775808, althogh the value is a valid int64 value
  integer(int64) , parameter:: min64bitsignedin64bit   = -9223372036854775807_int64-1_int64
 
  contains

    integer(int8) function int16_to_uint8(in)
      integer(int16) :: in
      integer(int16) :: working_copy
      working_copy = int( mod(in, 256_int16) , kind =int16)
      if (working_copy .lt. 128_int16) then
         int16_to_uint8 = int(working_copy, kind=int8 )   
      else
         int16_to_uint8 = int(-256_int16+working_copy, kind=int8 )
      endif
    end function int16_to_uint8

    integer(int8) function int32_to_uint8(in)
      integer(int32) :: in
      integer(int32) :: working_copy
      working_copy = int( mod(in, 256_int32) , kind =int32)
      if (working_copy .lt. 128_int32) then
         int32_to_uint8 = int(working_copy, kind=int8 )   
      else
         int32_to_uint8 = int(-256_int32+working_copy, kind=int8 )
      endif
    end function int32_to_uint8
   
 
    integer(int8) function int64_to_uint8(in)
      integer(int64) :: in
      integer(int64) :: working_copy
      working_copy = int( mod(in, 256_int64) , kind =int64)
      if (working_copy .lt. 128_int64) then
         int64_to_uint8 = int(working_copy, kind=int8 )   
      else
         int64_to_uint8 = int(-256_int64+working_copy, kind=int8 )
      endif
    end function int64_to_uint8


    integer(int16) function int32_to_uint16(in)
      integer(int32) :: in
      integer(int32) :: working_copy
      working_copy = int( mod(in, 65536_int32) , kind =int32)
      if (working_copy .lt. 32768_int32) then
         int32_to_uint16 = int(working_copy, kind=int16 )   
      else
         int32_to_uint16 = int(-65536_int32+working_copy, kind=int16 )
      endif
    end function int32_to_uint16
   
 
    integer(int16) function int64_to_uint16(in)
      integer(int64) :: in
      integer(int64) :: working_copy
      working_copy = int( mod(in, 65536_int64) , kind =int64)
      if (working_copy .lt. 32768_int64) then
         int64_to_uint16 = int(working_copy, kind=int16 )   
      else
         int64_to_uint16 = int(-65536_int64+working_copy, kind=int16 )
      endif
    end function int64_to_uint16
    
    integer(int32) function int64_to_uint32(in)
      integer(int64) :: in
      integer(int64) :: working_copy
      working_copy = int( mod(in, 4294967296_int64) , kind =int64)
      if (working_copy .lt. 2147483648_int64) then
         int64_to_uint32 = int(working_copy, kind=int32 )   
      else
         int64_to_uint32 = int(-4294967296_int64+working_copy, kind=int32 )
      endif
    end function int64_to_uint32

    integer(int16) function uint8_to_int16(in)
      integer(int8) :: in
      if (in .ge. 0) then
         uint8_to_int16 = int(in, kind = int16)
      else
         uint8_to_int16 = 256_int16 + int(in, kind = int16) 
      endif
    end function uint8_to_int16
    

    integer(int32) function uint8_to_int32(in)
      integer(int8) :: in
      if (in .ge. 0) then
         uint8_to_int32 = int(in, kind = int32)
      else
         uint8_to_int32 = 256_int16 + int(in, kind = int32) 
      endif
    end function uint8_to_int32


    integer(int64) function uint8_to_int64(in)
      integer(int8) :: in
      if (in .ge. 0) then
         uint8_to_int64 = int(in, kind = int64)
      else
         uint8_to_int64 = 256_int16 + int(in, kind = int64) 
      endif
    end function uint8_to_int64
    
    integer(int32) function uint16_to_int32(in)
      integer(int16) :: in
      if (in .ge. 0) then
         uint16_to_int32 = int(in, kind = int32)
      else
         uint16_to_int32 = 65536_int32 + int(in, kind = int32) 
      endif
    end function uint16_to_int32


    integer(int64) function uint16_to_int64(in)
      integer(int16) :: in
      if (in .ge. 0) then
         uint16_to_int64 = int(in, kind = int64)
      else
         uint16_to_int64 = 65536_int64 + int(in, kind = int64) 
      endif
    end function uint16_to_int64


    integer(int64) function uint32_to_int64(in)
      integer(int32) :: in
      if (in .ge. 0) then
         uint32_to_int64 = int(in, kind = int64)
      else
         uint32_to_int64 = 4294967296_int64 + int(in, kind = int64) 
      endif
    end function uint32_to_int64
    
  
end module funsignedwrapper
