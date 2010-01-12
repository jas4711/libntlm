/*
 * Copyright (C) 2005, 2007 Free Software Foundation
 * Written by Simon Josefsson
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.  */

/* Adapted for gnulib by Simon Josefsson, based on Libgcrypt. */

#include <config.h>

#include <stdio.h>
#include <string.h>

#include "des.h"

int
main (int argc, char *argv[])
{
  /*
   * DES Maintenance Test
   */
  {
    int i;
    char key[8] = { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 };
    char input[8] = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
    char result[8] = { 0x24, 0x6e, 0x9d, 0xb9, 0xc5, 0x50, 0x38, 0x1a };
    char temp1[8], temp2[8], temp3[8];
    gl_des_ctx des;

    for (i = 0; i < 64; ++i)
      {
        gl_des_setkey (&des, key);
        gl_des_ecb_encrypt (&des, input, temp1);
        gl_des_ecb_encrypt (&des, temp1, temp2);
        gl_des_setkey (&des, temp2);
        gl_des_ecb_decrypt (&des, temp1, temp3);
        memcpy (key, temp3, 8);
        memcpy (input, temp1, 8);
      }
    if (memcmp (temp3, result, 8))
      return 1;
  }


  /*
   * Self made Triple-DES test  (Does somebody know an official test?)
   */
  {
    int i;
    char input[8] = { 0xfe, 0xdc, 0xba, 0x98, 0x76, 0x54, 0x32, 0x10 };
    char key1[8] = { 0x12, 0x34, 0x56, 0x78, 0x9a, 0xbc, 0xde, 0xf0 };
    char key2[8] = { 0x11, 0x22, 0x33, 0x44, 0xff, 0xaa, 0xcc, 0xdd };
    char result[8] = { 0x7b, 0x38, 0x3b, 0x23, 0xa2, 0x7d, 0x26, 0xd3 };

    gl_3des_ctx des3;

    for (i = 0; i < 16; ++i)
      {
        gl_3des_set2keys (&des3, key1, key2);
        gl_3des_ecb_encrypt (&des3, input, key1);
        gl_3des_ecb_decrypt (&des3, input, key2);
        gl_3des_set3keys (&des3, key1, input, key2);
        gl_3des_ecb_encrypt (&des3, input, input);
      }
    if (memcmp (input, result, 8))
      return 1;
  }

  /*
   * More Triple-DES test.  These are testvectors as used by SSLeay,
   * thanks to Jeroen C. van Gelderen.
   */
  {
    struct
    {
      char key[24];
      char plain[8];
      char cipher[8];
    } testdata[] =
    {
      {
        {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
            0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
            0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01},
        {
        0x95, 0xF8, 0xA5, 0xE5, 0xDD, 0x31, 0xD9, 0x00},
        {
      0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}},
      {
        {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
            0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
            0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01},
        {
        0x9D, 0x64, 0x55, 0x5A, 0x9A, 0x10, 0xB8, 0x52,},
        {
        0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00}
      },
      {
        {
        0x38, 0x49, 0x67, 0x4C, 0x26, 0x02, 0x31, 0x9E,
            0x38, 0x49, 0x67, 0x4C, 0x26, 0x02, 0x31, 0x9E,
            0x38, 0x49, 0x67, 0x4C, 0x26, 0x02, 0x31, 0x9E},
        {
        0x51, 0x45, 0x4B, 0x58, 0x2D, 0xDF, 0x44, 0x0A},
        {
        0x71, 0x78, 0x87, 0x6E, 0x01, 0xF1, 0x9B, 0x2A}
      },
      {
        {
        0x04, 0xB9, 0x15, 0xBA, 0x43, 0xFE, 0xB5, 0xB6,
            0x04, 0xB9, 0x15, 0xBA, 0x43, 0xFE, 0xB5, 0xB6,
            0x04, 0xB9, 0x15, 0xBA, 0x43, 0xFE, 0xB5, 0xB6},
        {
        0x42, 0xFD, 0x44, 0x30, 0x59, 0x57, 0x7F, 0xA2},
        {
        0xAF, 0x37, 0xFB, 0x42, 0x1F, 0x8C, 0x40, 0x95}
      },
      {
        {
        0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF,
            0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF,
            0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
        {
        0x73, 0x6F, 0x6D, 0x65, 0x64, 0x61, 0x74, 0x61},
        {
        0x3D, 0x12, 0x4F, 0xE2, 0x19, 0x8B, 0xA3, 0x18}
      },
      {
        {
        0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF,
            0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55,
            0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
        {
        0x73, 0x6F, 0x6D, 0x65, 0x64, 0x61, 0x74, 0x61},
        {
        0xFB, 0xAB, 0xA1, 0xFF, 0x9D, 0x05, 0xE9, 0xB1}
      },
      {
        {
        0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF,
            0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55,
            0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10},
        {
        0x73, 0x6F, 0x6D, 0x65, 0x64, 0x61, 0x74, 0x61},
        {
        0x18, 0xd7, 0x48, 0xe5, 0x63, 0x62, 0x05, 0x72}
      },
      {
        {
        0x03, 0x52, 0x02, 0x07, 0x67, 0x20, 0x82, 0x17,
            0x86, 0x02, 0x87, 0x66, 0x59, 0x08, 0x21, 0x98,
            0x64, 0x05, 0x6A, 0xBD, 0xFE, 0xA9, 0x34, 0x57},
        {
        0x73, 0x71, 0x75, 0x69, 0x67, 0x67, 0x6C, 0x65},
        {
        0xc0, 0x7d, 0x2a, 0x0f, 0xa5, 0x66, 0xfa, 0x30}
      },
      {
        {
        0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
            0x80, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
            0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02},
        {
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
        {
        0xe6, 0xe6, 0xdd, 0x5b, 0x7e, 0x72, 0x29, 0x74}
      },
      {
        {
        0x10, 0x46, 0x10, 0x34, 0x89, 0x98, 0x80, 0x20,
            0x91, 0x07, 0xD0, 0x15, 0x89, 0x19, 0x01, 0x01,
            0x19, 0x07, 0x92, 0x10, 0x98, 0x1A, 0x01, 0x01},
        {
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
        {
        0xe1, 0xef, 0x62, 0xc3, 0x32, 0xfe, 0x82, 0x5b}
      }
    };

    char result[8];
    int i;
    gl_3des_ctx des3;

    for (i = 0; i < sizeof (testdata) / sizeof (*testdata); ++i)
      {
        gl_3des_set3keys (&des3, testdata[i].key,
                          testdata[i].key + 8, testdata[i].key + 16);

        gl_3des_ecb_encrypt (&des3, testdata[i].plain, result);
        if (memcmp (testdata[i].cipher, result, 8))
          {
            return 1;
          }

        gl_3des_ecb_decrypt (&des3, testdata[i].cipher, result);
        if (memcmp (testdata[i].plain, result, 8))
          {
            return 1;
          }
      }
  }

  return 0;
}
