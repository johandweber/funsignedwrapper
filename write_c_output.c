#include <stdio.h>
#include <stdint.h>

FILE * output_c; 

int main (int argc, char**argv)
{

  const uint8_t uint_8_128 = (uint8_t) 128;
  const uint8_t uint_8_255 = (uint8_t) 255;

  const uint16_t uint_16_32768 = (uint16_t) 32768;
  const uint16_t uint_16_65535 = (uint16_t) 65535;
  
  const uint32_t uint_32_2147483648 = (uint32_t) 2147483648;
  const uint32_t uint_32_4294967295 = (uint32_t) 4294967295;

  output_c = fopen("output_c.bin","w");
    
  /* To be converted in 16-bit Fortran (signed) integers */
  fwrite(&uint_8_128, sizeof(uint8_t), (size_t) 1, output_c);
  fwrite(&uint_8_255, sizeof(uint8_t), (size_t) 1, output_c);
  
  /*To be converted in 32-bit Fortran (signed) integers */
  fwrite(&uint_8_128, sizeof(uint8_t), (size_t) 1, output_c);
  fwrite(&uint_8_255, sizeof(uint8_t), (size_t) 1, output_c);
  fwrite(&uint_16_32768, sizeof(uint16_t), (size_t) 1, output_c);
  fwrite(&uint_16_65535, sizeof(uint16_t), (size_t) 1, output_c);

  /*To be converted in 32-bit Fortran (signed) integers */
  fwrite(&uint_8_128, sizeof(uint8_t), (size_t) 1, output_c);
  fwrite(&uint_8_255, sizeof(uint8_t), (size_t) 1, output_c);
  fwrite(&uint_16_32768, sizeof(uint16_t), (size_t) 1, output_c);
  fwrite(&uint_16_65535, sizeof(uint16_t), (size_t) 1, output_c);
  fwrite(&uint_32_2147483648, sizeof(uint32_t), (size_t) 1, output_c);
  fwrite(&uint_32_4294967295, sizeof(uint32_t), (size_t) 1, output_c);

  fclose(output_c);
  
  
}
