program read_c_output
  use iso_fortran_env
  use funsignedwrapper
  implicit none
  integer:: conversion_successes = 0
  integer:: conversion_failures  = 0

  integer(int8)  :: int8_value
  integer(int16) :: int16_value
  integer(int32) :: int32_value

  integer:: testunit
  
  open(newunit=testunit, file='output_c.bin', form='unformatted',access='stream')

! Conversion into (signed) 16-bit integers  
  read(testunit) int8_value
    write(*,*) ' Function:  uint8_to_int16' 
    write(*,*) 'Expected value: 128'
    write(*,*) 'Actual value:',  uint8_to_int16(int8_value)
    call check_conversion( 128_int16 .eq. uint8_to_int16(int8_value) ) 
 
    read(testunit) int8_value
    write(*,*) ' Function:  uint8_to_int16' 
    write(*,*) 'Expected value: 255'
    write(*,*) 'Actual value:',  uint8_to_int16(int8_value)
    call check_conversion( 255_int16 .eq. uint8_to_int16(int8_value) )

! Conversion into (signed) 32-bit integers    
    read(testunit) int8_value
    write(*,*) ' Function:  uint8_to_int32' 
    write(*,*) 'Expected value: 128'
    write(*,*) 'Actual value:',  uint8_to_int32(int8_value)
    call check_conversion( 128_int32 .eq. uint8_to_int32(int8_value) )
 
    read(testunit) int8_value
    write(*,*) ' Function:  uint8_to_int32' 
    write(*,*) 'Expected value: 255'
    write(*,*) 'Actual value:',  uint8_to_int32(int8_value)
    call check_conversion( 255_int32 .eq. uint8_to_int32(int8_value) )
    
    read(testunit) int16_value
    write(*,*) ' Function:  uint16_to_int32'     
    write(*,*) 'Expected value: 32768'
    write(*,*) 'Actual value:',  uint16_to_int32(int16_value)
    call check_conversion( 32768_int32 .eq. uint16_to_int32(int16_value) )
 
    read(testunit) int16_value
    write(*,*) ' Function:  uint16_to_int32'     
    write(*,*) 'Expected value: 65535'
    write(*,*) 'Actual value:',  uint16_to_int32(int16_value)
    call check_conversion( 65535_int32 .eq. uint16_to_int32(int16_value) )

! Conversion into (signed) 64-bit integers
    read(testunit) int8_value
    write(*,*) 'Function: uint8_to_int64'
    write(*,*) 'Expected value: 128'
    write(*,*) 'Actual value:',  uint8_to_int64(int8_value)
    call check_conversion( 128_int64 .eq. uint8_to_int64(int8_value) )
 
    read(testunit) int8_value
    write(*,*) 'Function: uint8_to_int64'
    write(*,*) 'Expected value: 255'
    write(*,*) 'Actual value:',  uint8_to_int64(int8_value)
    call check_conversion( 255_int64 .eq. uint8_to_int64(int8_value) )
    
    read(testunit) int16_value
    write(*,*) 'Function: uint16_to_int64'
    write(*,*) 'Expected value: 32768'
    write(*,*) 'Actual value:',  uint16_to_int64(int16_value)
    call check_conversion( 32768_int64 .eq. uint16_to_int64(int16_value) ) 
 
    read(testunit) int16_value
    write(*,*) 'Function: uint16_to_int32'
    write(*,*) 'Expected value: 65535'
    write(*,*) 'Actual value:',  uint16_to_int32(int16_value)
    call check_conversion( 65535_int32 .eq. uint16_to_int32(int16_value) )
    
    read(testunit) int32_value
    write(*,*) 'Function:  uint32_to_int64' 
    write(*,*) 'Expected value: 2147483648'
    write(*,*) 'Actual value:',  uint32_to_int64(int32_value)
    call check_conversion( 2147483648_int64 .eq. uint32_to_int64(int32_value) ) 
 
    read(testunit) int32_value
    write(*,*) 'Function: uint32_to_int64'
    write(*,*) 'Expected value: 4294967295'
    write(*,*) 'Actual value:',  uint32_to_int64(int32_value)
    call check_conversion( 4294967295_int64 .eq. uint32_to_int64(int32_value) )

    close(testunit)
   
    
contains

  subroutine check_conversion (criterion)
    logical:: criterion

    if (criterion) then
       write(*,*) 'CONVERSION_SUCCESSFUL'
       write(*,*)
       conversion_successes = conversion_successes + 1
    else
       write(*,*) 'CONVERSION FAILED'
       write(*,*)
       conversion_failures = conversion_failures + 1
    endif
   
  end subroutine check_conversion
  
end program read_c_output
