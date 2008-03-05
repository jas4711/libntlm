/* global.h --- Global internal include file for libntlm.
 * Copyright (C) 2004, 2005, 2006  Frediano Ziglio
 *
 * This file is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This file is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this file; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 * 02110-1301, USA
 *
 */

/*
 * Extracted from various source (mainly libmcrypt)
 */

#ifndef NTLM_GLOBAL_H_
#define NTLM_GLOBAL_H_

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <unistd.h>

#ifdef HAVE_SYS_ENDIAN_H
# include <sys/endian.h>
#endif

#ifdef HAVE_MACHINE_ENDIAN_H
# include <machine/endian.h>
#endif

#ifdef HAVE_ENDIAN_H
# include <endian.h>
#endif

#include <byteswap.h>

#ifndef NTLM_STATIC
# define NTLM_STATIC
#endif

#include "ntlm.h"

#endif /* NTLM_GLOBAL_H_ */
