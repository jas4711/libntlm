#ifndef NTLM_DES_H_
#define NTLM_DES_H_

typedef struct des_key
{
  char kn[16][8];
  word32 sp[8][64];
  char iperm[16][16][8];
  char fperm[16][16][8];
} DES_KEY;

#endif /*  NTLM_DES_H_ */
