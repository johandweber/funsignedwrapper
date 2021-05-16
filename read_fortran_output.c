#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>


int conversion_successes = 0;
int conversion_failures = 0;

FILE * fortranoutput;

void check_conversion(bool criterion)
{
   if ( criterion )
    {
      printf("CONVERSION SUCCESSFULL\n\n");
      conversion_successes++;
    }
  else
    {
      printf("CONVERSION FAILED\n\n");
      conversion_failures++;
    } 
}

int main (int argc, char ** argv)
{

  uint8_t uint8_from_int16_128;
  uint8_t uint8_from_int16_255;
  uint8_t uint8_from_int32_128;
  uint8_t uint8_from_int32_255;
  uint8_t uint8_from_int64_128;
  uint8_t uint8_from_int64_255;
  
  uint16_t uint16_from_int32_32768;
  uint16_t uint16_from_int32_65535;
  uint16_t uint16_from_int64_32768;
  uint16_t uint16_from_int64_65535;
  
  uint32_t uint32_from_int64_2147483648;
  uint32_t uint32_from_int64_4294967295;

  fortranoutput = fopen("output_fortran.bin", "r");
  if (fortranoutput == NULL)
    {
      printf("FAILED TO OPEN THE FORTRAN OUTPUT FILE.\n");
    }

  if (fread( &uint8_from_int16_128, sizeof(uint8_from_int16_128), (size_t) 1, fortranoutput ) == 0 )
    exit(EXIT_FAILURE);
  printf("Expected value for  uint8_from_int16_128 : 128\n");
  printf("Obtained_result : %hhu \n", uint8_from_int16_128);
  check_conversion ( uint8_from_int16_128 == (uint8_t) 128 );

  
  if(fread( &uint8_from_int16_255, sizeof(uint8_from_int16_255), (size_t) 1, fortranoutput ) == 0 )
    exit(EXIT_FAILURE);
  printf("Expected value for  uint8_from_int16_255 : 255\n");
  printf("Obtained_result : %hhu \n", uint8_from_int16_255);
  check_conversion ( uint8_from_int16_255 == (uint8_t) 255 );

  
  if( fread( &uint8_from_int32_128, sizeof(uint8_from_int32_128), (size_t) 1, fortranoutput ) == 0)
    exit(EXIT_FAILURE);
  printf("Expected value for  uint8_from_int16_255 : 128\n");
  printf("Obtained_result : %hhu \n", uint8_from_int32_128);
  check_conversion ( uint8_from_int32_128 == (uint8_t) 128 );

  
  if( fread( &uint8_from_int32_255, sizeof(uint8_from_int32_255), (size_t) 1, fortranoutput ) == 0)
    exit(EXIT_FAILURE);
  printf("Expected value for  uint8_from_int16_255 : 255\n");
  printf("Obtained_result : %hhu \n", uint8_from_int32_255);
  check_conversion ( uint8_from_int32_255 == (uint8_t) 255 );

  if( fread( &uint8_from_int64_128, sizeof(uint8_from_int64_128), (size_t) 1, fortranoutput ) == 0)
    exit(EXIT_FAILURE);
  printf("Expected value for  uint8_from_int64_128 : 128\n");
  printf("Obtained_result : %hhu \n", uint8_from_int64_128);
  check_conversion ( uint8_from_int64_128 == (uint8_t) 128 );

  
  if( fread( &uint8_from_int64_255, sizeof(uint8_from_int64_255), (size_t) 1, fortranoutput ) == 0)
    exit(EXIT_FAILURE);
  printf("Expected value for  uint8_from_int64_255 : 255\n");
  printf("Obtained_result : %hhu \n", uint8_from_int64_255);
  check_conversion ( uint8_from_int64_255 == (uint8_t) 255 );
  
  if( fread( &uint16_from_int32_32768, sizeof(uint16_from_int32_32768), (size_t) 1, fortranoutput ) == 0)
    exit(EXIT_FAILURE);
  printf("Expected value for uint16_from_int32_32768 : 32768\n");
  printf("Obtained_result : %hu \n", uint16_from_int32_32768);
  check_conversion ( uint16_from_int32_32768 == (uint16_t) 32768);
  
  if( fread( &uint16_from_int32_65535, sizeof(uint16_from_int32_65535), (size_t) 1, fortranoutput ) == 0)
    exit(EXIT_FAILURE);
  printf("Expected value for uint16_from_int32_65535 : 65535\n");
  printf("Obtained_result : %hu \n", uint16_from_int32_65535);
  check_conversion( uint16_from_int32_65535 == (uint16_t) 65535);
  
  if( fread( &uint16_from_int64_32768, sizeof(uint16_from_int64_32768), (size_t) 1, fortranoutput ) == 0)
    exit(EXIT_FAILURE);
  printf("Expected value for uint16_from_int64_32768 : 32768\n");
  printf("Obtained_result : %hu \n", uint16_from_int64_32768);
  check_conversion ( uint16_from_int64_32768 == (uint16_t) 32768);
  
  if( fread( &uint16_from_int64_65535, sizeof(uint16_from_int64_65535), (size_t) 1, fortranoutput ) == 0)
    exit(EXIT_FAILURE);
  printf("Expected value for uint16_from_int64_65535 : 65535\n");
  printf("Obtained_result : %hu \n", uint16_from_int64_65535);
  check_conversion ( uint16_from_int64_65535 == (uint16_t) 65535);

  
  if( fread( &uint32_from_int64_2147483648, sizeof(uint32_from_int64_2147483648), (size_t) 1, fortranoutput ) == 0)
    exit(EXIT_FAILURE);
  printf("Expected value for uint32_from_int64_2147483648 : 2147483648\n");
  printf("Obtained_result : %u \n", uint32_from_int64_2147483648);
  check_conversion ( uint32_from_int64_2147483648 == (uint32_t) 2147483648);
  
  if( fread( &uint32_from_int64_4294967295, sizeof(uint32_from_int64_4294967295), (size_t) 1, fortranoutput ) == 0)
    exit(EXIT_FAILURE);
  printf("Expected value for uint32_from_int64_4294967295: 4294967295\n");
  printf("Obtained_result : %u \n", uint32_from_int64_4294967295);
  check_conversion ( uint32_from_int64_4294967295 == (uint32_t) 4294967295);
  
  fclose(fortranoutput);
}
