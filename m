From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v1 3/8] Add in libmcrypto
Date: Wed, 2 Sep 2015 14:19:15 -0700
Message-ID: <1441228760-26042-4-git-send-email-jimmzhang@nvidia.com>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441228760-26042-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Libmcrypto is an open source crypto library. It can be found at
http://code.google.com/p/libmcrypto/

Libmcrypto provides functions for rsa pss signature calculation.

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/libm/base64.c          |  132 +++++
 src/libm/bigdUtils.c       |  208 +++++++
 src/libm/bigdigits.h       |  294 ++++++++++
 src/libm/common.c          |   58 ++
 src/libm/elliptic-ff2n.c   |  347 +++++++++++
 src/libm/elliptic-ff2n.h   |   97 +++
 src/libm/elliptic-ffp.c    | 1403 ++++++++++++++++++++++++++++++++++++++++++++
 src/libm/elliptic-ffp.h    |  232 ++++++++
 src/libm/ff2n.c            |  810 +++++++++++++++++++++++++
 src/libm/ff2n.h            |  127 ++++
 src/libm/galois.c          |  497 ++++++++++++++++
 src/libm/galois.h          |  101 ++++
 src/libm/hash.c            |  114 ++++
 src/libm/hash.h            |   49 ++
 src/libm/mcrypto.h         |   34 ++
 src/libm/md5.c             |  296 ++++++++++
 src/libm/md5.h             |   57 ++
 src/libm/mpAND.c           |    9 +
 src/libm/mpAdd.c           |   41 ++
 src/libm/mpBitLength.c     |   24 +
 src/libm/mpCompare.c       |   21 +
 src/libm/mpComplement.c    |    9 +
 src/libm/mpDivide.c        |  202 +++++++
 src/libm/mpEqual.c         |   19 +
 src/libm/mpGcd.c           |   26 +
 src/libm/mpHalfDiv.c       |   99 ++++
 src/libm/mpHalfMod.c       |   46 ++
 src/libm/mpIsOne.c         |   18 +
 src/libm/mpIsPrime.c       |  124 ++++
 src/libm/mpIsZero.c        |   19 +
 src/libm/mpJacobi.c        |   44 ++
 src/libm/mpLegendre.c      |    8 +
 src/libm/mpModAdd.c        |   32 +
 src/libm/mpModExp.c        |   40 ++
 src/libm/mpModInv.c        |   49 ++
 src/libm/mpModMult.c       |   20 +
 src/libm/mpModSquare.c     |   18 +
 src/libm/mpModSquareRoot.c |   96 +++
 src/libm/mpModSubtract.c   |   38 ++
 src/libm/mpModulo.c        |   34 ++
 src/libm/mpMultiply.c      |   55 ++
 src/libm/mpOR.c            |    9 +
 src/libm/mpSetDigit.c      |   15 +
 src/libm/mpSetEqual.c      |   11 +
 src/libm/mpSetZero.c       |   11 +
 src/libm/mpShiftLeft.c     |   43 ++
 src/libm/mpShiftRight.c    |   45 ++
 src/libm/mpShortAdd.c      |   38 ++
 src/libm/mpShortCmp.c      |   25 +
 src/libm/mpShortDiv.c      |   55 ++
 src/libm/mpShortMod.c      |   22 +
 src/libm/mpShortModMult.c  |   30 +
 src/libm/mpShortMult.c     |   40 ++
 src/libm/mpShortSub.c      |   39 ++
 src/libm/mpSizeof.c        |   14 +
 src/libm/mpSolinasPrime.c  |   41 ++
 src/libm/mpSquare.c        |   65 ++
 src/libm/mpSubtract.c      |   41 ++
 src/libm/mpSwap.c          |   16 +
 src/libm/mpXOR.c           |    9 +
 src/libm/pkcs1-rsa.c       |  833 ++++++++++++++++++++++++++
 src/libm/pkcs1-rsa.h       |  119 ++++
 src/libm/sha1.c            |  155 +++++
 src/libm/sha1.h            |   26 +
 src/libm/sha2.c            |  724 +++++++++++++++++++++++
 src/libm/sha2.h            |  128 ++++
 src/libm/spDivide.c        |  175 ++++++
 src/libm/spGcd.c           |   24 +
 src/libm/spIsPrime.c       |   89 +++
 src/libm/spModExp.c        |   64 ++
 src/libm/spModInv.c        |   41 ++
 src/libm/spModMult.c       |   17 +
 src/libm/spMultiply.c      |   76 +++
 src/libm/spPseudoRand.c    |   30 +
 74 files changed, 9017 insertions(+)
 create mode 100644 src/libm/base64.c
 create mode 100644 src/libm/bigdUtils.c
 create mode 100644 src/libm/bigdigits.h
 create mode 100644 src/libm/common.c
 create mode 100644 src/libm/elliptic-ff2n.c
 create mode 100644 src/libm/elliptic-ff2n.h
 create mode 100644 src/libm/elliptic-ffp.c
 create mode 100644 src/libm/elliptic-ffp.h
 create mode 100644 src/libm/ff2n.c
 create mode 100644 src/libm/ff2n.h
 create mode 100644 src/libm/galois.c
 create mode 100644 src/libm/galois.h
 create mode 100644 src/libm/hash.c
 create mode 100644 src/libm/hash.h
 create mode 100644 src/libm/mcrypto.h
 create mode 100644 src/libm/md5.c
 create mode 100644 src/libm/md5.h
 create mode 100644 src/libm/mpAND.c
 create mode 100644 src/libm/mpAdd.c
 create mode 100644 src/libm/mpBitLength.c
 create mode 100644 src/libm/mpCompare.c
 create mode 100644 src/libm/mpComplement.c
 create mode 100644 src/libm/mpDivide.c
 create mode 100644 src/libm/mpEqual.c
 create mode 100644 src/libm/mpGcd.c
 create mode 100644 src/libm/mpHalfDiv.c
 create mode 100644 src/libm/mpHalfMod.c
 create mode 100644 src/libm/mpIsOne.c
 create mode 100644 src/libm/mpIsPrime.c
 create mode 100644 src/libm/mpIsZero.c
 create mode 100644 src/libm/mpJacobi.c
 create mode 100644 src/libm/mpLegendre.c
 create mode 100644 src/libm/mpModAdd.c
 create mode 100644 src/libm/mpModExp.c
 create mode 100644 src/libm/mpModInv.c
 create mode 100644 src/libm/mpModMult.c
 create mode 100644 src/libm/mpModSquare.c
 create mode 100644 src/libm/mpModSquareRoot.c
 create mode 100644 src/libm/mpModSubtract.c
 create mode 100644 src/libm/mpModulo.c
 create mode 100644 src/libm/mpMultiply.c
 create mode 100644 src/libm/mpOR.c
 create mode 100644 src/libm/mpSetDigit.c
 create mode 100644 src/libm/mpSetEqual.c
 create mode 100644 src/libm/mpSetZero.c
 create mode 100644 src/libm/mpShiftLeft.c
 create mode 100644 src/libm/mpShiftRight.c
 create mode 100644 src/libm/mpShortAdd.c
 create mode 100644 src/libm/mpShortCmp.c
 create mode 100644 src/libm/mpShortDiv.c
 create mode 100644 src/libm/mpShortMod.c
 create mode 100644 src/libm/mpShortModMult.c
 create mode 100644 src/libm/mpShortMult.c
 create mode 100644 src/libm/mpShortSub.c
 create mode 100644 src/libm/mpSizeof.c
 create mode 100644 src/libm/mpSolinasPrime.c
 create mode 100644 src/libm/mpSquare.c
 create mode 100644 src/libm/mpSubtract.c
 create mode 100644 src/libm/mpSwap.c
 create mode 100644 src/libm/mpXOR.c
 create mode 100644 src/libm/pkcs1-rsa.c
 create mode 100644 src/libm/pkcs1-rsa.h
 create mode 100644 src/libm/sha1.c
 create mode 100644 src/libm/sha1.h
 create mode 100644 src/libm/sha2.c
 create mode 100644 src/libm/sha2.h
 create mode 100644 src/libm/spDivide.c
 create mode 100644 src/libm/spGcd.c
 create mode 100644 src/libm/spIsPrime.c
 create mode 100644 src/libm/spModExp.c
 create mode 100644 src/libm/spModInv.c
 create mode 100644 src/libm/spModMult.c
 create mode 100644 src/libm/spMultiply.c
 create mode 100644 src/libm/spPseudoRand.c

diff --git a/src/libm/base64.c b/src/libm/base64.c
new file mode 100644
index 000000000000..00aba9cc4785
--- /dev/null
+++ b/src/libm/base64.c
@@ -0,0 +1,132 @@
+/* Base64 Encode/Decode Functions */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include "bigdigits.h"
+
+/* base64 encoding table */
+static const char *base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
+
+/* base64 decoding table */
+static const char dectab[256] = {	
+   -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+   -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+   -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63,
+   52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, 64, -1, -1,
+   -1,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
+   15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,
+   -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
+   41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1,
+   -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+   -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+   -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+   -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+   -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+   -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+   -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+   -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 
+}; 
+
+
+char *mpBase64Encode(DIGIT_T *p, UINT len)
+{
+	BYTE *pp;
+	char *str;
+	UINT i;
+	UINT j;
+	UINT k;
+	UINT nbyte;
+	UINT slen;
+	DWORD b;
+	DWORD mask = 0x003F;
+	UINT idx[4];
+	
+	nbyte = len*BITS_PER_DIGIT / 8;
+	
+	/* make input data 3-byte blocks */
+	if(nbyte % 3) {
+		nbyte = nbyte + 3 - (nbyte % 3);
+		pp = (BYTE *)malloc(nbyte);
+		memset(pp, 0x00, nbyte);
+		memcpy(pp, p, len*BITS_PER_DIGIT / 8);	
+	}
+	else
+		pp = (BYTE *)p;
+		
+	/* init output string */
+	slen = 4*nbyte/3;
+	str = (char *)malloc(slen+1);
+	memset(str, 0x00, slen+1);
+	
+	i = 0;
+	k = 0;		
+	while(i<nbyte){
+		/* convert 3 bytes = 24 bits each */
+		b = 0x0000;
+		for(j=0;j<3;j++)
+			b |= *(pp+i+j) << (j*8);
+		
+		/* split into four 6-bit codes and append to output string */
+		for(j=0;j<4;j++){
+			idx[j] = (b & (mask << (j*6))) >> (j*6);
+			*(str+j+k) = *(base64+idx[j]);
+		}
+		
+		/* Ouput Next 4 digits */
+		k+=4;
+		
+		/* Next 3 bytes */
+		i+=3;
+		
+	}
+	
+	free(pp);
+
+	return str;
+}
+
+DIGIT_T *mpBase64Decode(UINT *len, char *str)
+{
+	BYTE *p;
+	int i;
+	UINT j;
+	UINT k;
+	DWORD b;
+	UINT nbyte;
+	DWORD mask = 0x00FF;
+	
+	if((strlen(str) % 4)){
+		*len = 0;
+		return NULL;
+	}
+	
+	/* init output big integer */
+	nbyte = strlen(str)*3/4;
+	p = (BYTE *)malloc(nbyte);
+	memset(p, 0x00, nbyte);
+	
+	*len = nbyte / (BITS_PER_DIGIT / 8);
+	
+	
+	i = 0;
+	k = 0;
+	while(i < strlen(str)){
+		/* convert each 4 digits to 3 bytes */
+		b = 0x0000;
+		for(j=0;j<4;j++)
+			b |= (((BYTE)dectab[(BYTE)*(str+i+j)]) << (6*j));
+		
+		for(j=0;j<3;j++)
+			*(p+k+j) = (BYTE)((b >> (j*8)) & mask); 
+		
+		/* next 3 bytes */
+		k+= 3;
+		
+		/* next 4 digits */
+		i+= 4;
+	}
+	
+	return (DIGIT_T *)p;	
+}
+
diff --git a/src/libm/bigdUtils.c b/src/libm/bigdUtils.c
new file mode 100644
index 000000000000..37a4888d2a8d
--- /dev/null
+++ b/src/libm/bigdUtils.c
@@ -0,0 +1,208 @@
+/* bigdUtils.c */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include "bigdigits.h"
+
+/* support function */
+static BYTE hex2byte(char c)
+{
+	BYTE b;
+	
+	switch(c) {
+	case '0': 	b = 0; break;
+	case '1':	b = 1; break;
+	case '2':	b = 2; break;
+	case '3':	b = 3; break;
+	case '4':	b = 4; break;
+	case '5':	b = 5; break;
+	case '6':	b = 6; break;
+	case '7':	b = 7; break;
+	case '8':	b = 8; break;
+	case '9':	b = 9; break;
+	case 'A': 	
+	case 'a':	b = 10; break;
+	case 'B':	
+	case 'b':	b = 11; break;
+	case 'C':	
+	case 'c':	b = 12; break;
+	case 'D':	
+	case 'd':	b = 13; break;
+	case 'E':	
+	case 'e':	b = 14; break;
+	case 'F': 	
+	case 'f':	b = 15; break;
+	default: b = 0;
+	}
+	
+	return b;
+}
+
+DIGIT_T *mpMalloc(UINT ndigits)
+{
+	return (DIGIT_T *)malloc(NBYTE(ndigits));
+}
+
+DIGIT_T *mpMallocB(UINT nbits, UINT *ndigits)
+{
+	*ndigits = (nbits % BITS_PER_DIGIT) ? (nbits / BITS_PER_DIGIT) + 1 : nbits / BITS_PER_DIGIT;
+	return mpMalloc(*ndigits);
+}
+
+void mpFree(DIGIT_T *p)
+{
+	if(p)
+		free(p);
+	p = NULL;
+}
+
+
+/* main functions */
+void mpPrint(const DIGIT_T *p, UINT len)
+{
+	while (len--)
+		printf("%08lx ", p[len]);
+}
+
+void mpPrintNL(const DIGIT_T *p, UINT len)
+{
+	UINT i = 0;
+
+	while (len--) {
+		if ((i % 8) == 0 && i)
+			printf("\n");
+		printf("%08lx ", p[len]);
+		i++;
+	}
+	printf("\n");
+}
+
+void mpPrintTrim(const DIGIT_T *p, UINT len)
+{
+	/* Trim leading zeroes */
+	while (len--)
+		if (p[len] != 0)
+			break;
+	len++;
+	while (len--)
+		printf("%08lx ", p[len]);
+}
+
+void mpPrintTrimNL(const DIGIT_T *p, UINT len)
+{
+	UINT i = 0;
+
+	/* Trim leading zeroes */
+	while (len--)
+		if (p[len] != 0)
+			break;
+	len++;
+	while (len--) {
+		if ((i % 8) == 0 && i)
+			printf("\n");
+		printf("%08lx ", p[len]);
+		i++;
+	}
+	printf("\n");
+}
+
+void mpMakeRandom(DIGIT_T a[], UINT ndigits)
+{
+#if STRONG_RANDOM	
+	prng((BYTE *)a, NBYTE(ndigits));
+#else
+	UINT i;
+		
+	for (i = 0; i < ndigits; i++)
+		a[i] = spPseudoRand(0, MAX_DIGIT);
+#endif	
+}
+
+BYTE *mpASC2BIN(const char *s, UINT len, UINT *nread)
+{
+	BYTE *p = NULL;
+	
+	/* init big integer storage */
+	p = (BYTE*)malloc(len);
+	memset(p, 0x00, len);
+	
+	/* Convert using ASCII table */
+	if(len>strlen(s))
+		*nread = strlen(s);
+	else
+		*nread = len;
+	
+	memcpy(p, s, *nread);
+	
+	return p;
+}
+
+char *mpBIN2ASC(const BYTE *p, UINT len)
+{
+	char *s = NULL;
+	
+	/* init string storage */
+	s = (char *)malloc(len+1);
+	memset(s, 0x00, len+1);
+	
+	memcpy(s, p, len);
+	
+	return s;
+}
+
+BYTE *mpHex2Bin(const char *s, UINT len, UINT *nread)
+{
+	BYTE *p = NULL;
+	UINT i;
+	
+	if(strlen(s) % 2){
+		*nread = 0;
+		return NULL;
+	}
+	
+	p = (BYTE *)malloc(len);
+	memset(p, 0x00, len);
+		
+	if(len < strlen(s)/2)
+		*nread = 2*len;
+	else
+		*nread = strlen(s);
+	
+	i = 0;
+	while(i<*nread){
+		/* read 2 characters each = 1 byte */
+		p[i/2] = hex2byte(s[strlen(s)-i-1]) + (hex2byte(s[strlen(s)-i-2]) << 4);
+		i+=2;
+	}
+	
+	return p;
+}
+
+char *mpBin2Hex(const BYTE *p, UINT len)
+{
+	char *s = NULL;
+	UINT i;
+	
+	s = (char *)malloc(2*len + 1);
+	memset(s, 0x00, 2*len+1);
+	
+	i = 0;
+	while (len--){
+		sprintf(s+i, "%02X", p[len]);
+		i+=2;
+	}
+	
+	return s;
+}
+
+BYTE *mpDec2Bin(const char *s, UINT *nread)
+{
+	return NULL;
+}
+
+BYTE *mpOct2Hex(const char *s, UINT *nread)
+{
+	return NULL;
+}
+
diff --git a/src/libm/bigdigits.h b/src/libm/bigdigits.h
new file mode 100644
index 000000000000..7c9f563f3d54
--- /dev/null
+++ b/src/libm/bigdigits.h
@@ -0,0 +1,294 @@
+/* bigdigits.h */
+
+/*
+  Most of this multi-precision arithmetic library was developed by David Ireland, 
+  the author of BIGDIGITS library, copyright (c) 2001-8 by D.I. Management
+  Services Pty Limited - www.di-mgt.com.au. 
+  
+  The bigdigits library version 1.0 has been extended by Dang Nguyen Duc and posted 
+  on public domain with permission from Davia Ireland.
+*/
+
+
+#ifndef _BIGDIGITS_H_
+#define _BIGDIGITS_H_ 1
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#include "mcrypto.h"
+
+/* Define type of DIGIT here */
+typedef unsigned long DIGIT_T;
+typedef unsigned short HALF_DIGIT_T;
+
+/* Sizes to suit your machine - todo: move to mcrypto.h */
+#define MAX_DIGIT 	(DIGIT_T)(0xffffffff)
+#define MAX_HALF_DIGIT 	(DIGIT_T)(0xffff)
+#define BITS_PER_DIGIT 	32
+#define HIBITMASK 	(DIGIT_T)(0x80000000)
+
+/* Max number of digits expected in a mp array ~ 2048 bits */
+#define MAX_DIG_LEN 64	
+
+/*	temp storage to be used in:
+	mpModulo, mpShortMod, mpModMult, mpGcd,
+	mpModInv, mpIsPrime, have max number of digits
+*/
+
+/* Useful macros - todo: move to mcrypto.h */
+#define LOHALF(x) ((DIGIT_T)((x) & 0xffff))
+#define HIHALF(x) ((DIGIT_T)((x) >> 16 & 0xffff))
+#define TOHIGH(x) ((DIGIT_T)((x) << 16))
+
+#define ISODD(x) ((x) & 0x1)
+#define ISEVEN(x) (!ISODD(x))
+
+#define mpISODD(x, n) (x[0] & 0x1)
+#define mpISEVEN(x, n) (!(x[0] & 0x1))
+
+#define mpNEXTBITMASK(mask, n) if(mask==1){mask=HIBITMASK;n--;}else{mask>>=1;}
+
+#define NBYTE(len)	(len)*BITS_PER_DIGIT / 8	
+#define NDIGIT(n)	((n) % BITS_PER_DIGIT) ? ((n) / BITS_PER_DIGIT) + 1 : ((n) / BITS_PER_DIGIT)
+
+/* memory management rountines */
+DIGIT_T *mpMalloc(UINT ndigits);
+	/* allocate memory for big integer with ndigits digits */
+
+DIGIT_T *mpMallocB(UINT nbits, UINT *ndigits);
+	/* allocate memory for big integer with nbits-bit long */
+
+void mpFree(DIGIT_T *p);
+	/* free memory allocated to p */
+
+/*	Multiple precision calculations	
+	Using known, equal ndigits
+	except where noted
+*/
+
+DIGIT_T mpAdd(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T v[], UINT ndigits);
+	/* Computes w = u + v, returns carry */
+
+DIGIT_T mpSubtract(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T v[], UINT ndigits);
+	/* Computes w = u - v, returns borrow */
+
+int mpMultiply(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T v[], UINT ndigits);
+	/* Computes product w = u * v 
+	   u, v = ndigits long; w = 2 * ndigits long */
+
+int mpDivide(DIGIT_T q[], DIGIT_T r[], const DIGIT_T u[], UINT udigits, const DIGIT_T v[], UINT vdigits);
+	/* Computes quotient q = u / v and remainder r = u mod v 
+	   q, r, u = udigits long; v = vdigits long
+	   Warning: Trashes q and r first */
+
+int mpSquare(DIGIT_T w[], const DIGIT_T u[], UINT ndigits);
+	/* Compute w = u^2 */
+
+int mpModulo(DIGIT_T r[], const DIGIT_T u[], UINT udigits, const DIGIT_T v[], UINT vdigits);
+	/* Computes r = u mod v 
+	   u = udigits long; r, v = vdigits long */
+
+int mpModMult(DIGIT_T a[], const DIGIT_T x[], const DIGIT_T y[], const DIGIT_T m[], UINT ndigits);
+	/* Computes a = (x * y) mod m */
+
+int mpModSquare(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T p[], UINT ndigits);
+	/* Compute w = u^2 mod p */
+	
+int mpModExp(DIGIT_T y[], const DIGIT_T x[], const DIGIT_T n[], const DIGIT_T d[], UINT ndigits);
+	/* Computes y = x^n mod d */
+
+int mpModInv(DIGIT_T inv[], const DIGIT_T u[], const DIGIT_T v[], UINT ndigits);
+	/*	Computes inv = u^-1 mod v */
+
+int mpModAdd(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T v[], const DIGIT_T m[], UINT ndigits);
+	/* Compute w = u + v mod m */
+
+int mpModSubtract(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T v[], const DIGIT_T m[], UINT ndigits);
+	/* Compute w = u - v mod m */
+
+int mpJacobi(int *val, const DIGIT_T a[], const DIGIT_T m[], UINT len);
+	/* Compute Jacobian symbol val = (a/m) where m is an odd integer */
+	
+int mpLegendre(int *val, const DIGIT_T a[], const DIGIT_T p[], UINT len);
+	/* Compute Legendre symbol val = (a/p) where p is an odd prime */
+
+int mpModSquareRoot(DIGIT_T x[], const DIGIT_T a[], const DIGIT_T p[], UINT S, const DIGIT_T Q[], const DIGIT_T V[], const DIGIT_T a1[], UINT len);
+	/* 
+	   Compute modulo p square root of a, x^2 = a mod p 
+	   a1 = a^-1 mod p
+	   p-1 = Q*2^S, Q is odd
+	   V = W^Q mod p where W is a quadratic nonresidue modulo p
+	   V, S, Q are computed using mpModSquareRootPre
+	   a1 can be computed by mpModInv or mpModExp (a^(-1) = a^(p-2) mod p)
+	*/
+
+int mpModSquareRootPre(UINT *S, DIGIT_T Q[], DIGIT_T V[], const DIGIT_T p[], UINT len);
+	/* Precomputation for mpModSquareRoot */
+
+int mpGcd(DIGIT_T g[], const DIGIT_T x[], const DIGIT_T y[], UINT ndigits);
+	/* Computes g = gcd(x, y) */
+
+int mpEqual(const DIGIT_T a[], const DIGIT_T b[], UINT ndigits);
+	/* Returns true if a == b, else false */
+
+int mpCompare(const DIGIT_T a[], const DIGIT_T b[], UINT ndigits);
+	/* Returns sign of (a - b) */
+
+int mpIsZero(const DIGIT_T a[], UINT ndigits);
+	/* Returns true if a == 0, else false */
+
+int mpIsOne(const DIGIT_T a[], UINT ndigits);
+	/* Returns true if a == 1, else false */
+
+int mpSwap(DIGIT_T a[], DIGIT_T b[], UINT len);
+	/* Swap two integers */
+
+/* Bitwise operations */
+
+DIGIT_T mpShiftLeft(DIGIT_T a[], const DIGIT_T b[], UINT x, UINT ndigits);
+	/* Computes a = b << x */
+
+DIGIT_T mpShiftRight(DIGIT_T a[], const DIGIT_T b[], UINT x, UINT ndigits);
+	/* Computes a = b >> x */
+
+void mpAND(DIGIT_T a[], const DIGIT_T x[], const DIGIT_T y[], UINT ndigits);	
+	/* Bitwise AND */
+
+void mpOR(DIGIT_T a[], const DIGIT_T x[], const DIGIT_T y[], UINT ndigits);	
+	/* Bitwise OR */
+	
+void mpXOR(DIGIT_T a[], const DIGIT_T x[], const DIGIT_T y[], UINT ndigits);
+	/* Bitwise XOR */
+
+void mpComplement(DIGIT_T a[], const DIGIT_T b[], UINT ndigits);
+	/* Bitwise Complement */
+	
+/* Other mp utilities */
+
+void mpSetZero(DIGIT_T a[], UINT ndigits);
+	/* Sets a = 0 */
+
+void mpSetDigit(DIGIT_T a[], DIGIT_T d, UINT ndigits);
+	/* Sets a = d where d is a single digit */
+
+void mpSetEqual(DIGIT_T a[], const DIGIT_T b[], UINT ndigits);
+	/* Sets a = b */
+
+UINT mpSizeof(const DIGIT_T a[], UINT ndigits);
+	/* Returns size of significant non-zero digits in a */
+
+UINT mpBitLength(const DIGIT_T d[], UINT ndigits);
+	/* Return actual bit length of d */
+
+int mpIsPrime(const DIGIT_T w[], UINT ndigits, UINT t);
+	/* Returns true if w is a probable prime 
+	   t tests using FIPS-186-2/Rabin-Miller */
+
+UINT mpSolinasPrime(DIGIT_T p[], UINT ndigits, UINT bit_len);
+	/* generate Solinas' prime of the form p = 2^a + 2^b + 1, return b if succeeded and 0 if failed */
+
+/* mpShort = mp x single digit calculations */
+
+DIGIT_T mpShortAdd(DIGIT_T w[], const DIGIT_T u[], DIGIT_T d, UINT ndigits);
+	/* Computes w = u + d, returns carry */
+
+DIGIT_T mpShortSub(DIGIT_T w[], const DIGIT_T u[], DIGIT_T v, UINT ndigits);
+	/* Computes w = u - v, returns borrow */
+
+DIGIT_T mpShortMult(DIGIT_T p[], const DIGIT_T x[], DIGIT_T y, UINT ndigits);
+	/* Computes product p = x * y */
+
+DIGIT_T mpShortDiv(DIGIT_T q[], const DIGIT_T u[], DIGIT_T v, UINT ndigits);
+	/* Computes q = u / v, returns remainder */
+
+DIGIT_T mpShortMod(const DIGIT_T a[], DIGIT_T d, UINT ndigits);
+	/* Return r = a mod d */
+
+int mpShortCmp(const DIGIT_T a[], DIGIT_T b, UINT ndigits);
+	/* Return sign of (a - b) where b is a single digit */
+
+int mpShortModMult(DIGIT_T w[], const DIGIT_T u[], DIGIT_T v, DIGIT_T m[], UINT ndigits);
+	/* Compute w = u*v mod m */
+
+/* Short division using only half-digit divisor */
+
+DIGIT_T mpHalfDiv(DIGIT_T q[], const DIGIT_T a[], HALF_DIGIT_T d, UINT ndigits);
+	/* Computes q = a mod d, returns remainder */
+
+DIGIT_T mpHalfMod(const DIGIT_T a[], HALF_DIGIT_T d, UINT ndigits);
+	/* Return r = a mod d */
+
+/* Single precision calculations (double where necessary) */
+
+int spMultiply(DIGIT_T p[2], DIGIT_T x, DIGIT_T y);
+	/* Computes p = x * y */
+
+DIGIT_T spDivide(DIGIT_T *q, DIGIT_T *r, DIGIT_T u[2], DIGIT_T v);
+	/* Computes quotient q = u / v, remainder r = u mod v */
+
+int spModExp(DIGIT_T *exp, DIGIT_T x, DIGIT_T n, DIGIT_T d);
+	/* Computes exp = x^n mod d */
+
+int spModMult(DIGIT_T *a, DIGIT_T x, DIGIT_T y, DIGIT_T m);
+	/* Computes a = (x * y) mod m */
+
+int spModInv(DIGIT_T *inv, DIGIT_T u, DIGIT_T v);
+	/* Computes inv = u^-1 mod v */
+
+DIGIT_T spGcd(DIGIT_T x, DIGIT_T y);
+	/* Returns gcd(x, y) */
+
+int spIsPrime(DIGIT_T w, UINT t);
+	/* Returns true if w is prime, else false; try t tests */
+
+DIGIT_T spPseudoRand(DIGIT_T lower, DIGIT_T upper);
+	/* Returns single pseudo-random digit between lower and upper */
+
+/* Utilities */
+
+void mpPrint(const DIGIT_T *p, UINT len);
+	/* Print all digits incl leading zero digits */
+	
+void mpPrintNL(const DIGIT_T *p, UINT len);
+	/* Print all digits with newlines */
+	
+void mpPrintTrim(const DIGIT_T *p, UINT len);
+	/* Print but trim leading zero digits */
+	
+void mpPrintTrimNL(const DIGIT_T *p, UINT len);
+	/* Print, trim leading zeroes, add newlines */
+
+void mpMakeRandom(DIGIT_T a[], UINT ndigits);
+	/* Generate a pseudorandom number */
+	
+BYTE *mpASC2BIN(const char *s, UINT len, UINT *nread);
+	/* convert an ascii string to a big integer of length len */
+
+char *mpBIN2ASC(const BYTE *p, UINT len);
+	/* convert a big integer of length len to an ascii string */
+
+BYTE *mpHex2Bin(const char *s, UINT len, UINT *nread);
+	/* Convert an hexa string to binary data */
+
+char *mpBin2Hex(const BYTE *p, UINT len);
+	/* Convert binary data to an hexa string */
+	
+BYTE *mpDec2Bin(const char *s, UINT *nread);
+	/* Convert a decimal string to binary data */
+
+BYTE *mpOct2Hex(const char *s, UINT *nread);
+	/* Convert an octal string to binary data */
+
+char *mpBase64Encode(DIGIT_T *p, UINT len);
+	/* convert binary data to an integer string in base64 */
+
+DIGIT_T *mpBase64Decode(UINT *len, char *str);
+	/* convert an integer string in base 64 to binary data */
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif	/* _BIGDIGITS_H_ */
diff --git a/src/libm/common.c b/src/libm/common.c
new file mode 100644
index 000000000000..a28497592882
--- /dev/null
+++ b/src/libm/common.c
@@ -0,0 +1,58 @@
+/* common functions for libmcrypto */
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+
+#ifdef __linux__
+	/* linux-specific include files */
+	#include <unistd.h>
+	#include <sys/types.h>
+	#include <sys/stat.h>
+#elif defined(window)
+	/* window-specific include files */
+#endif 
+
+#include "mcrypto.h"
+
+int prng(BYTE* buf, int buf_size)
+{
+#if LINUX_URANDOM	    	
+	int fd;
+    
+    	if((fd = open("/dev/urandom", O_RDONLY)) < 0) {
+        	perror("/dev/urandom");
+        	return -1;
+    	}
+    	read(fd, buf, buf_size);
+    	close(fd);
+#else
+	/* other platforms support here - for now fill buf with zeros :) */
+	memset(buf, 0x00, buf_size);
+#endif		
+	return 0;
+}
+
+/* Useful Function for Debug */
+void mcrypto_msg(const char *s)
+{
+#ifdef MCRYPTO_DEBUG
+	fprintf(stderr, "debugging message - file %s line %d : %s", __FILE__, __LINE__, s);
+#endif
+}
+
+void mcrypto_dump(char *desc, BYTE *p, UINT len)
+{
+#ifdef MCRYPTO_DEBUG
+	UINT i = 0;
+	
+	printf("[%s]\n", desc);
+	while (len--) {
+		if ((i % 20) == 0 && i)
+			printf("\n");
+		fprintf(stderr, "%02x ", p[len]);
+		i++;
+	}
+	fprintf(stderr, "\n");
+#endif
+}
diff --git a/src/libm/elliptic-ff2n.c b/src/libm/elliptic-ff2n.c
new file mode 100644
index 000000000000..16aa3937285c
--- /dev/null
+++ b/src/libm/elliptic-ff2n.c
@@ -0,0 +1,347 @@
+/*--------------------------------------------------------------------*/
+/* elliptic.c  : ellipic curve arithmetic implementation source file  */
+/* Author      : Dang Nguyen Duc - nguyenduc-nMRlb+72nxtQFI55V6+gNQ@public.gmane.org		      */
+/* Last Update : 04/03/2001					      */
+/* Reference   : "Elliptic Curve Cryptography" by I. F. Blake et al.  */
+/* TO DO       :						      */
+/*--------------------------------------------------------------------*/
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <assert.h>
+#include "elliptic-ff2n.h"
+#include "ff2n.h"
+#include "bigdigits.h"
+
+E2n_Point* e2n_point_init(E2n_Curve *E)
+{
+	E2n_Point *P = NULL;
+	
+	P = (E2n_Point *)malloc(sizeof(E2n_Point));
+	
+	P->x = (FF2N_ELT *)malloc(FF2N_NBYTE(E->len));
+	P->y = (FF2N_ELT *)malloc(FF2N_NBYTE(E->len));
+
+	return P;
+}
+	
+
+int e2n_point_copy(E2n_Curve *E, E2n_Point *Q, E2n_Point *P)
+{
+	ff2n_set_equal(Q->x, P->x, E->len);
+	ff2n_set_equal(Q->y, P->y, E->len);
+	
+	return 0;
+}
+
+int e2n_point_zero(E2n_Curve *E, E2n_Point *P)
+{
+	/* P = infinity */
+	ff2n_set_zero(P->x, E->len);
+	ff2n_set_zero(P->y, E->len);
+	
+	return 0;
+}
+
+
+int e2n_point_inv(E2n_Curve *E, E2n_Point *Q, E2n_Point *P)
+{
+	/* Q = -P: Xq = Xp, Yq = Xp + Yp */
+	ff2n_set_equal(Q->x, P->x, E->len);
+	ff2n_add(Q->y, P->x, P->y, E->len);
+	
+	return 0;
+}
+
+int e2n_point_double(E2n_Curve *E, E2n_Point* Q, E2n_Point *P)
+{
+	FF2N_ELT *lamda;
+	FF2N_ELT *T1;
+	FF2N_ELT *T2;
+	
+	/* If P = Infinity */
+	if(ff2n_is_zero(P->x, E->len) && ff2n_is_zero(P->y, E->len))
+	{
+		e2n_point_zero(E, Q);
+		
+		return 0;
+	}
+	
+	/* Allocate memory */
+	lamda = (FF2N_ELT *)malloc(FF2N_NBYTE(E->len));
+	T1 = (FF2N_ELT *)malloc(FF2N_NBYTE(E->len));
+	T2 = (FF2N_ELT *)malloc(FF2N_NBYTE(E->len));
+	
+	/* lamda = Yp/Xp + Xp */
+	ff2n_inverse(T1, P->x, E->n, E->len);		/* T1 = Xp^-1 */
+	ff2n_mul(T2, T1, P->y, E->n, E->len);		/* T2 = Yp*T1 */
+	ff2n_add(lamda, T2, P->x, E->len);		/* lamda = T2 + Xp */
+	
+	/* Xq = lamda^2 + lamda + a */
+	ff2n_sqr2(T1, lamda, E->n, E->len);		/* T1 = lamda^2 */
+	ff2n_add(T2, T1, lamda, E->len);		/* T2 = T1 + lamda */
+	ff2n_add(Q->x, T2, E->a, E->len);		/* Xq = T2 + a */
+	
+	/* Yq = (Xp + Xq)*lamda + Xq + Yp */
+	ff2n_add(T1, Q->x, P->x, E->len);		/* T1 = Xp + Xq */
+	ff2n_mul(T2, T1, lamda, E->n, E->len);		/* T2 = T1 * lamda */
+	ff2n_add(T1, T2, Q->x, E->len);			/* T1 = T2 + Xq */
+	ff2n_add(Q->y, T1, P->y, E->len);		/* Yq = T1 + Yp */
+	
+	free(lamda);
+	free(T1);
+	free(T2);
+	
+	return 0;
+}
+
+int e2n_point_add(E2n_Curve *E, E2n_Point *R, E2n_Point *P, E2n_Point *Q)
+{
+	FF2N_ELT *lamda;
+	FF2N_ELT *T1;
+	FF2N_ELT *T2;
+	
+	/* If P = Q, call e2n_point_double instead */
+	if(ff2n_is_equal(P->x, Q->x, E->len) && ff2n_is_equal(P->y, Q->y, E->len))
+		return e2n_point_double(E, R, P);
+		
+	/* if P = infinity */
+	if(ff2n_is_zero(P->x, E->len) && ff2n_is_zero(P->y, E->len))
+	{
+		e2n_point_copy(E, R, Q);
+		
+		return 0;
+	}
+	
+	/* if Q = infinity */
+	if(ff2n_is_zero(Q->x, E->len) && ff2n_is_zero(Q->y, E->len))
+	{
+		e2n_point_copy(E, R, P);
+		
+		return 0;
+	}
+	
+	/* if P = -Q */	
+	T1 = (FF2N_ELT *)malloc(FF2N_NBYTE(E->len));
+	ff2n_add(T1, Q->x, Q->y, E->len);
+	if(ff2n_is_equal(P->x, Q->x, E->len) && ff2n_is_equal(P->y, T1, E->len))
+	{
+		e2n_point_zero(E, R);
+		
+		free(T1);
+		return 0;
+	}
+	
+	/* Otherwise - Allocate memory */
+	lamda = (FF2N_ELT *)malloc(FF2N_NBYTE(E->len));
+	T2 = (FF2N_ELT *)malloc(FF2N_NBYTE(E->len));
+	
+	/* Compute lamda = (Yp + Yq) / (Xp + Xq) */
+	ff2n_add(T1, P->x, Q->x, E->len);		/* T1 =  Xp + Xq */
+	ff2n_inverse(T2, T1, E->n, E->len);		/* T2 = T1^-1 */
+	ff2n_add(T1, P->y, Q->y, E->len);		/* T1 = Yq + Yq */
+	ff2n_mul(lamda, T1, T2, E->n, E->len);		/* lamda = T1 * T2 */
+	
+	/* Compute Xr = a + lamda^2 + lamda + Xp + Xq */
+	ff2n_sqr2(T1, lamda, E->n, E->len);		/* T1 = lamda^2 */
+	ff2n_add(T2, T1, E->a, E->len);			/* T2 = T1 + a */
+	ff2n_add(T1, T2, lamda, E->len);		/* T1 = T2 + lamda */
+	ff2n_add(T2, T1, P->x, E->len);			/* T2 = T1 + Xp */
+	ff2n_add(R->x, T2, Q->x, E->len);		/* Xr = T2 + Xq */
+	
+	/* Yr = (Xp + Xr)*lamda + Xr + Yp */
+	ff2n_add(T1, R->x, P->x, E->len);		/* T1 = Xp + Xq */
+	ff2n_mul(T2, T1, lamda, E->n, E->len);		/* T2 = T1 * lamda */
+	ff2n_add(T1, T2, R->x, E->len);			/* T1 = T2 + Xq */
+	ff2n_add(R->y, T1, P->y, E->len);		/* Yq = T1 + Yp */
+	
+	free(lamda);
+	free(T1);
+	free(T2);
+	
+	return 0;
+}
+
+int e2n_point_sub(E2n_Curve *E, E2n_Point *R, E2n_Point *P, E2n_Point *Q)
+{
+	E2n_Point *T;
+	
+	T = e2n_point_init(E);
+	
+	e2n_point_inv(E, T, Q);
+	
+	e2n_point_add(E, R, P, T);
+	
+	free(T->x);
+	free(T->y);
+	free(T);
+	
+	return 0;
+}
+	
+int e2n_point_mul(E2n_Curve *E, E2n_Point *Q, E2n_Point *P, DIGIT_T *k, UINT klen)
+{
+	/* scalar multiplication using binary method */
+	DIGIT_T mask;
+	int i;
+	E2n_Point *R;
+	
+	/* Allocate temp memory */
+	R = e2n_point_init(E);
+			
+	/* Set Q = Infinity */
+	e2n_point_zero(E, Q);
+
+	while(klen--)
+	{
+		mask = HIBITMASK;
+		for(i=BITS_PER_DIGIT-1;i>=0;i--)
+		{
+			e2n_point_double(E, R, Q);
+			if(k[klen] & mask)
+			{
+				e2n_point_add(E, Q, R, P);
+			}
+			else
+			{
+				ff2n_set_equal(Q->x, R->x, E->len);
+				ff2n_set_equal(Q->y, R->y, E->len);
+			}		
+			mask >>= 1;
+		}
+	}
+	
+	free(R->x);
+	free(R->y);
+	free(R);
+	
+	return 0;
+}
+
+int e2n_point_gen(E2n_Curve *E, E2n_Point *P)
+{
+    	/* need ff2n_square_root function */
+	
+    	return 0;
+}
+
+/* Utility function */
+int e2n_load_curve(char *fname, E2n_Curve *E)
+{
+	FILE *f;
+	char s[E2N_NPARAM][E2N_MAX_LINE_LEN];
+	int i;
+	
+	f = fopen(fname, "r");
+
+	if(f==NULL){
+		printf("Failed to read file %s\n",fname);
+		return -1;
+	}
+
+	memset(s, 0x00, E2N_NPARAM*E2N_MAX_LINE_LEN);
+	
+	/* reading data */
+	for(i=0;i<E2N_NPARAM;i++)
+	{
+		if(feof(f))
+		{
+			fclose(f);
+			return -1;
+		}
+		fgets(s[i], E2N_MAX_LINE_LEN, f);
+		s[i][strlen(s[i])-1] = '\0';
+	}
+	fclose(f);
+	
+	/* Collecting data */
+	E->len = (UINT)atoi(s[1]);
+	
+	if((E->n=ff2n_str2poly(FF2N_NBYTE(E->len), s[2]))==NULL)
+		return -1;
+	
+	if((E->a=ff2n_str2poly(FF2N_NBYTE(E->len), s[3]))==NULL)
+		return -1;
+	
+	if((E->b=ff2n_str2poly(FF2N_NBYTE(E->len), s[4]))==NULL)
+		return -1;
+	
+	if((E->G.x=ff2n_str2poly(FF2N_NBYTE(E->len), s[5]))==NULL)
+		return -1;
+	
+	if((E->G.y=ff2n_str2poly(FF2N_NBYTE(E->len), s[6]))==NULL)
+		return -1;
+	
+	E->rlen = (UINT)atoi(s[7]);
+	
+	if((E->r=ff2n_str2poly(FF2N_NBYTE(E->len), s[8]))==NULL)
+		return -1;
+	
+	E->h = (DIGIT_T)atoi(s[9]);
+	
+
+	return 0;
+}
+
+int e2n_save_curve(char *fname, E2n_Curve *E)
+{
+	FILE *f;
+	
+	if((f=fopen(fname, "w")) == NULL)
+		return -1;
+	
+	fprintf(f,"------------------------BEGIN ELLIPTIC CURVE PARAMETERS-------------------------\n");
+	fprintf(f,"%d\n", E->len);
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)E->n, NBYTE(E->len)));
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)E->a, NBYTE(E->len)));
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)E->b, NBYTE(E->len)));
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)E->G.x, NBYTE(E->len)));
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)E->G.y, NBYTE(E->len)));
+	fprintf(f,"%d\n", E->rlen);
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)E->r, NBYTE(E->rlen)));
+	fprintf(f,"%lu\n", E->h);
+	fprintf(f,"-----------------------END OF ELLIPTIC CURVE PARAMETERS-------------------------\n");
+	
+	fclose(f);
+	
+	return 0;
+}
+
+int e2n_is_on_curve(E2n_Curve *E, E2n_Point *P)
+{
+	FF2N_ELT *T1;
+	FF2N_ELT *T2;
+	FF2N_ELT *T3;
+	FF2N_ELT *T4;
+	int ret;
+	
+	/* If P = Infinity */
+	if(ff2n_is_zero(P->x, E->len) && ff2n_is_zero(P->y, E->len))
+		return 1;
+	
+	T1 = (FF2N_ELT *)malloc(FF2N_NBYTE(E->len));
+	T2 = (FF2N_ELT *)malloc(FF2N_NBYTE(E->len));
+	T3 = (FF2N_ELT *)malloc(FF2N_NBYTE(E->len));
+	T4 = (FF2N_ELT *)malloc(FF2N_NBYTE(E->len));
+	
+	/* T1 = Yp^2 + Yp*Xp */
+	ff2n_sqr2(T1, P->y, E->n, E->len);
+	ff2n_mul(T2, P->x, P->y, E->n, E->len);
+	ff2n_add(T1, T1, T2, E->len);
+	
+	/* T2 = Xp^3 + a*Xp^2 + b */
+	ff2n_sqr2(T2, P->x, E->n, E->len);
+	ff2n_mul(T3, T2, E->a, E->n, E->len);
+	ff2n_mul(T4, T2, P->x, E->n, E->len);
+	ff2n_add(T2, T3, T4, E->len);
+	ff2n_add(T2, T2, E->b, E->len);
+	
+	ret = ff2n_is_equal(T1, T2, E->len);
+	
+	free(T1);
+	free(T2);
+	free(T3);
+	free(T4);
+	
+	return ret;
+}
diff --git a/src/libm/elliptic-ff2n.h b/src/libm/elliptic-ff2n.h
new file mode 100644
index 000000000000..1696d721f02c
--- /dev/null
+++ b/src/libm/elliptic-ff2n.h
@@ -0,0 +1,97 @@
+/*--------------------------------------------------------------------*/
+/* elliptic.h  : ellipic curve arithmetic implementation header file  */
+/* Author      : Dang Nguyen Duc - nguyenduc-nMRlb+72nxtQFI55V6+gNQ@public.gmane.org		      */
+/* Last Update : 03/02/2007					      */
+/*--------------------------------------------------------------------*/
+
+#ifndef _ELLIPTIC_FF2N_H_
+#define _ELLIPTIC_FF2N_H_
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#include "ff2n.h"
+#include "bigdigits.h"
+
+/* coordinate data structure */
+typedef struct {
+		  	FF2N_ELT *x;
+		  	FF2N_ELT *y;
+		} E2n_Point;
+
+typedef struct {
+		  	FF2N_ELT *X;	/* x = X/Z^2 */
+		  	FF2N_ELT *Y;	/* y = Y/Z^3 */
+			FF2N_ELT *Z;
+		} E2n_Projective_Point;
+
+/* elliptic curve over GF(2^n) affine coordinate : y^2 + xy = x^3 + a*x^2 + b */
+/*                         projective coordinate : Y^2 + XYZ = X^3 + aX^2Z^2 + bZ^6 */
+typedef struct {
+			UINT		len;	/* Length of field element in DWORD */
+			FF2N_ELT	*n;	/* Irreducible polynomial */		
+			FF2N_ELT	*a;	
+			FF2N_ELT	*b;	/* must be non-zero */
+			E2n_Point	G;	/* base point */
+			UINT		rlen;	/* length of r in DWORD */
+			DIGIT_T		*r;	/* base point order */
+			DIGIT_T		h;	/* h*r = order of curve */
+		} E2n_Curve;
+
+#define E2N_NPARAM		9 + 2	    	/* Number of lines in domain parameter file */
+#define E2N_MAX_LINE_LEN	256+1		/* Max length of a line in domain parameter file */
+
+/* function prototypes */
+
+E2n_Point* e2n_point_init(E2n_Curve *E);
+	/* Allocate Memory for a Point */
+
+int e2n_point_copy(E2n_Curve *E, E2n_Point *P, E2n_Point *Q);
+	/* Make P = Q */
+
+int e2n_point_zero(E2n_Curve *E, E2n_Point *P);
+	/* Make P = infinity */
+
+int e2n_point_inv(E2n_Curve *E, E2n_Point *Q, E2n_Point *P);
+	/* Point Inversion */
+
+int e2n_point_add(E2n_Curve *E, E2n_Point *R, E2n_Point *P, E2n_Point *Q);
+	/* Point Addition */
+
+int e2n_point_sub(E2n_Curve *E, E2n_Point *R, E2n_Point *P, E2n_Point *Q);
+	/* Point Subtraction */
+	
+int e2n_point_double(E2n_Curve *E, E2n_Point* Q, E2n_Point *P);
+	/* Point Doubling */
+	
+int e2n_point_mul(E2n_Curve *E, E2n_Point *Q, E2n_Point *P, DIGIT_T *k, UINT klen);
+	/* Point Multiplication */
+
+int e2n_point_mulw(E2n_Curve *E, E2n_Point *Q, E2n_Point *P, DIGIT_T *k, UINT klen);
+	/* Point Multiplication Using Sliding Window Method */
+	
+int e2n_point_gen(E2n_Curve *E, E2n_Point *P);
+	/* Random Point Generation */
+
+int e2n_point_order(E2n_Curve *E, E2n_Point *P, DIGIT_T *k);
+	/* Compute order of P - todo */
+
+int e2n_curve_gen(E2n_Curve *E);
+	/* Verifiable Pseudorandom Elliptic Curve Generation - todo */
+
+/* Utility Function */
+int e2n_is_on_curve(E2n_Curve *E, E2n_Point *P);
+	/* Return 1 if P lies on E, otherwise return 0 */
+	
+int e2n_load_curve(char *fname, E2n_Curve *E);
+	/* Load Elliptic Curve Domain Parameters From File */
+
+int e2n_save_curve(char *fname, E2n_Curve *E);
+	/* Save Elliptic Curve Domain Parameters To File */
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/src/libm/elliptic-ffp.c b/src/libm/elliptic-ffp.c
new file mode 100644
index 000000000000..fd7fbcc8806d
--- /dev/null
+++ b/src/libm/elliptic-ffp.c
@@ -0,0 +1,1403 @@
+/*-----------------------------------------------------------*/
+/* Elliptic Curve Over Prime Field Implementation            */
+/* Built-in ElGamal Encryption and ECDSA 		     */	
+/* Author: Dang Nguyen Duc                                   */
+/* Date  : 2007/02/03                                        */
+/* Ref	 : IEEE P1363 Public Key Cryptography Specifications */
+/*         Blake, Serousi and Smart - "EC Cryptography"      */
+/*         IBCS#1 ver 2.002 by Xavier Boyen                  */
+/*-----------------------------------------------------------*/
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <assert.h>
+#include "mcrypto.h"
+#include "elliptic-ffp.h"
+#include "bigdigits.h"
+#include "galois.h"
+#include "sha1.h"
+
+Ep_Point* ep_point_init(Ep_Curve *E)
+{
+	Ep_Point *P = NULL;
+	
+	P = (Ep_Point *)malloc(sizeof(Ep_Point));
+	
+	if(P != NULL) {
+		P->x = (DIGIT_T*)malloc(NBYTE(E->len));
+		P->y = (DIGIT_T*)malloc(NBYTE(E->len));
+	}
+	
+	return P;
+}
+
+int ep_point_member_init(Ep_Curve*E, Ep_Point *P)
+{
+	P->x = mpMalloc(E->len);
+	P->y = mpMalloc(E->len);
+
+	return 0;
+}
+
+void ep_point_free(Ep_Point *P)
+{
+	/* free memory allocaeted for Ep_Point struct including its members */
+	mpFree(P->x);
+	mpFree(P->y);
+	free(P);
+}
+
+void ep_point_member_free(Ep_Point *P)
+{
+	/* free memory allocate for Ep_Point's members only */
+	mpFree(P->x);
+	mpFree(P->y);
+}
+
+Ep_Projective_Point *ep_projective_point_init(Ep_Curve *E)
+{
+	Ep_Projective_Point *P = NULL;
+	
+	P = (Ep_Projective_Point *)malloc(sizeof(Ep_Projective_Point));
+
+	if(P != NULL) {
+		P->X = (DIGIT_T *)malloc(NBYTE(E->len));
+		P->Y = (DIGIT_T *)malloc(NBYTE(E->len));
+		P->Z = (DIGIT_T *)malloc(NBYTE(E->len));
+	}
+
+	return P;
+}
+
+int ep_projective_point_member_init(Ep_Curve*E, Ep_Projective_Point *P)
+{
+	P->X = mpMalloc(E->len);
+	P->Y = mpMalloc(E->len);
+	P->Z = mpMalloc(E->len);
+
+	return 0;
+}
+
+void ep_projective_point_free(Ep_Projective_Point *P)
+{
+	/* free memory allocaeted for Ep_Point struct including its members */
+	mpFree(P->X);
+	mpFree(P->Y);
+	mpFree(P->Z);
+	free(P);
+}
+
+void ep_projective_point_member_free(Ep_Projective_Point *P)
+{
+	/* free memory allocate for Ep_Point's members only */
+	mpFree(P->X);
+	mpFree(P->Y);
+	mpFree(P->Z);
+}
+
+int ep_affine_to_projective(Ep_Curve *E, Ep_Projective_Point *P, Ep_Point *Q)
+{
+	/* first check if Q is inf point, then P is inf point too */
+	if(mpIsZero(Q->x, E->len))
+		return ep_projective_point_zero(E, P);
+	
+	/* How to determine Z ? Z = 1 */
+	mpSetEqual(P->X, Q->x, E->len);
+	mpSetEqual(P->Y, Q->y, E->len);
+	mpSetDigit(P->Z, 1, E->len);
+
+	return 0;
+}
+
+int ep_projective_to_affine(Ep_Curve *E, Ep_Point *P, Ep_Projective_Point *Q)
+{
+	DIGIT_T *t1;
+	DIGIT_T	*t2;
+	
+	/* first check if Q is inf point, then P is inf point too */
+	if(mpIsZero(Q->Z, E->len) || mpIsZero(Q->Y, E->len))
+		return ep_point_zero(E, P);
+	
+	/* x_p = X_q / (Z_q)^2 and y_p = Y_q / (Z_q)^3 */
+	t1 = mpMalloc(E->len);
+	t2 = mpMalloc(E->len);
+
+	mpModSquare(t1, Q->Z, E->p, E->len);		/* t1 = (Z_Q)^2 */
+	mpModInv(t2, t1, E->p, E->len);			/* t2 = 1/t1 */
+	mpModMult(P->x, Q->X, t2, E->p, E->len);	/* x_p = t2*X_Q */
+	
+	mpModMult(t2, t1, Q->Z, E->p, E->len);		/* t2 = t1*Z_Q */
+	mpModInv(t1, t2, E->p, E->len);			/* t1 = 1/t2 */
+	mpModMult(P->y, Q->Y, t1, E->p, E->len);	/* y_p = t1*Y_Q */
+
+	mpFree(t1);
+	mpFree(t2);
+
+	return 0;
+}
+
+int ep_point_copy(Ep_Curve *E, Ep_Point *P, Ep_Point *Q)
+{
+	/* Make P = Q */
+	mpSetEqual(P->x, Q->x, E->len);
+	mpSetEqual(P->y, Q->y, E->len);
+	
+	return 0;
+}
+
+int ep_projective_point_copy(Ep_Curve *E, Ep_Projective_Point *P, Ep_Projective_Point *Q)
+{
+	/* Make P = Q in projective coordinate */
+	mpSetEqual(P->X, Q->X, E->len);
+	mpSetEqual(P->Y, Q->Y, E->len);
+	mpSetEqual(P->Z, Q->Z, E->len);
+
+	return 0;
+}
+
+int ep_point_zero(Ep_Curve *E, Ep_Point *P)
+{
+	/* Make P = infinity */
+	mpSetZero(P->x, E->len);
+	mpSetZero(P->y, E->len);
+	
+	return 0;
+}
+
+int ep_projective_point_zero(Ep_Curve *E, Ep_Projective_Point *P)
+{
+	/* Make P = infinity in projective coordinate */
+	mpSetZero(P->X, E->len);
+	mpSetDigit(P->Y, 1, E->len);
+	mpSetZero(P->Z, E->len);
+
+	return 0;
+}
+
+int ep_point_is_zero(Ep_Curve *E, Ep_Point *P)
+{
+	return (mpIsZero(P->y, E->len) && mpIsZero(P->x, E->len));
+}
+
+int ep_projective_point_is_zero(Ep_Curve *E, Ep_Projective_Point *P)
+{
+	return mpIsZero(P->Z, E->len);
+}
+
+int ep_point_is_equal(Ep_Curve *E, Ep_Point *P, Ep_Point *Q)
+{
+	return (mpEqual(P->x, Q->x, E->len) && mpEqual(P->y, Q->y, E->len));
+}
+
+int ep_point_is_inverse(Ep_Curve *E, Ep_Point *P, Ep_Point *Q)
+{
+	/* return true if P = -Q */
+	DIGIT_T *t = mpMalloc(E->len);
+	int ret;
+
+	mpSubtract(t, E->p, P->y, E->len);
+
+	ret = (mpEqual(P->x, Q->x, E->len) && mpEqual(t, Q->y, E->len));
+
+	mpFree(t);
+	
+	return ret;
+}
+
+int ep_point_inv(Ep_Curve *E, Ep_Point *Q, Ep_Point *P)
+{
+	/* Xq = Xp */
+	mpSetEqual(Q->x, P->x, E->len); 
+	
+	/* Yq = -Yp = P - Yp */
+	mpSubtract(Q->y, E->p, P->y, E->len); 
+	
+	return 0;
+}
+
+int ep_point_double(Ep_Curve *E, Ep_Point *Q, Ep_Point *P)
+{
+	DIGIT_T *lamda = NULL;
+	DIGIT_T *T1 = NULL;
+	DIGIT_T *T2 = NULL;
+	DIGIT_T *T3 = NULL;
+	DIGIT_T *T4 = NULL;
+		
+	if(ep_point_is_zero(E, P))
+		return ep_point_zero(E, Q);
+	
+	assert(Q != P);
+
+	/* Allocate memory */
+	lamda = mpMalloc(E->len);
+	T1 = mpMalloc(E->len);
+	T2 = mpMalloc(E->len);
+	T3 = mpMalloc(E->len);
+	T4 = mpMalloc(E->len);
+		
+	/* lamda = 3Xp^2 + a / 2Yp */
+	mpModSquare(T1, P->x, E->p, E->len);		/* T1 = Xp^2 mod p */
+	mpShortModMult(T2, T1, 3, E->p, E->len); 	/* T2 = 3*T1 mod p */
+	mpModAdd(T1, T2, E->a, E->p, E->len);		/* T1 = T2 + a mod p */
+	mpModAdd(T2, P->y, P->y, E->p, E->len);		/* T2 = 2*Yp mod p */
+	mpModInv(T3, T2, E->p, E->len);			/* T3 = T2^-1 mod p */
+	mpModMult(lamda, T1, T3, E->p, E->len);		/* lamda = T1*T2 mod p */
+		
+	/* Xq = lamda^2 - 2Xp */
+	mpModSquare(T1, lamda, E->p, E->len);		/* T1 = lamda^2 mod p */
+	mpModAdd(T2, P->x, P->x, E->p, E->len);		/* T2 = 2*Xp mod p */
+	mpModSubtract(Q->x, T1, T2, E->p, E->len);	/* Xq = T1 - T2 mod p */
+		
+	/* Yq = (Xp - Xq)*lamda - Yp */
+	mpModSubtract(T1, P->x, Q->x, E->p, E->len);	/* T1 = Xp - Xq mod p */
+	mpModMult(T2, lamda, T1, E->p, E->len);		/* T2 = lamda*T1 mod p */
+	mpModSubtract(Q->y, T2, P->y, E->p, E->len);	/* Yq = T2 - Yp mod p */
+	
+	/* Free used memory */
+	mpFree(lamda);
+	mpFree(T1);
+	mpFree(T2);
+	mpFree(T3);
+	
+	return 0;
+}
+
+int ep_projective_point_double(Ep_Curve *E, Ep_Projective_Point* Q, Ep_Projective_Point *P)
+{
+	DIGIT_T *t1 = NULL;
+	DIGIT_T *t2 = NULL;
+	DIGIT_T *t3 = NULL;
+	DIGIT_T *lamda_1 = NULL;
+	DIGIT_T *lamda_2 = NULL;	
+	DIGIT_T *lamda_3 = NULL;
+
+	/* check if P is inf point */
+	if(ep_projective_point_is_zero(E, P))
+		return ep_projective_point_zero(E, Q);
+	
+	assert(Q != P);
+
+	/* ref: Blake, Serousi and Smart's book at page 60 */
+	t1 = mpMalloc(E->len);
+	t2 = mpMalloc(E->len);
+	t3 = mpMalloc(E->len);
+	lamda_1 = mpMalloc(E->len);
+	lamda_2 = mpMalloc(E->len);
+	lamda_3 = mpMalloc(E->len);
+	
+	/* Z_Q = 2*Y_P*Z_P */
+	mpModMult(t1, P->Y, P->Z, E->p, E->len);	/* t1 = (Y_P)*(Z_P) */
+	mpShortModMult(Q->Z, t1, 2, E->p, E->len);	/* Z_Q = 2*t1 */
+	
+	/* lamda_1 = 3*(X_P)^2 + a*(Z_P)^4 */
+	mpModSquare(t1, P->X, E->p, E->len);		/* t1 = (X_P)^2 */
+	mpShortModMult(t2, t1, 3, E->p, E->len);	/* t2 = 3*t1 */
+	mpModSquare(t1, P->Z, E->p, E->len);		/* t1 = (Z_P)^2 */
+	mpModSquare(t3, t1, E->p, E->len);		/* t3 = (t1)^2 */
+	mpModMult(t1, t3, E->a, E->p, E->len);		/* t1 = a*t3 */
+	mpModAdd(lamda_1, t1, t2, E->p, E->len);	/* lamda_1 = t1 + t2 */
+
+	/* lamda_2 = 4*X_P*(Y_P)^2 */
+	mpModSquare(t1, P->Y, E->p, E->len);		/* t1 = (Y_P)^2 */
+	mpModMult(t2, t1, P->X, E->p, E->len);		/* t2 = t1*X_P */
+	mpShortModMult(lamda_2, t2, 4, E->p, E->len);	/* lamda_2 = 4*t2 */
+
+	/* X_Q = (lamda_1)^2 - 2*lamda_2 */
+	mpModSquare(t3, lamda_1, E->p, E->len);		/* t3 = (lamda_1)^2 */
+	mpShortModMult(t2, lamda_2, 2, E->p, E->len);	/* t2 = 2*lamda_2 */
+	mpModSubtract(Q->X, t3, t2, E->p, E->len);	/* X_Q = t3 - t2 */
+
+	/* lamda_3 = 8*(Y_P)^4 */
+	mpModSquare(t2, t1, E->p, E->len);		/* t2 = (t1)^2 */
+	mpShortModMult(lamda_3, t2, 8, E->p, E->len);	/* lamda_3 = 8*t2 */
+
+	/* Y_Q = lamda_1*(lamda_2 - X_Q) - lamda_3 */
+	mpModSubtract(t1, lamda_2, Q->X, E->p, E->len);	/* t1 = lamda_2 - X_P */
+	mpModMult(t2, lamda_1, t1, E->p, E->len);	/* t2 = t1*lamda_1 */
+	mpModSubtract(Q->Y, t2, lamda_3, E->p, E->len);	/* done :) */
+	
+	/* free memory */
+	mpFree(t1);
+	mpFree(t2);
+	mpFree(t3);
+	mpFree(lamda_1);
+	mpFree(lamda_2);
+	mpFree(lamda_3);
+	
+	return 0;
+}
+
+int ep_point_add(Ep_Curve *E, Ep_Point *R, Ep_Point *Q, Ep_Point *P)
+{
+	DIGIT_T *lamda = NULL;
+	DIGIT_T *T1 = NULL;
+	DIGIT_T *T2 = NULL;
+	DIGIT_T *T3 = NULL;
+	
+	/* Check that whether P = O */
+	if(ep_point_is_zero(E, P))
+		return ep_point_copy(E, R, Q);
+	
+	/* Check that whether Q = O */
+	if(ep_point_is_zero(E, Q))
+		return ep_point_copy(E, R, P);
+	
+	/* Check whether P = -Q */
+	if(ep_point_is_inverse(E, P, Q))
+		return ep_point_zero(E, R);
+	
+	/* Check whether P = Q */
+	if(ep_point_is_equal(E, P, Q))
+		return ep_point_double(E, R, P);
+	
+	assert(R != Q && R != P);
+
+	/* Allocate Memory */
+	lamda = mpMalloc(E->len);
+	T1 = mpMalloc(E->len);
+	T2 = mpMalloc(E->len);
+	T3 = mpMalloc(E->len);
+	
+	/* lamda = (Yp - Yq) / (Xp - Xq) */
+	mpModSubtract(T1, P->x, Q->x, E->p, E->len);	/* T1 = Xp - Xq mod p */
+	mpModSubtract(T2, P->y, Q->y, E->p, E->len);	/* T2 = Yp - Yq mod p */
+	mpModInv(T3, T1, E->p, E->len);			/* T3 = T1^-1 mod p */
+	mpModMult(lamda, T2, T3, E->p, E->len);		/* lamda = T2*T3 mod p */
+	
+	/* Xr = lamda^2 - Xp - Xq */
+	mpModMult(T1, lamda, lamda, E->p, E->len);	/* T1 = lamda^2 mod p */
+	mpModAdd(T2, P->x, Q->x, E->p, E->len);		/* T2 = Xp + Xq mod p */
+	mpModSubtract(R->x, T1, T2, E->p, E->len);	/* Xr = T1 - T2 mod p */
+	
+	/* Yr = (Xp - Xr)*lamda - Yq */
+	mpModSubtract(T1, P->x, R->x, E->p, E->len);	/* T1 = Xp - Xr mod p */
+	mpModMult(T2, T1, lamda, E->p, E->len);		/* T2 = T1*lamda mod p */
+	mpModSubtract(R->y, T2, P->y, E->p, E->len);	/* Yr = T2 - Yp mod p */
+	
+	/* Free used memory */
+	mpFree(lamda);
+	mpFree(T1);
+	mpFree(T2);
+	mpFree(T3);
+	
+	return 0;
+}
+	
+int ep_projective_point_add(Ep_Curve *E, Ep_Projective_Point* R, \
+		                         Ep_Projective_Point *Q, \
+					 Ep_Projective_Point *P)
+{
+	DIGIT_T *lamda_1;	
+	DIGIT_T *lamda_2;
+	DIGIT_T *lamda_3;
+	DIGIT_T *lamda_4;
+	DIGIT_T *lamda_5;
+	DIGIT_T *lamda_6;
+	DIGIT_T *lamda_7;
+	DIGIT_T *lamda_8;
+	DIGIT_T *lamda_9;
+	
+	DIGIT_T *t1;
+	DIGIT_T *t2;
+	DIGIT_T *t3;		
+
+	/* first check if either P or Q is inf point */
+	if(mpIsZero(Q->Z, E->len))
+		return ep_projective_point_copy(E, R, P);
+	if(mpIsZero(P->Z, E->len))
+		return ep_projective_point_copy(E, R, Q);
+	
+	assert(R != Q && R != P);
+
+	/* do add and check if P = -Q along the way */	
+	/* ref: Blake, Serousi and Smart's "ECC" book, page 59 */
+	t1 = mpMalloc(E->len);
+	t2 = mpMalloc(E->len);
+	t3 = mpMalloc(E->len);
+	lamda_1 = mpMalloc(E->len);
+	lamda_2 = mpMalloc(E->len);
+	lamda_3 = mpMalloc(E->len);
+	lamda_4 = mpMalloc(E->len);
+	lamda_5 = mpMalloc(E->len);
+	lamda_6 = mpMalloc(E->len);
+	lamda_7 = mpMalloc(E->len);
+	lamda_8 = mpMalloc(E->len);
+	lamda_9 = mpMalloc(E->len);
+	
+	/* lamda_1 = (X_P)*(Z_Q)^2 */
+	mpModSquare(t1, Q->Z, E->p, E->len);		/* t1 = (Z_Q)^2 */
+	mpModMult(lamda_1, P->X, t1, E->p, E->len);	/* lamda_1 = t1*X_P */
+
+	/* lamda_2 = (X_Q)*(Z_P)^2 */
+	mpModSquare(t1, P->Z, E->p, E->len);		/* t1 = (Z_P)^2 */
+	mpModMult(lamda_2, Q->X, t1, E->p, E->len);	/* lamda_2 = t1*X_Q */
+	
+	/* lamda_3 = lamda_1 - lamda_2 */
+	mpModSubtract(lamda_3, lamda_1, lamda_2, E->p, E->len);
+
+	/* lamda_4 = (Y_P)*(Z_Q)^3 */
+	mpModSquare(t1, Q->Z, E->p, E->len);		/* t1 = (Z_Q)^2 */
+	mpModMult(t2, t1, Q->Z, E->p, E->len);		/* t2 = t1*Z_Q */
+	mpModMult(lamda_4, P->Y, t2, E->p, E->len);	/* lamda_4 = t2*Y_P */
+ 	
+	/* lamda_5 = (Y_Q)*(Z_P)^3 */
+	mpModSquare(t1, P->Z, E->p, E->len);		/* t1 = (Z_P)^2 */
+	mpModMult(t2, t1, P->Z, E->p, E->len);		/* t2 = t1*Z_P */
+	mpModMult(lamda_5, Q->Y, t2, E->p, E->len);	/* lamda_4 = t2*Y_Q */
+
+	/* lamda_6 = lamda_4 - lamda_5 */
+	mpModSubtract(lamda_6, lamda_4, lamda_5, E->p, E->len);
+
+	if(mpIsZero(lamda_3, E->len)){
+		if(mpIsZero(lamda_6, E->len))
+			goto p_and_q_are_same;
+		else {
+			ep_projective_point_zero(E, R);
+			goto free_mem_n_bye;
+		}
+	}
+	
+	/* lamda_7 = lamda_1 + lamda_2 */
+	mpModAdd(lamda_7, lamda_1, lamda_2, E->p, E->len);
+
+	/* lamda_8 = lamda_4 + lamda_5 */		
+	mpModAdd(lamda_8, lamda_4, lamda_5, E->p, E->len);
+
+	/* Z_R = (Z_P)*(Z_Q)*lamda_3 */
+	mpModMult(t1, P->Z, Q->Z, E->p, E->len);	/* t1 = (Z_P)*(Z_Q) */
+	mpModMult(R->Z, t1, lamda_3, E->p, E->len);	/* Z_R = t1*lamda_3 */
+
+	/* X_R = (lamda_6)^2 - (lamda_7)*(lamda_3)^2 */
+	mpModSquare(t1, lamda_6, E->p, E->len);		/* t1 = (lamda_6)^2 */
+	mpModSquare(t2, lamda_3, E->p, E->len);		/* t2 = (lamda_3)^2 */
+	mpModMult(t3, lamda_7, t2, E->p, E->len);	/* t3 = t2*lamda_7 */
+	mpModSubtract(R->X, t1, t3, E->p, E->len);	/* X_R = t1 - t3 */
+
+	/* lamda_9 = (lamda_7)*(lamda_3)^2 - 2X_R */
+	mpShortModMult(t1, R->X, 2, E->p, E->len);	/* t1 = 2*X_R */
+	mpModSubtract(lamda_9, t3, t1, E->p, E->len);	/* lamda_9 = t3 - t1 */
+
+	/* Y_R = [((lamda_9)*(lamda_6) - (lamda_8)*(lamda_3)^3)] / 2 */
+	mpModMult(t1, lamda_9, lamda_6, E->p, E->len);	/* t1 = (lamda_9)*(lamda_6) */
+	mpModMult(t3, t2, lamda_3, E->p, E->len);	/* t3 = t2*lamda_3 */
+	mpModMult(t2, lamda_8, t3, E->p, E->len);	/* t2 = lamda_8*t3 */
+	mpModSubtract(t3, t1, t2, E->p, E->len);
+	
+	/* need to compute inverse of 2 mod p, should be precomputed otherwise, no gain */
+	mpSetDigit(t1, 2, E->len);
+	mpModInv(t2, t1, E->p, E->len);			/* t2 = 2^(-1) mod p */
+	mpModMult(R->Y, t3, t2, E->p, E->len);
+
+	goto free_mem_n_bye;
+p_and_q_are_same:
+	ep_projective_point_double(E, R, P);
+
+free_mem_n_bye:
+	mpFree(t1);	
+	mpFree(t2);
+	mpFree(t3);
+	mpFree(lamda_1);
+	mpFree(lamda_2);
+	mpFree(lamda_3);
+	mpFree(lamda_4);
+	mpFree(lamda_5);
+	mpFree(lamda_6);
+	mpFree(lamda_7);
+	mpFree(lamda_8);
+	mpFree(lamda_9);
+
+	return 0;	
+}
+
+int ep_mixed_point_add(Ep_Curve *E, Ep_Projective_Point* R, \
+		                    Ep_Projective_Point *Q, \
+				    Ep_Point *P)
+{
+	/* or ep_projective_point_add with P converted to projective coordinate will do */ 	
+	Ep_Projective_Point *T = NULL;
+
+	T = ep_projective_point_init(E);
+	ep_affine_to_projective(E, T, P);
+	ep_projective_point_add(E, R, Q, T);
+
+	ep_projective_point_free(T);
+
+	return 0;
+}
+int ep_point_sub(Ep_Curve *E, Ep_Point *R, Ep_Point *P, Ep_Point *Q)
+{
+	Ep_Point *T;
+		
+	T = ep_point_init(E);
+	
+	ep_point_inv(E, T, Q);	
+	ep_point_add(E, R, P, T);
+	
+	ep_point_free(T);
+	
+	return 0;
+}
+
+int ep_point_mul(Ep_Curve *E, Ep_Point *Q, Ep_Point *P, DIGIT_T *k, UINT klen)
+{
+	/* scalar multiplication using binary method */
+	DIGIT_T mask;
+	int i;
+	Ep_Point R;
+	
+	assert(Q != P);
+
+	/* Allocate temp memory */
+	ep_point_member_init(E, &R);
+	ep_point_zero(E, &R);
+		
+	/* Set Q = Infinity */
+	ep_point_zero(E, Q);
+
+	while(klen--){
+		mask = HIBITMASK;
+		for(i=BITS_PER_DIGIT-1;i>=0;i--){
+			ep_point_double(E, &R, Q);
+			if(k[klen] & mask){
+				ep_point_add(E, Q, &R, P);
+			}
+			else{
+				mpSetEqual(Q->x, R.x, E->len);
+				mpSetEqual(Q->y, R.y, E->len);
+			}		
+			mask >>= 1;
+		}
+	}
+	
+	ep_point_member_free(&R);
+
+	return 0;
+}
+
+int ep_projective_point_mul(Ep_Curve *E, Ep_Projective_Point* Q, \
+		                         Ep_Projective_Point *P, DIGIT_T *k, UINT klen)
+{
+	return 0;
+}
+
+int ep_point_gen(Ep_Curve *E, Ep_Point *P)
+{
+	DIGIT_T *u = NULL;
+	DIGIT_T *t = NULL;
+	DIGIT_T *Q = NULL;
+	DIGIT_T *V = NULL;
+	DIGIT_T *u1 = NULL;
+	UINT S;
+	
+	/* allocate temporary memory */
+	u = mpMalloc(E->len);
+	t = mpMalloc(E->len);
+	u1 = mpMalloc(E->len);
+	Q = mpMalloc(E->len);
+	V = mpMalloc(E->len);
+	
+	while(1){
+		/* generate x-coordinate at random */
+		mpMakeRandom(u, E->len);
+		mpModulo(P->x, u, E->len, E->p, E->len);
+					
+		/* compute u = Xp^3 + a*Xp + b mod p */
+		mpModSquare(u1, P->x, E->p, E->len);
+		mpModMult(u, u1, P->x, E->p, E->len);		/* u = (X_P)^3 mod p */
+		mpModMult(t, P->x, E->a, E->p, E->len);		/* t = a*X_P mod p */
+		mpModAdd(u1, u, t, E->p, E->len);		/* u1 = u + t mod p */
+		mpModAdd(u, u1, E->b, E->p, E->len);		/* u = u1 + b mod p */
+		
+		/* Compute square root of u */
+		mpModSquareRootPre(&S, Q, V, E->p, E->len);
+		mpModInv(u1, u, E->p, E->len);
+	
+		if(mpModSquareRoot(t, u, E->p, S, Q, V, u1, E->len)==0)
+			break;
+	}
+	
+	if(mpIsZero(t, E->len))	{
+		mpSetZero(P->y, E->len);
+		goto free_n_bye;
+	}
+	
+	/* Generate a random bit to choose y-coordinate */
+	u[0] = spPseudoRand(0, MAX_DIGIT);
+	if(ISEVEN(u[0]))
+		mpSetEqual(P->y, t, E->len);
+	else
+		mpModSubtract(P->y, E->p, t, E->p, E->len);
+			
+	/* free used memory */
+free_n_bye:
+	free(u);
+	free(t);
+	free(Q);
+	free(V);
+	free(u1);
+	
+	return 0;
+}
+
+/* Utility Functions */
+int ep_load_curve(const char *fname, Ep_Curve *E)
+{
+	FILE *f;
+	char s[EP_NPARAM][EP_MAX_LINE_LEN];
+	UINT nread;
+	UINT i;
+	
+	if((f=fopen(fname, "r")) == NULL)
+		return -1;
+	
+	/* reading data */
+	memset(s, 0x00, EP_NPARAM*EP_MAX_LINE_LEN);
+	for(i=0;i<EP_NPARAM;i++){
+		if(feof(f)){
+			fclose(f);
+			return -1;
+		}
+		fgets(s[i], EP_MAX_LINE_LEN, f);
+		
+		/* be careful with dos/win32 newline+linefeed */	
+		s[i][strlen(s[i])-1] = '\0';
+	}
+	fclose(f);
+	
+	/* Collecting data */
+	E->len = (UINT)atoi(s[1]);
+	if((E->p=(DIGIT_T*)mpHex2Bin(s[2], NBYTE(E->len), &nread))==NULL)
+		return -1;
+	if((E->a=(DIGIT_T*)mpHex2Bin(s[3], NBYTE(E->len), &nread))==NULL)
+		return -1;
+	if((E->b=(DIGIT_T*)mpHex2Bin(s[4], NBYTE(E->len), &nread))==NULL)
+		return -1;
+	if((E->G.x=(DIGIT_T*)mpHex2Bin(s[5], NBYTE(E->len), &nread))==NULL)
+		return -1;
+	if((E->G.y=(DIGIT_T*)mpHex2Bin(s[6], NBYTE(E->len), &nread))==NULL)
+		return -1;
+	E->rlen = (UINT)atoi(s[7]);
+	if((E->r=(DIGIT_T*)mpHex2Bin(s[8], NBYTE(E->rlen), &nread))==NULL)
+		return -1;
+	E->h = (DIGIT_T)atoi(s[9]);
+	
+	return 0;
+}
+
+
+int ep_save_curve(const char *fname, Ep_Curve *E)
+{
+	FILE *f;
+	
+	if((f=fopen(fname, "w")) == NULL)
+		return -1;
+	
+	fprintf(f,"------------------------BEGIN ELLIPTIC CURVE PARAMETERS-------------------------\n");
+	fprintf(f,"%d\n", E->len);
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)E->p, NBYTE(E->len)));
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)E->a, NBYTE(E->len)));
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)E->b, NBYTE(E->len)));
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)E->G.x, NBYTE(E->len)));
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)E->G.y, NBYTE(E->len)));
+	fprintf(f,"%d\n", E->rlen);
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)E->r, NBYTE(E->rlen)));
+	fprintf(f,"%lu\n", E->h);
+	fprintf(f,"-----------------------END OF ELLIPTIC CURVE PARAMETERS-------------------------\n");
+	
+	fclose(f);
+	
+	return 0;
+}
+
+int ep_load_point(const char *fname, Ep_Curve *E, Ep_Point *P)
+{
+	FILE *f;
+	char s[4][EP_MAX_LINE_LEN];
+	UINT nread;
+	UINT i;
+	
+	if((f=fopen(fname, "r")) == NULL)
+		return -1;
+	
+	/* reading data */
+	memset(s, 0x00, 4*EP_MAX_LINE_LEN);
+	for(i=0;i<4;i++){
+		if(feof(f)){
+			fclose(f);
+			return -1;
+		}
+		fgets(s[i], EP_MAX_LINE_LEN, f);
+		s[i][strlen(s[i])-1] = '\0';
+	}
+	fclose(f);
+	
+	/* Collecting data */
+	if((P->x=(DIGIT_T*)mpHex2Bin(s[3], NBYTE(E->len), &nread))==NULL)
+		return -1;
+	if((P->y=(DIGIT_T*)mpHex2Bin(s[4], NBYTE(E->len), &nread))==NULL)
+		return -1;
+	
+	return 0;
+}
+
+int ep_save_point(const char *fname, Ep_Curve *E, Ep_Point *P)
+{
+	FILE *f;
+	
+	if((f=fopen(fname, "w")) == NULL)
+		return -1;
+	
+	fprintf(f,"-----------------------BEGIN ELLIPTIC CURVE POINT COORDINATES-------------------------\n");
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)P->x, NBYTE(E->len)));
+	fprintf(f,"%s\n", mpBin2Hex((BYTE *)P->y, NBYTE(E->len)));
+	fprintf(f,"-----------------------END OF ELLIPTIC CURVE POINT COORDINATES------------------------\n");
+	
+	fclose(f);
+	
+	return 0;
+}
+
+int ep_is_on_curve(Ep_Curve *E, Ep_Point *P)
+{
+	/* check whether a point lie on a curve */
+	DIGIT_T *t = NULL;
+	DIGIT_T *r = NULL;
+	DIGIT_T *u = NULL;
+	DIGIT_T *v = NULL;
+	DIGIT_T *w = NULL;
+	int ret = 0;
+		
+	/* Check that whether P = O */
+	if(mpIsZero(P->x, E->len) && mpIsZero(P->y, E->len))
+		return 1;
+	
+	
+	t = mpMalloc(E->len);
+	r = mpMalloc(E->len);
+	u = mpMalloc(E->len);
+	v = mpMalloc(E->len);
+	w = mpMalloc(E->len);
+	
+	mpModSquare(t, P->x, E->p, E->len);
+	mpModMult(u, t, P->x, E->p, E->len);	/* u = x^3 mod p */
+	
+	mpModSquare(v, P->y, E->p, E->len);	/* v = y^2 mod p */
+	
+	mpModMult(t, P->x, E->a, E->p, E->len);	/* t = a*x mod p */
+	
+	mpModAdd(r, t, E->b, E->p, E->len);	/* r = t + b mod p */
+	
+	mpModAdd(w, u, r, E->p, E->len);	/* w = u + r mod p */
+	
+	if(mpCompare(v, w, E->len)==0)
+		ret = 1;
+	
+	mpFree(t);
+	mpFree(r);
+	mpFree(u);
+	mpFree(v);
+	mpFree(w);
+	
+	return ret;
+}
+
+Ep_Curve *ep_curve_init(DIGIT_T *p, UINT plen, DIGIT_T *a, DIGIT_T *b, DIGIT_T *r, UINT rlen, Ep_Point *G)
+{
+	/* allocate memory for Ep_Curve struct including its members */
+	/* curve is : y^2 = x^3 + ax + b (mod p) with G is generator */
+	Ep_Curve *E;
+	
+	if((E = (Ep_Curve *)malloc(sizeof(Ep_Curve))) == NULL)
+		return NULL;
+	E->len = plen;
+	E->rlen = rlen;
+	
+	if((E->p = mpMalloc(plen)) == NULL){
+		free(E);
+		return NULL;
+	}
+	
+	if((E->a = mpMalloc(plen)) == NULL){
+		free(E);
+		free(p);
+		return NULL;
+	}
+	
+	if((E->b = mpMalloc(plen)) == NULL){
+		free(E);
+		free(p);
+		free(a);
+		return NULL;
+	}
+
+	if((E->r = mpMalloc(rlen)) == NULL){
+		free(E);
+		free(p);
+		free(a);
+		free(b);
+		return NULL;
+	}
+
+	if(ep_point_member_init(E, &E->G) !=0 ){
+		free(E);
+		free(p);
+		free(a);
+		free(b);
+		free(r);
+		return NULL;
+	}
+	
+	mpSetEqual(E->p, p, plen);
+	mpSetEqual(E->a, a, plen);
+	mpSetEqual(E->b, b, plen);
+	mpSetEqual(E->r, r, rlen);
+	ep_point_copy(E, &E->G, G);
+
+	return E;
+}
+
+void ep_curve_free(Ep_Curve *E)
+{
+	/* free memory allocated to Ep_Curve struct including its members */
+	mpFree(E->p);
+	mpFree(E->a);
+	mpFree(E->b);
+	mpFree(E->r);
+	ep_point_member_free(&E->G);
+	free(E);
+}
+
+Ep_Curve *ep_curve_init2(void)
+{
+	/* allocate memory for Ep_Curve struct only */
+	return (Ep_Curve *)malloc(sizeof(Ep_Curve));
+}
+
+void ep_curve_member_free(Ep_Curve *E)
+{
+	/* free memory allocated to Ep_Curve's members only */
+	mpFree(E->p);
+	mpFree(E->a);
+	mpFree(E->b);
+	mpFree(E->r);
+	ep_point_free(&E->G);
+}
+
+int ep_type1_curve_gen(Ep_Curve *E, UINT n)
+{
+	/* the following code follows IBCS#1 version 2.002 by Xavier Boyen */
+	UINT plen = n/2, qlen = n/32 + 128;
+	
+	DIGIT_T *p = NULL;
+	DIGIT_T *q = NULL;
+	DIGIT_T *r = NULL;
+	UINT rlen, rdlen;
+	DIGIT_T *t = NULL;
+	DIGIT_T *t1 = NULL;
+	UINT i; 
+	DIGIT_T mask;
+	Ep_Point *P = NULL;
+	UINT ret;
+	
+	/* digit length of prime p */
+	E->len = NDIGIT(plen);
+
+	/* generate qlen-bit Solinas prime q */
+	q = mpMalloc(E->len);	
+	if((ret=mpSolinasPrime(q, E->len, qlen)) == 0){
+		/* failed to find Solinas prime */
+		free(q);
+		return 0;
+	}
+	
+	/* curve is y^2 = x^3 + 1 : a = 0 and b = 1 */	
+	E->a = mpMalloc(E->len);
+	mpSetZero(E->a, E->len);	
+	E->b = mpMalloc(E->len);
+	mpSetDigit(E->b, 1, E->len); 
+	
+	/* E->r now stores order q of subgroup of E/F_p */	
+	E->rlen = NDIGIT(qlen); 
+	E->r = q;	
+	E->h = ret;	
+	
+	/* generate p = 12rq - 1, where r is randomly chosen => make p mod 12 = 11 */
+	p = mpMalloc(E->len);
+	t = mpMalloc(E->len);
+	t1 = mpMalloc(E->len);
+	r = mpMalloc(E->len);	
+	
+	/* use same notation as in ibcs#1 v2.002, dont confuse with E->r and E->rlen */
+	rlen = plen - qlen - 4;
+	
+	/* 12 takes 4 bit, so rlen = plen - qlen - 4, then convert to # of digits */
+	rdlen = (rlen % BITS_PER_DIGIT) ? (rlen / BITS_PER_DIGIT) + 1 : (rlen / BITS_PER_DIGIT);
+
+try_other_r:
+	mpSetZero(r, E->len);
+	mpMakeRandom(r, rdlen);
+	
+	/* now make r actually only rlen-bit */
+	for(i = 0, mask = 0x00; i<(rlen % BITS_PER_DIGIT); i++, mask = (mask << 1) | 0x00000001);
+	r[rdlen-1] &= mask ? mask : MAX_DIGIT;
+	
+	mpShortMult(t1, r, 12, E->len);	/* t1 = 12r */	
+	mpMultiply(t, q, t1, E->len);   /* t2 = 12rq = t1*q */ 		
+	mpShortSub(p, t, 1, E->len);    /* p = 12rq - 1 = t2 - 1*/
+	
+	/* test if p is a prime number using Miller-Rabin test, if not try different r */
+	if(!mpIsPrime(p, E->len, N_TEST_PRIME))
+		goto try_other_r;
+	
+	E->p = p;
+
+	/* compute base point of order q, G = [12r]P where P is randomly chosen */
+	ep_point_member_init(E, &E->G);
+	P = ep_point_init(E);
+	ep_point_gen(E, P);
+
+	ep_point_mul(E, &E->G, P, t1, E->len);
+	
+	/* free memory */
+	ep_point_free(P);
+	mpFree(t);
+	mpFree(t1);
+	mpFree(r);
+
+	return ret;
+}
+
+int ep_type1_curve_validate(Ep_Curve *E)
+{
+	DIGIT_T eleven;	
+	DIGIT_T *t1 = NULL;
+	DIGIT_T *t2 = NULL;
+	Ep_Point *P;
+	int ret;
+		
+	/* first check if p and r are prime */	
+	if(!mpIsPrime(E->p, E->len, N_TEST_PRIME)){
+		mcrypto_msg("p is not prime\n");
+		return 0;
+	}
+
+	if(!mpIsPrime(E->r, E->rlen, N_TEST_PRIME)){
+		mcrypto_msg("q is not prime\n");
+		return 0; 
+	}
+ 
+	/* check if p mod 12 = 11? */	
+	if((eleven = mpShortMod(E->p, 12, E->len)) != 11){
+		mcrypto_msg("p mod 12 is not 11\n");		
+		return 0;
+	}
+		
+	/* check if G lies on curve */
+	if(!ep_is_on_curve(E, &E->G)){
+		mcrypto_msg("G is not on curve\n");
+		return 0;
+	}
+
+	/* check if r | p+1 */
+	t1 = mpMalloc(E->len);
+	t2 = mpMalloc(E->rlen);
+	mpShortAdd(t1, E->p, 1, E->len);
+	mpModulo(t2, t1, E->len, E->r, E->rlen);
+	if(!mpIsZero(t2, E->rlen)){
+		mpFree(t1);
+		mpFree(t2);
+		mcrypto_msg("r does not divide p+1\n");
+		return 0;
+	}
+	
+	/* check if (r+1)G = G */
+	P = ep_point_init(E);
+	mpShortAdd(t1, E->r, 1, E->rlen);
+	ep_point_mul(E, P, &E->G, t1, E->rlen);
+	ret = mpEqual(P->x, E->G.x, E->rlen) && mpEqual(P->y, E->G.y, E->rlen);
+		
+	mpFree(t1);
+	mpFree(t2);		
+	ep_point_free(P);
+	
+	return ret;
+}
+
+int ep_eval_vertical1(Ep_Curve *E, GF_ELE r, Ep_Point *A, Ep2_Point *B)
+{
+	/* evaluate the divisor of the vertical line which goes through A at B */
+	/* always assume that r is two-digit, r_1|r_0 ~ r(x) = r_1*x+r_0 */
+	
+	/* r = x_B - x_A */	
+	mpSetEqual(r[1], B->x[1], E->len);
+	mpModSubtract(r[0], B->x[0], A->x, E->p, E->len); 
+
+	return 0;
+}
+
+int ep_eval_vertical2(Ep_Curve *E, GF_ELE r, Ep_Projective_Point *A, Ep2_Point *B)
+{
+	Ep_Point *T = ep_point_init(E);
+	
+	ep_projective_to_affine(E, T, A);
+	ep_eval_vertical1(E, r, T, B);
+
+	ep_point_free(T);
+
+	return 0;
+}
+
+int ep_eval_tangent1(Ep_Curve *E, GF_ELE r, Ep_Point *A, Ep2_Point *B)
+{
+	/* evaluate the divisor of the tangent line to A, at B */	
+	/* always assume that r is two-digit, r_1|r_0 ~ r(x) = r_1*x+r_0 */	
+	DIGIT_T *a = NULL;
+	DIGIT_T *b = NULL;		
+	DIGIT_T *c = NULL;	
+	DIGIT_T *t1 = NULL;	
+	DIGIT_T *t2 = NULL;	
+	DIGIT_T *t3 = NULL;
+
+	/* evaluate the divisor of the tangent line to A, at B */
+	if(ep_point_is_zero(E, A)){
+		/* r(x) = 1 */
+		mpSetZero(r[1], E->len);
+		mpSetDigit(r[0], 1, E->len);
+		return 0;
+	}
+	
+	if(mpIsZero(A->y, E->len))
+		return ep_eval_vertical1(E, r, A, B);
+
+	a = mpMalloc(E->len);
+	b = mpMalloc(E->len);
+	c = mpMalloc(E->len);
+	t1 = mpMalloc(E->len);
+	t2 = mpMalloc(E->len);
+	t3 = mpMalloc(E->len);
+
+	mpModSquare(t1, A->x, E->p, E->len);	/* t1 = (x_A)^2 */
+	mpShortSub(t2, E->p, 3, E->len);	/* t2 = -3 */
+	mpModMult(a, t1, t2, E->p, E->len);	/* a = t1*t2 */
+
+	mpShortModMult(b, A->y, 2, E->p, E->len);	/* b = 2*y_A */
+	
+	mpSubtract(t1, E->p, b, E->len);	/* t1 = -b */	
+	mpModMult(t2, t1, A->y, E->p, E->len);	/* t2 = t1*y_A */
+
+	mpSubtract(t1, E->p, a, E->len);	/* t1 = -a */
+	mpModMult(t3, t1, A->x, E->p, E->len);	/* t3 = t1*x_A */
+	
+	mpModAdd(c, t2, t3, E->p, E->len);	/* c = t2+t3 */
+
+	/* compute r = a*x_B + b*y_B + c */
+	mpModMult(t1, a, B->x[1], E->p, E->len);
+	mpModMult(t2, b, B->y[1], E->p, E->len);
+	mpModAdd(r[1], t1, t2, E->p, E->len);
+
+	mpModMult(t1, a, B->x[0], E->p, E->len);
+	mpModMult(t2, b, B->y[0], E->p, E->len);
+	mpModAdd(t3, t1, t2, E->p, E->len);
+	mpModAdd(r[0], t3, c, E->p, E->len);
+
+	/* free memory */
+	mpFree(t1);
+	mpFree(t2);
+	mpFree(t3);
+	mpFree(a);
+	mpFree(b);
+	mpFree(c);
+	
+	return 0;
+}
+
+int ep_eval_tangent2(Ep_Curve *E, GF_ELE r, Ep_Projective_Point *A, Ep2_Point *B)
+{
+	Ep_Point *T = ep_point_init(E);
+	
+	ep_projective_to_affine(E, T, A);
+	ep_eval_tangent1(E, r, T, B);
+
+	ep_point_free(T);
+
+	return 0;
+}
+
+int ep_eval_line(Ep_Curve *E, GF_ELE r, Ep_Point *A1, Ep_Point *A2, Ep2_Point *B)
+{
+	/* evaluate the divisor of the line goes through A1-A2, at B */
+	/* this is another helper function for computing Tate's pairing */
+	/* always assume that r is two-digit, r_1|r_0 ~ r(x) = r_1*x+r_0 */
+	DIGIT_T *a = NULL;
+	DIGIT_T *b = NULL;		
+	DIGIT_T *c = NULL;	
+	DIGIT_T *t1 = NULL;	
+	DIGIT_T *t2 = NULL;	
+	DIGIT_T *t3 = NULL;
+	
+	/* check special cases */	
+	if(ep_point_is_zero(E, A1))
+		return ep_eval_vertical1(E, r, A2, B);
+		
+	if(ep_point_is_zero(E, A2))
+		return ep_eval_vertical1(E, r, A1, B);
+
+	if(ep_point_is_inverse(E, A1, A2))
+		return ep_eval_vertical1(E, r, A1, B);
+
+	if(ep_point_is_equal(E, A1, A2))
+		return ep_eval_tangent1(E, r, A1, B);
+	
+	a = mpMalloc(E->len);
+	b = mpMalloc(E->len);
+	c = mpMalloc(E->len);
+	t1 = mpMalloc(E->len);
+	t2 = mpMalloc(E->len);
+	t3 = mpMalloc(E->len);
+
+	mpModSubtract(a, A1->y, A2->y, E->p, E->len);	/* a = y_A1 - y_A2 */
+
+	mpModSubtract(b, A2->x, A1->x, E->p, E->len);	/* b = x_A2 - x_A1 */
+
+	mpSubtract(t1, E->p, b, E->len);	/* t1 = -b */	
+	mpModMult(t2, t1, A1->y, E->p, E->len);	/* t2 = t1*y_A1 */	
+	mpSubtract(t1, E->p, a, E->len);	/* t1 = -a */
+	mpModMult(t3, t1, A1->x, E->p, E->len);	/* t3 = t1*x_A1 */
+	
+	mpModAdd(c, t2, t3, E->p, E->len);	/* c = t2+t3 */
+
+	/* compute r = a*x_B + b*y_B + c */
+	mpModMult(t1, a, B->x[1], E->p, E->len);
+	mpModMult(t2, b, B->y[1], E->p, E->len);
+	mpModAdd(r[1], t1, t2, E->p, E->len);
+
+	mpModMult(t1, a, B->x[0], E->p, E->len);
+	mpModMult(t2, b, B->y[0], E->p, E->len);
+	mpModAdd(t3, t1, t2, E->p, E->len);
+	mpModAdd(r[0], t3, c, E->p, E->len);
+
+	/* free memory */
+	mpFree(t1);
+	mpFree(t2);
+	mpFree(t3);
+	mpFree(a);
+	mpFree(b);
+	mpFree(c);
+
+	return 0;
+}
+
+int tate_pairing_init(Tate_Pairing_Info *tate, UINT n)
+{
+	if((tate->E = (Ep_Curve *)malloc(sizeof(Ep_Curve))) == NULL)
+		return -1;
+
+	if(ep_type1_curve_gen(tate->E, n) == 0){
+		free(tate->E);
+		return -1;
+	} 
+	
+	tate->a = n/32 + 127;
+	tate->b = tate->E->h;
+	
+	/* compute final exponentiation exponent eta */
+	tate->eta_len = 2*tate->E->len - tate->E->rlen;
+	if((tate->eta = mpMalloc(tate->eta_len)) == NULL){
+		ep_curve_free(tate->E);
+		return -1;
+	}
+
+	DIGIT_T *t1 = mpMalloc(2*tate->E->len);
+	DIGIT_T *t2 = mpMalloc(2*tate->E->len);
+	mpSquare(t1, tate->E->p, tate->E->len);		/* t1 = p^2 */
+	mpShortSub(t2, t1, 1, tate->E->len);		/* t2 = t1- 1 */
+	mpDivide(t1, tate->eta, t2, 2*tate->E->len, tate->E->r, tate->E->rlen);		/* eta = t2 / q */
+	mpFree(t1);
+	mpFree(t2);
+	
+	if((tate->gfp2 = gf_init(2, tate->E->p, tate->E->len)) == NULL){
+		ep_curve_free(tate->E);
+		return -1;
+	}
+	
+	/* n(x) = x^2 + 1 */
+	mpSetDigit(tate->gfp2->n[0], 1, tate->gfp2->plen);
+	mpSetDigit(tate->gfp2->n[1], 0, tate->gfp2->plen);
+	mpSetDigit(tate->gfp2->n[2], 1, tate->gfp2->plen);
+
+	return 0;
+}
+
+int tate_pairing_init2(Tate_Pairing_Info *tate, const char *curve_fname)
+{
+	Ep_Curve *E;
+
+	if((E = ep_curve_init2()) == NULL)
+		return -1;
+
+	if(ep_load_curve(curve_fname, E) == -1){
+		free(E);
+		return -1;
+	}
+	
+	/* verify that E is type-1 curve intended for Tate pairing computation in IBCS#1 by Xavier Boyen */
+	if(!ep_type1_curve_validate(E)){
+		ep_curve_free(E);
+		return -1;
+	}
+
+	tate->E = E;
+
+	/* rediscover a and b */
+	tate->a = mpBitLength(E->r, E->rlen) - 1;
+	tate->b = E->h;
+
+	tate->eta_len = 2*tate->E->len - tate->E->rlen;
+	if((tate->eta = mpMalloc(tate->eta_len)) == NULL){
+		ep_curve_free(tate->E);
+		return -1;
+	}
+
+	DIGIT_T *t1 = mpMalloc(2*tate->E->len);
+	DIGIT_T *t2 = mpMalloc(2*tate->E->len);
+	mpSquare(t1, tate->E->p, tate->E->len);		/* t1 = p^2 */
+	mpShortSub(t2, t1, 1, tate->E->len);		/* t2 = t1- 1 */
+	mpDivide(t1, tate->eta, t2, 2*tate->E->len, tate->E->r, tate->E->rlen);		/* eta = t2 / q */
+	mpFree(t1);
+	mpFree(t2);
+
+	if((tate->gfp2 = gf_init(2, tate->E->p, tate->E->len)) == NULL){
+		ep_curve_free(tate->E);
+		return -1;
+	}
+	
+	/* n(x) = x^2 + 1 */
+	mpSetDigit(tate->gfp2->n[0], 1, tate->gfp2->plen);
+	mpSetDigit(tate->gfp2->n[1], 0, tate->gfp2->plen);
+	mpSetDigit(tate->gfp2->n[2], 1, tate->gfp2->plen);
+
+	return 0;
+}
+
+int tate_pairing_eval(Tate_Pairing_Info *tate, GF_ELE res, Ep_Point *A, Ep2_Point *B)
+{
+	/* compute tate's pairing, ref: IBCS#1 ver. 2.002 by Xavier Boyen */ 
+	GF_ELE v_num; 
+	GF_ELE v_den;
+	GF_ELE t_num;
+	GF_ELE t_den;
+	Ep_Projective_Point *V;
+	Ep_Point *V_a;
+	Ep_Point *V_b;
+
+	register int n;
+
+	GF_ELE temp;
+	Ep_Projective_Point *T;
+	Ep_Point *R;
+
+	/* temporary variables */
+	temp = gf_ele_init(tate->gfp2, tate->gfp2->k);	
+	T = ep_projective_point_init(tate->E);
+	R = ep_point_init(tate->E);
+
+	/* step1. intialization */
+	v_num = gf_ele_init(tate->gfp2, tate->gfp2->k); gf_ele_unit(tate->gfp2, v_num, tate->gfp2->k);
+	v_den = gf_ele_init(tate->gfp2, tate->gfp2->k); gf_ele_unit(tate->gfp2, v_den, tate->gfp2->k);
+	t_num = gf_ele_init(tate->gfp2, tate->gfp2->k); gf_ele_unit(tate->gfp2, t_num, tate->gfp2->k);
+	t_den = gf_ele_init(tate->gfp2, tate->gfp2->k); gf_ele_unit(tate->gfp2, t_den, tate->gfp2->k);
+
+	V = ep_projective_point_init(tate->E);
+	ep_affine_to_projective(tate->E, V, A);
+
+	V_a = ep_point_init(tate->E);
+	V_b = ep_point_init(tate->E);
+
+	/* step 2. calculate 2^b contribution */
+	for(n=0; n<tate->b; n++){
+		gf_ele_sqr(tate->gfp2, t_num, t_num, tate->gfp2->k);	/* t_num = (t_num)^2 in F_p^2 */
+		gf_ele_sqr(tate->gfp2, t_den, t_den, tate->gfp2->k);	/* t_num = (t_num)^2 in F_p^2 */
+		
+		ep_eval_tangent2(tate->E, temp, V, B);
+		gf_ele_mul(tate->gfp2, t_num, t_num, temp, tate->gfp2->k);	/* t_num = t_num * EvalTangent(B, V) */
+
+		ep_projective_point_double(tate->E, T, V);
+		ep_projective_point_copy(tate->E, V, T);	/* V = [2]V */
+		
+		ep_eval_vertical2(tate->E, temp, V, B);
+		gf_ele_mul(tate->gfp2, t_den, t_den, temp, tate->gfp2->k);	/* t_den = t_den * EvalVertical(B, V) */
+	}
+
+	ep_projective_to_affine(tate->E, V_b, V);	
+
+	gf_ele_mul(tate->gfp2, v_num, v_num, t_num, tate->gfp2->k);	/* v_num = v_num * t_num */
+	gf_ele_mul(tate->gfp2, v_den, v_den, t_den, tate->gfp2->k);	/* v_den = v_den * t_den */
+	
+	/* step 3. calculate 2^a contribution */	
+	for(n=tate->b; n<tate->a; n++){
+		gf_ele_sqr(tate->gfp2, t_num, t_num, tate->gfp2->k);	/* t_num = (t_num)^2 in F_p^2 */
+		gf_ele_sqr(tate->gfp2, t_den, t_den, tate->gfp2->k);	/* t_num = (t_num)^2 in F_p^2 */
+		
+		ep_eval_tangent2(tate->E, temp, V, B);
+		gf_ele_mul(tate->gfp2, t_num, t_num, temp, tate->gfp2->k);	/* t_num = t_num * EvalTangent(B, V) */
+
+		ep_projective_point_double(tate->E, T, V);
+		ep_projective_point_copy(tate->E, V, T);	/* V = [2]V */
+		
+		ep_eval_vertical2(tate->E, temp, V, B);
+		gf_ele_mul(tate->gfp2, t_den, t_den, temp, tate->gfp2->k);	/* t_den = t_den * EvalVertical(B, V) */
+	}
+
+	ep_projective_to_affine(tate->E, V_a, V);	
+
+	gf_ele_mul(tate->gfp2, v_num, v_num, t_num, tate->gfp2->k);	/* v_num = v_num * t_num */
+	gf_ele_mul(tate->gfp2, v_den, v_den, t_den, tate->gfp2->k);	/* v_den = v_den * t_den */
+
+	/* step 4. Correction for 2^b */
+	ep_eval_line(tate->E, temp, V_a, V_b, B);
+	gf_ele_mul(tate->gfp2, v_num, v_num, temp, tate->gfp2->k);		/* v_num = v_num * EvalLine(B, Va, Vb) */
+
+	ep_point_add(tate->E, R, V_a, V_b);
+	ep_eval_vertical1(tate->E, temp, R, B);
+	gf_ele_mul(tate->gfp2, v_den, v_den, temp, tate->gfp2->k);		/* v_den = v_den * EvalVertical(B, Va + Vb) */
+
+	/* step 5. Correcting exponent - no need */
+	
+
+	/* step 6. final exponentiation */
+	gf_ele_inverse(tate->gfp2, temp, v_den);
+	gf_ele_mul(tate->gfp2, temp, temp, v_num, tate->gfp2->k);
+	gf_ele_exp(tate->gfp2, res, temp, tate->eta, tate->eta_len);		/* res = (v_num / v_den)^{eta} */
+
+	/* free memory */
+	gf_ele_free(temp, tate->gfp2->k);	
+	ep_projective_point_free(T);
+	ep_point_free(R);
+
+	return 0;
+}
+
+int tate_pairing(Tate_Pairing_Info *tate, GF_ELE e, Ep_Point *A, Ep_Point *B)
+{
+	Ep2_Point TB;
+
+	TB.x = gf_ele_init(tate->gfp2, tate->gfp2->k);
+	TB.y = gf_ele_init(tate->gfp2, tate->gfp2->k);
+
+	/* compute TB = phi(B) */
+
+	/* compute modified tate's pairing */
+	tate_pairing_eval(tate, e, A, &TB);
+
+	/* free memory */
+	gf_ele_free(TB.x, tate->gfp2->k);
+	gf_ele_free(TB.y, tate->gfp2->k);
+
+	return 0;
+}
+
+int tate_pairing_ratio()
+{
+	return 0;
+}
diff --git a/src/libm/elliptic-ffp.h b/src/libm/elliptic-ffp.h
new file mode 100644
index 000000000000..f9a0debb6dbc
--- /dev/null
+++ b/src/libm/elliptic-ffp.h
@@ -0,0 +1,232 @@
+/*-----------------------------------------------------------*/
+/* Elliptic Curve Over Prime Field Implementation            */
+/* Author: Dang Nguyen Duc                                   */
+/* Date  : 2002/11/16                                        */
+/* Ref	 : IEEE P1363 Public Key Cryptography Specifications */
+/* Todo  : Make all init struct functions to return pointer  */ 
+/*-----------------------------------------------------------*/
+
+#ifndef _ELLIPTIC_FFP_H
+#define _ELLIPTIC_FFP_H
+
+#include "bigdigits.h"
+#include "galois.h"
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+typedef struct {
+	DIGIT_T		*x;	/* X coordinate */
+	DIGIT_T		*y;	/* Y coordinate */
+} Ep_Point;
+/* (X = 0, Y = 0) represents point at infinity */
+
+typedef struct {
+	DIGIT_T		*X;	/* X coordinate : x = X/Z^2 */
+	DIGIT_T		*Y;	/* Y coordinate : y = Y/Z^3 */
+	DIGIT_T		*Z;	/* Z coordinate */	
+} Ep_Projective_Point;
+/* (X = 0, Y = 1, Z = 0) is the point at infinity */
+
+/* Weierstrass Equation (affine coordinate) : y^2 = x^3 + ax + b (mod p) */
+/*                  (projective coordinate) : Y^2Z = X^3 + aXZ^4 + bZ^6 */	
+typedef struct {
+	UINT 		len;	/* Length of p in DWORD */
+	DIGIT_T		*p;	/* Underlying field is Z/Zp */
+	DIGIT_T		*a;	/* Coefficient a, usually -3 or p-3 */
+	DIGIT_T		*b;	/* Coefficient b */
+	Ep_Point	G;	/* The base point */
+				/* in case of type-1 curve, base point of subgroup of prime order r | p+1 and p mod 12 = 11 */
+	UINT		rlen;	/* Lenght of r in DWORD */
+	DIGIT_T		*r;	/* Order of the base point */
+	DIGIT_T		h;	/* h*r is order of the group, b (as in Solinas prime 2^a+2^b+1) in case type-1 curve */
+} Ep_Curve;
+
+#define EP_NPARAM	   9 + 2	/* Number of lines in domain parameter file */
+#define EP_MAX_LINE_LEN	   256+1+1	/* Max length of a line in domain parameter file */
+
+typedef struct {
+	UINT a;
+	UINT b;			/* Solinas prime is 2^a + 2^b + 1 */
+	DIGIT_T *eta;		/* exponent eta = (p^2-1)/q is used when computing final exponentiation of Tate pairing */
+	UINT eta_len;		/* digit length of eta */
+	Ep_Curve *E;		/* Type-1 elliptic curve of interest */
+	GF_T	 *gfp2;		/* extension field GF(p^2) */	
+} Tate_Pairing_Info;		
+
+typedef struct {
+	GF_ELE x;
+	GF_ELE y;
+} Ep2_Point;			/* Point coordinates on extension field F_{p^2} */
+				/* This one is indended for Tate pairing computation */
+
+/* Function Prototype */
+Ep_Point* ep_point_init(Ep_Curve *E);
+	/* Allocate memory for a Point using Affine coordinate */
+
+int ep_point_member_init(Ep_Curve*E, Ep_Point *P);
+	/* Allocate memory for Ep_Point's members */
+
+void ep_point_free(Ep_Point *P);
+	/* free memory allocaeted for Ep_Point struct including its members */
+
+void ep_point_member_free(Ep_Point *P);
+	/* free memory allocate for Ep_Point's members only */
+
+Ep_Projective_Point *ep_projective_point_init(Ep_Curve *E);
+	/* Allocate Memory for a Point using Projective coordinate */
+
+int ep_projective_point_member_init(Ep_Curve*E, Ep_Projective_Point *P);
+	/* Allocate memory for Ep_Projective_Point's members */
+
+void ep_projective_point_free(Ep_Projective_Point *P);
+	/* free memory allocaeted for Ep_Point struct including its members */
+
+void ep_projective_point_member_free(Ep_Projective_Point *P);
+	/* free memory allocate for Ep_Point's members only */
+
+int ep_affine_to_projective(Ep_Curve *E, Ep_Projective_Point *P, Ep_Point *Q);
+	/* Convert affine to projective coordinate */
+
+int ep_projective_to_affine(Ep_Curve *E, Ep_Point *P, Ep_Projective_Point *Q);
+	/* Convert projective to affine coordinate */
+
+int ep_point_copy(Ep_Curve *E, Ep_Point *P, Ep_Point *Q);
+	/* Make P = Q */
+
+int ep_projective_point_copy(Ep_Curve *E, Ep_Projective_Point *P, Ep_Projective_Point *Q);
+	/* P = Q in projective coordinate */
+
+int ep_point_zero(Ep_Curve *E, Ep_Point *P);
+	/* Make P = infinity */
+
+int ep_projective_point_zero(Ep_Curve *E, Ep_Projective_Point *P);
+	/* Make P = infinity in projective coordinate */
+
+int ep_point_inv(Ep_Curve *E, Ep_Point *Q, Ep_Point *P);
+	/* Point Inversion Q = [-1]P */
+
+int ep_point_is_zero(Ep_Curve *E, Ep_Point *P);
+	/* return true if P is inf point */
+
+int ep_projective_point_is_zero(Ep_Curve *E, Ep_Projective_Point *P);
+	/* return true if P is inf point in projective coordinate */
+
+int ep_point_is_equal(Ep_Curve *E, Ep_Point *P, Ep_Point *Q);
+	/* return true if P = Q */
+
+int ep_point_is_inverse(Ep_Curve *E, Ep_Point *P, Ep_Point *Q);
+	/* return true if P = -Q */
+
+int ep_point_add(Ep_Curve *E, Ep_Point *R, Ep_Point *P, Ep_Point *Q);
+	/* Point Addition R = P + Q using affine coordinate */
+
+int ep_projective_point_add(Ep_Curve *E, Ep_Projective_Point* R, \
+		                         Ep_Projective_Point *Q, \
+					 Ep_Projective_Point *P);
+	/* Point Addition R = P + Q using projective coordinate */
+
+int ep_mixed_point_add(Ep_Curve *E, Ep_Projective_Point* R, \
+		                    Ep_Projective_Point *Q, \
+				    Ep_Point *P);
+	/* Point Addition R = P + Q using both projective (Q) and affine (P) coordinate */
+
+int ep_point_sub(Ep_Curve *E, Ep_Point *R, Ep_Point *P, Ep_Point *Q);
+	/* Point Subtraction R = P - Q */
+	
+int ep_point_double(Ep_Curve *E, Ep_Point* Q, Ep_Point *P);
+	/* Point Doubling, Q = [2]P */
+
+int ep_projective_point_double(Ep_Curve *E, Ep_Projective_Point* Q, Ep_Projective_Point *P);
+	/* Point Doubling, Q = [2]P in projective coordinate */
+	
+int ep_point_mul(Ep_Curve *E, Ep_Point *Q, Ep_Point *P, DIGIT_T *k, UINT klen);
+	/* Point Multiplication using affine coordinate */
+
+int ep_projective_point_mul(Ep_Curve *E, Ep_Projective_Point* Q, \
+		                         Ep_Projective_Point *P, DIGIT_T *k, UINT klen);
+	/* Point Multiplication Q = [k]P using projective coordinate */
+
+int ep_point_gen(Ep_Curve *E, Ep_Point *P);
+	/* Random Point Generation */
+
+int ep_point_order(Ep_Curve *E, Ep_Point *P, DIGIT_T *k);
+	/* Compute order of P - todo */
+
+Ep_Curve *ep_curve_init(DIGIT_T *p, UINT plen, DIGIT_T *a, DIGIT_T *b, DIGIT_T *r, UINT rlen, Ep_Point *G);
+	/* allocate memory for Ep_Curve struct including its members */
+
+void ep_curve_free(Ep_Curve *E);
+	/* free memory allocated to Ep_Curve struct including its members */
+
+Ep_Curve *ep_curve_init2(void);
+	/* allocate memory for Ep_Curve struct only */
+
+void ep_curve_member_free(Ep_Curve *E);
+	/* free memory allocated to Ep_Curve's members only */
+
+int ep_curve_gen(Ep_Curve *E);
+	/* Verifiable Pseudorandom Elliptic Curve Generation - todo */
+
+int ep_type1_curve_gen(Ep_Curve *E, UINT n);
+	/* Type-1 curve generation - y^2 = x^3 + 1 (mod p) s.t. p mod 12 = 11 */
+	/* Curve's order is p+1, q is order of subgroup of E/F_p */
+	/* Subgroup of interest is E/F_(p^2) which is isomorphic to F_p[x]/(x^2+1) */
+	/* n - security strength measured in RSA's key length, e.g., 1024 */
+
+int ep_type1_curve_validate(Ep_Curve *E);
+	/* doesnt hurt to validate curve generated by ep_type1_curve_gen */
+
+int ep_eval_vertical1(Ep_Curve *E, GF_ELE r, Ep_Point *A, Ep2_Point *B);
+	/* evaluate the divisor of the vertical line which goes through A at B */
+	/* this is a helper function for computing Tate's pairing */
+
+int ep_eval_vertical2(Ep_Curve *E, GF_ELE r, Ep_Projective_Point *A, Ep2_Point *B);
+	/* ep_eval_vertical for A in projective coordinate */
+
+int ep_eval_tangent1(Ep_Curve *E, GF_ELE r, Ep_Point *A, Ep2_Point *B);
+	/* evaluate the divisor of the tangent line to A, at B */
+	/* this is another helper function for computing Tate's pairing */
+
+int ep_eval_tangent2(Ep_Curve *E, GF_ELE r, Ep_Projective_Point *A, Ep2_Point *B);
+	/* same version but for A in projective coordinate */
+
+int ep_eval_line1(Ep_Curve *E, GF_ELE r, Ep_Point *A1, Ep_Point *A2, Ep2_Point *B);
+	/* evaluate the divisor of the line goes through A1-A2, at B */
+	/* this is another helper function for computing Tate's pairing */
+
+int tate_pairing_init(Tate_Pairing_Info *tate, UINT n);
+	/* preparing Tate_Pairing_Info structure */
+	/* n is security strenth measured in RSA's key length */
+
+int tate_pairing_init2(Tate_Pairing_Info *tate, const char *curve_fname);
+	/* preparing Tate_Pairing_Info structure from elliptic curve domain file */
+
+int tate_pairing_eval(Tate_Pairing_Info *tate, GF_ELE res, Ep_Point *A, Ep2_Point *B);
+	/* compute tate's pairing */ 
+
+int tate_pairing(Tate_Pairing_Info *tate, GF_ELE e, Ep_Point *A, Ep_Point *B);
+	/* compute modified tate's pairing */
+
+/* Utility Function */
+int ep_load_curve(const char *fname, Ep_Curve *E);
+	/* Load Elliptic Curve Domain Parameters From File */
+
+int ep_save_curve(const char *fname, Ep_Curve *E);
+	/* Save Elliptic Curve Domain Parameters To File */
+
+int ep_load_point(const char *fname, Ep_Curve *E, Ep_Point *P);
+	/* Load A Point Coordinates From File */
+
+int ep_save_point(const char *fname, Ep_Curve *E, Ep_Point *P);
+	/* Save A Point Coordinates To File */
+
+int ep_is_on_curve(Ep_Curve *E, Ep_Point *P);
+	/* Check whether P lies on E */
+	
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/src/libm/ff2n.c b/src/libm/ff2n.c
new file mode 100644
index 000000000000..09a677507de2
--- /dev/null
+++ b/src/libm/ff2n.c
@@ -0,0 +1,810 @@
+/*-----------------------------------------------------------------------*/
+/* Binary Field Implementation - ff2n.c (Polynomial Basis)               */
+/* Author : Dang Nguyen Duc, nguyenduc-nMRlb+72nxtQFI55V6+gNQ@public.gmane.org  	                 */
+/* Date : 11/17/2001                                                     */ 
+/* Note : All algorithms used in this program are considered as classical*/ 
+/*        algorithms for polynomial arithmetic. All of them are refered  */	
+/*        to "Handbook of Applied Cryptography" by Alfred Menezes        */
+/* Version : 0.1a 						         */	
+/* Change  :							         */	
+/* To Do   :                                                             */
+/*-----------------------------------------------------------------------*/
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <assert.h>
+#include "ff2n.h"
+
+/* Squaring Precomputation */
+static const unsigned short T[256] = {
+    	0x0000, 0x0001, 0x0004, 0x0005, 0x0010, 0x0011, 0x0014, 0x0015, 0x0040, 0x0041,
+    	0x0044, 0x0045, 0x0050, 0x0051, 0x0054, 0x0055, 0x0100, 0x0101, 0x0104, 0x0105,
+    	0x0110, 0x0111, 0x0114, 0x0115, 0x0140, 0x0141, 0x0144, 0x0145, 0x0150, 0x0151,
+    	0x0154, 0x0155, 0x0400, 0x0401, 0x0404, 0x0405, 0x0410, 0x0411, 0x0414, 0x0415,
+    	0x0440, 0x0441, 0x0444, 0x0445, 0x0450, 0x0451, 0x0454, 0x0455, 0x0500, 0x0501,
+    	0x0504, 0x0505, 0x0510, 0x0511, 0x0514, 0x0515, 0x0540, 0x0541, 0x0544, 0x0545,
+    	0x0550, 0x0551, 0x0554, 0x0555, 0x1000, 0x1001, 0x1004, 0x1005, 0x1010, 0x1011,
+    	0x1014, 0x1015, 0x1040, 0x1041, 0x1044, 0x1045, 0x1050, 0x1051, 0x1054, 0x1055,
+    	0x1100, 0x1101, 0x1104, 0x1105, 0x1110, 0x1111, 0x1114, 0x1115, 0x1140, 0x1141,
+    	0x1144, 0x1145, 0x1150, 0x1151, 0x1154, 0x1155, 0x1400, 0x1401, 0x1404, 0x1405,
+    	0x1410, 0x1411, 0x1414, 0x1415, 0x1440, 0x1441, 0x1444, 0x1445, 0x1450, 0x1451,
+    	0x1454, 0x1455, 0x1500, 0x1501, 0x1504, 0x1505, 0x1510, 0x1511, 0x1514, 0x1515,
+    	0x1540, 0x1541, 0x1544, 0x1545, 0x1550, 0x1551, 0x1554, 0x1555, 0x4000, 0x4001,
+    	0x4004, 0x4005, 0x4010, 0x4011, 0x4014, 0x4015, 0x4040, 0x4041, 0x4044, 0x4045,
+    	0x4050, 0x4051, 0x4054, 0x4055, 0x4100, 0x4101, 0x4104, 0x4105, 0x4110, 0x4111,
+    	0x4114, 0x4115, 0x4140, 0x4141, 0x4144, 0x4145, 0x4150, 0x4151, 0x4154, 0x4155,
+    	0x4400, 0x4401, 0x4404, 0x4405, 0x4410, 0x4411, 0x4414, 0x4415, 0x4440, 0x4441,
+    	0x4444, 0x4445, 0x4450, 0x4451, 0x4454, 0x4455, 0x4500, 0x4501, 0x4504, 0x4505,
+    	0x4510, 0x4511, 0x4514, 0x4515, 0x4540, 0x4541, 0x4544, 0x4545, 0x4550, 0x4551,
+    	0x4554, 0x4555, 0x5000, 0x5001, 0x5004, 0x5005, 0x5010, 0x5011, 0x5014, 0x5015,
+    	0x5040, 0x5041, 0x5044, 0x5045, 0x5050, 0x5051, 0x5054, 0x5055, 0x5100, 0x5101,
+    	0x5104, 0x5105, 0x5110, 0x5111, 0x5114, 0x5115, 0x5140, 0x5141, 0x5144, 0x5145,
+    	0x5150, 0x5151, 0x5154, 0x5155, 0x5400, 0x5401, 0x5404, 0x5405, 0x5410, 0x5411,
+    	0x5414, 0x5415, 0x5440, 0x5441, 0x5444, 0x5445, 0x5450, 0x5451, 0x5454, 0x5455,
+    	0x5500, 0x5501, 0x5504, 0x5505, 0x5510, 0x5511, 0x5514, 0x5515, 0x5540, 0x5541,
+    	0x5544, 0x5545, 0x5550, 0x5551, 0x5554, 0x5555 };
+    	
+/* Utility function */
+int ff2n_swap(FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], UINT COEFF_SIZE)
+{
+	/* a(x) <--> b(x) */
+	FF2N_ELT temp;
+		
+	while(COEFF_SIZE--){
+		temp = a_coeff[COEFF_SIZE];
+		a_coeff[COEFF_SIZE] = b_coeff[COEFF_SIZE];
+		b_coeff[COEFF_SIZE] = temp;
+	}
+	
+	return 0;
+}
+
+int ff2n_is_unit(FF2N_ELT a_coeff[], UINT COEFF_SIZE)
+{
+	/* return 1 if a(x) = 1, otherwise return 0 */
+	register UINT i;
+	
+	for(i=1;i<COEFF_SIZE;i++)
+		if(a_coeff[i])
+			return 0;
+	
+	return (a_coeff[0] == 1);
+}
+
+int ff2n_is_zero(FF2N_ELT a_coeff[], UINT COEFF_SIZE)
+{
+	/* return 1 if a(x) = 0, otherwise return 0 */
+	register UINT i;
+	
+	for(i=0;i<COEFF_SIZE;i++)
+		if(a_coeff[i])
+			return 0;
+	
+	return 1;
+}
+
+int ff2n_is_equal(FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], UINT COEFF_SIZE)
+{
+	/* return 1 if a(x) = b(x), otherwise return 0 */
+	register UINT i;
+	
+	for(i=0;i<COEFF_SIZE;i++)
+		if(a_coeff[i] != b_coeff[i])
+			return 0;
+	
+	return 1;
+}
+
+FF2N_ELT ff2n_ranfunc(FF2N_ELT min, FF2N_ELT max)
+{
+	static unsigned seeded = 0;
+	register UINT i;
+	double f;
+
+	if (!seeded){
+		/* seed with system time */
+		srand((unsigned)time(NULL));
+		
+		i = rand() & 0xFF;
+		while (i--)
+			rand();
+		seeded = 1;
+	}
+	f = (double)rand() / RAND_MAX * max;
+	return (min + (UINT)f);
+}
+
+/* main functions */
+/*---------------------------------------------------------------------*/
+/* ff2n_get_bit : Get k-th coefficient				       */
+/* input  : a(x), k						       */
+/* ouput  : a(k)						       */
+/*---------------------------------------------------------------------*/
+int ff2n_get_bit(FF2N_ELT a_coeff[], UINT k, UINT COEFF_SIZE)
+{
+	register UINT i, j;
+	register FF2N_ELT mask = WORD_LOW_BITMASK;
+	
+	i = k / BITS_PER_WORD;
+	j = k % BITS_PER_WORD;
+	
+	mask = mask << j;
+	
+	if(a_coeff[i] & mask)
+		return 1;
+
+	return 0;
+}
+/*---------------------------------------------------------------------*/
+/* ff2n_set_bit : set k-th coefficient				       */
+/* input  : a(x), k						       */
+/* ouput  : a(x) such that a_k = 1				       */
+/*---------------------------------------------------------------------*/
+int ff2n_set_bit(FF2N_ELT a_coeff[], UINT k, UINT COEFF_SIZE)
+{
+	register UINT i, j;
+	register FF2N_ELT mask = WORD_LOW_BITMASK;
+	
+	i = k / BITS_PER_WORD;
+	j = k % BITS_PER_WORD;
+	
+	mask = mask << j;
+	
+	a_coeff[i] |= mask;
+			
+	return 0;
+}
+/*---------------------------------------------------------------------*/
+/* ff2n_clear_bit: Clear k-th coefficient			       */
+/* input   : a(x), k						       */
+/* ouput   : a(x) such that a_k = 0				       */
+/*---------------------------------------------------------------------*/
+int ff2n_clear_bit(FF2N_ELT a_coeff[], UINT k, UINT COEFF_SIZE)
+{
+	register UINT i, j;
+	register FF2N_ELT mask = WORD_LOW_BITMASK;
+	
+	i = k / BITS_PER_WORD;
+	j = k % BITS_PER_WORD;
+	
+	mask = mask << j;
+	mask = ~mask;
+	
+	a_coeff[i] &= mask;
+			
+	return 0;
+}  		
+/*---------------------------------------------------------------------*/
+/* ff2n_kMul   : left shift memory k bits or a(x) = a(x) * x^k         */  
+/* input  : b(x)                                                       */
+/* output : a(x) = b(x) * x^k                                          */
+/*---------------------------------------------------------------------*/
+int ff2n_kMul(FF2N_ELT a_coeff[], UINT a_COEFF_SIZE, FF2N_ELT b_coeff[], UINT b_COEFF_SIZE, UINT k)
+{
+	register int i;
+	register UINT l;
+	register UINT temp_k = k;
+	register FF2N_ELT mask = WORD_HI_BITMASK;  
+	FF2N_ELT temp[MAX_COEFF_SIZE];
+	register UINT carry = 0;
+	register UINT nextcarry = 0;
+
+	ff2n_set_equal(temp, b_coeff, b_COEFF_SIZE);
+	ff2n_set_zero(a_coeff, a_COEFF_SIZE);
+	ff2n_set_equal(a_coeff, temp, b_COEFF_SIZE);
+	
+	if(k == 0)
+		return 0;
+	
+	/* a WORD-LONG left shift */
+	l = 0;
+	while(temp_k / BITS_PER_WORD){
+		for(i=a_COEFF_SIZE-1;i>l;i--){
+			a_coeff[i] = a_coeff[i-1];
+			a_coeff[i-1] = 0;
+		}
+		l++;
+		temp_k -= BITS_PER_WORD;
+	}
+	if(temp_k == 0)
+		return 0; /* no more to shift */
+	/* less than a WORD-LONG left shift */
+	l = BITS_PER_WORD - temp_k;
+	
+	for(i=1;i<k;i++) /* Construct mask */
+		mask = (mask >> 1) | WORD_HI_BITMASK;
+		
+	for(i=k/BITS_PER_WORD;i<a_COEFF_SIZE;i++){
+		nextcarry = (a_coeff[i] & mask) >> l;
+		a_coeff[i] <<= temp_k;
+		a_coeff[i] |= carry;
+		carry = nextcarry;
+
+	}
+	
+	return 0;
+}
+/*---------------------------------------------------------------------*/
+/* ff2n_kDiv    : Divided by x^k or right shift k bits                 */  
+/* input   : b(x)                                                      */
+/* output  : a(x) = b(x) / x^k                                         */
+/*---------------------------------------------------------------------*/
+int  ff2n_kDiv(FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], UINT COEFF_SIZE,  UINT k)
+{
+	register int i;
+	register UINT l;
+	register UINT temp_k = k;
+	register FF2N_ELT mask = WORD_LOW_BITMASK;
+	register UINT carry = 0;
+	register UINT nextcarry = 0;
+
+	if(a_coeff != b_coeff)
+		ff2n_set_equal(a_coeff, b_coeff, COEFF_SIZE);
+		
+	if(k == 0)
+		return 0;
+		
+	/* a WORD-LONG left shift */
+	l = 1;
+	while(temp_k / BITS_PER_WORD){
+		for(i=0;i<COEFF_SIZE-l; i++) {
+			a_coeff[i] = a_coeff[i + 1];
+			a_coeff[i + 1] = 0;
+		}
+		temp_k -= BITS_PER_WORD;
+		l++;
+	}
+	if(!temp_k)
+		return 0; /* no more to shift */
+	/* less than a WORD-LONG left shift */
+	l = BITS_PER_WORD - temp_k;
+	
+	/* Construct mask */
+	mask = WORD_LOW_BITMASK;
+	for (i = 1; i < l; i++)
+		mask = (mask << 1) | WORD_LOW_BITMASK;
+		
+	for(i=COEFF_SIZE - k/BITS_PER_WORD - 1;i>=0;i--){
+		nextcarry = a_coeff[i] & mask;
+		a_coeff[i] >>= temp_k;
+		a_coeff[i] |= carry;
+		carry = nextcarry;
+
+	}
+	return 0;
+}
+/*----------------------------------------------------------------------*/
+/* ff2n_set_zero : make a zero polynomial		                */
+/*----------------------------------------------------------------------*/
+int ff2n_set_zero(FF2N_ELT a_coeff[], UINT COEFF_SIZE)
+{
+	register int i;
+	
+	for(i=0; i<COEFF_SIZE; i++)
+		a_coeff[i] = 0;
+	
+	return 0;
+}
+/*----------------------------------------------------------------------*/
+/* ff2n_set_unit : make a unit polynomial		                */
+/*----------------------------------------------------------------------*/
+int ff2n_set_unit(FF2N_ELT a_coeff[], UINT COEFF_SIZE)
+{
+	register int i;
+	
+	for(i=1; i<COEFF_SIZE; i++)
+		a_coeff[i] = 0;
+
+	a_coeff[0] = 1;	
+	
+	return 0;
+}
+/*----------------------------------------------------------------------*/
+/* ff2n_set_equal : Make two polynomial the same  		        */
+/*----------------------------------------------------------------------*/
+int ff2n_set_equal(FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], UINT COEFF_SIZE)
+{
+	register int i;
+	
+	for(i=0; i<COEFF_SIZE; i++)
+		a_coeff[i] = b_coeff[i];
+	
+	return 0;
+}
+/*----------------------------------------------------------------------*/
+/* ff2n_poly_deg : ff2n_poly_degree of polynomial                       */
+/* input   : a(x)					                */
+/* output  : ff2n_poly_degree of a(x)				        */
+/*----------------------------------------------------------------------*/
+int ff2n_poly_deg(FF2N_ELT a_coeff[], UINT COEFF_SIZE)
+{
+	register int i;
+	register int j;
+	register UINT mask;
+	
+	for(i=COEFF_SIZE-1;i>=0;i--)
+		for(j=BITS_PER_WORD-1, mask = WORD_HI_BITMASK; j>=0; j--, mask >>= 1)
+			if((a_coeff[i] & mask) > 0)
+				return (i*BITS_PER_WORD + j);		
+	return 0;
+}	
+/*----------------------------------------------------------------------*/
+/* ff2n_add  : addition in GF(2^n)                                      */
+/* input  : a(x), b(x)                                                  */
+/* output : a(x) + b(x)                                              	*/
+/*----------------------------------------------------------------------*/
+int ff2n_add(FF2N_ELT c_coeff[], FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], UINT COEFF_SIZE)
+{
+	register UINT i;
+	
+	/* addition */
+	for(i=0; i<COEFF_SIZE; i++)
+		c_coeff[i] = a_coeff[i] ^ b_coeff[i];
+	
+	return 0;
+}
+/*----------------------------------------------------------------------*/
+/* ff2n_sub  : subtraction in GF(2^n)                                   */
+/* input  : a(x), b(x)                                                  */
+/* output : a(x) - b(x)                                         	*/
+/*----------------------------------------------------------------------*/
+int ff2n_sub(FF2N_ELT c_coeff[], FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], UINT COEFF_SIZE)
+{
+	 register UINT i;
+		
+	/* subtraction */
+	for(i=0; i<COEFF_SIZE; i++)
+		c_coeff[i] = a_coeff[i] ^ b_coeff[i];
+	
+	return 0;
+}
+/*----------------------------------------------------------------------*/
+/* ff2n_reduce : polynomial reduction	 				*/
+/* input   : a(x), n(x) - irreducible polynomial 			*/
+/* output  : a(x) mod n(x)						*/
+/*----------------------------------------------------------------------*/
+int ff2n_reduce(FF2N_ELT a_coeff[], UINT a_COEFF_SIZE, FF2N_ELT n_coeff[], UINT n_COEFF_SIZE)
+{
+	register int d;
+	register UINT ndeg;
+	FF2N_ELT temp[MAX_COEFF_SIZE];
+				
+	/* initialization */
+	ff2n_set_zero(temp, MAX_COEFF_SIZE);
+	ndeg = ff2n_poly_deg(n_coeff, n_COEFF_SIZE);
+	
+	while((d = (ff2n_poly_deg(a_coeff, a_COEFF_SIZE) - ndeg)) >= 0) {
+		/* temp(x) = n(x) * x^d */
+		ff2n_kMul(temp, a_COEFF_SIZE, n_coeff, n_COEFF_SIZE, d);	
+		
+		/* a(x) = a(x) - temp(x) */
+		ff2n_sub(a_coeff, a_coeff, temp, a_COEFF_SIZE);		
+	}
+	
+	return 0;
+}
+
+/*----------------------------------------------------------------------*/
+/* ff2n_reduce163 : polynomial reduction specialized for GF(2^163)	*/
+/* input       : a(x), n(x) - irreducible polynomial 			*/
+/* output      : a(x) mod n(x)						*/
+/*----------------------------------------------------------------------*/
+int ff2n_reduce163(FF2N_ELT a_coeff[])
+{
+	/* n(x) must be x^163 + x^7 + x^6 + x^3 + 1 */
+	register UINT i;
+	register FF2N_ELT T;
+	
+	for(i=10;i>=6;i--) {
+		T = a_coeff[i];
+		a_coeff[i-6] ^= (T << 29);
+		a_coeff[i-5] ^= (T <<  4) ^ (T <<  3) ^ T ^ (T >>3);
+		a_coeff[i-4] ^= (T >> 28) ^ (T >> 29);
+	}	
+	T = a_coeff[5] & 0xFFFFFFF8;
+	a_coeff[0] ^= (T << 4) ^ (T << 3) ^ T ^ (T >> 3);
+	a_coeff[1] ^= (T >> 28) ^ (T >> 29);
+	a_coeff[5] &= 0x00000007;
+		
+	return 0;
+}
+/*----------------------------------------------------------------------*/
+/* ff2n_mul  : standard multiplication by shift-and-add method          */
+/* input  : a(x), b(x), n(x)                                            */
+/* output : a(x) * b(x) mod n(x)                                        */
+/*----------------------------------------------------------------------*/ 
+int ff2n_mul(FF2N_ELT p_coeff[], FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE)
+{
+	FF2N_ELT temp[MAX_COEFF_SIZE];
+	register UINT  i, j;
+	register FF2N_ELT mask;
+	UINT ndeg;
+	
+	ndeg = ff2n_poly_deg(n_coeff, COEFF_SIZE);
+	ff2n_set_equal(temp, b_coeff, COEFF_SIZE);
+	
+	/* if a_0 = 0 then p(x) = b(x) otherwise p(x) = 0 */
+	if(a_coeff[0] & WORD_LOW_BITMASK)
+		ff2n_set_equal(p_coeff, b_coeff, COEFF_SIZE);
+	else
+		ff2n_set_zero(p_coeff, COEFF_SIZE);
+	
+	/* main loop */
+	for(i=0;i<COEFF_SIZE;i++)		
+		for(j=0, mask = WORD_LOW_BITMASK; j<BITS_PER_WORD; j++, mask <<= 1)
+			if(i || j){	/* avoid a_0 */
+				
+				/* temp(x) = b(x)*x mod n(x) */
+				ff2n_kMul(temp, COEFF_SIZE, temp, COEFF_SIZE, 1);
+				if(ff2n_poly_deg(temp, COEFF_SIZE) == ndeg)
+					ff2n_add(temp, temp, n_coeff, COEFF_SIZE);
+					
+				/* if a_i = 1 then p(x) = p(x) + temp(x) */
+				if(a_coeff[i] & mask)
+					ff2n_add(p_coeff, p_coeff, temp, COEFF_SIZE);
+		
+			}	
+	
+	return 0;
+}
+/*----------------------------------------------------------------------------*/
+/* ff2n_rl_comb : multiplication using Right-to-Left Comb method              */
+/* input    : a(x), b(x), n(x)                                                */
+/* output   : a(x) * b(x) mod n(x)                                            */
+/*----------------------------------------------------------------------------*/ 
+int ff2n_rl_comb(FF2N_ELT p_coeff[], FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE)
+{
+	/* Still has some bug */
+	FF2N_ELT temp[2*MAX_COEFF_SIZE];
+	FF2N_ELT B[2*MAX_COEFF_SIZE];
+	register UINT i, j, k;
+	register FF2N_ELT mask;
+	
+	ff2n_set_zero(temp, 2*COEFF_SIZE);
+	ff2n_set_zero(B, 2*COEFF_SIZE);
+	ff2n_set_equal(B, b_coeff, COEFF_SIZE);
+	
+	for(k=0;k<BITS_PER_WORD;k++) {
+		mask = WORD_LOW_BITMASK << k;
+		for(j=0;j<COEFF_SIZE;j++)
+			if(a_coeff[j] & mask)
+				for(i=j;i<2*COEFF_SIZE-1;i++)
+					temp[i] = temp[i] ^ B[i-j];
+		if(k!=BITS_PER_WORD-1)
+			ff2n_kMul(B, 2*COEFF_SIZE, B, 2*COEFF_SIZE, 1); 
+	}
+	
+	ff2n_reduce(temp, 2*COEFF_SIZE, n_coeff, COEFF_SIZE);
+	ff2n_set_equal(p_coeff, temp, COEFF_SIZE);
+	
+	return 0;
+}
+/*----------------------------------------------------------------------------*/
+/* ff2n_sqr  : squaring                                                       */
+/* input : a(x), n(x)                                                         */
+/* output: b(x) = a(x)^2 mod n(x)                                             */
+/*----------------------------------------------------------------------------*/
+int ff2n_sqr(FF2N_ELT b_coeff[], FF2N_ELT a_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE)
+{
+	UINT i, j, k;
+	FF2N_ELT temp[2*MAX_COEFF_SIZE];
+	
+	ff2n_set_zero(temp, 2*MAX_COEFF_SIZE);
+	
+	/* set temp(2*i) = a(i) */
+	for(i=0;i<COEFF_SIZE;i++)
+		for(j=0;j<BITS_PER_WORD;j++) {
+			k = i*BITS_PER_WORD + j;
+			if(ff2n_get_bit(a_coeff, k, COEFF_SIZE))
+				ff2n_set_bit(temp, 2*k, COEFF_SIZE);
+		}
+	ff2n_reduce(temp, 2*COEFF_SIZE, n_coeff, COEFF_SIZE);
+	ff2n_set_equal(b_coeff, temp, COEFF_SIZE);
+		
+	return 0;
+}   
+/*----------------------------------------------------------------------------*/
+/* ff2n_sqr2: squaring with precomputation                                    */
+/* input : a(x), n(x)                                                         */
+/* output: b(x) = a(x)^2 mod n(x)                                             */
+/*----------------------------------------------------------------------------*/
+int ff2n_sqr2(FF2N_ELT b_coeff[], FF2N_ELT a_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE)
+{
+	register UINT i;
+	register UINT u0, u1, u2, u3;
+	FF2N_ELT temp[MAX_COEFF_SIZE];
+	
+	ff2n_set_zero(temp, MAX_COEFF_SIZE);
+	
+	for(i=0;i<COEFF_SIZE;i++) {
+		u0 = (a_coeff[i] & 0x000000ff);
+		u1 = (a_coeff[i] & 0x0000ff00) >> 8;
+		u2 = (a_coeff[i] & 0x00ff0000) >> 16;
+		u3 = (a_coeff[i] & 0xff000000) >> 24;
+		
+		temp[i<<1] = (T[u1] << 16) | T[u0];
+		temp[(i<<1)+1] = (T[u3] << 16) | T[u2]; 		
+	}	
+	
+	ff2n_reduce(temp, 2*COEFF_SIZE, n_coeff, COEFF_SIZE);
+	ff2n_set_equal(b_coeff, temp, COEFF_SIZE);
+	
+	return 0;
+}   
+
+/*----------------------------------------------------------------------*/
+/* ff2n_inverse: Inversion                                   		*/
+/* input    : a(x)                                                      */
+/* output   : b(x) s.t a(x)*b(x) = 1 mod n(x)                           */
+/*----------------------------------------------------------------------*/
+int ff2n_inverse(FF2N_ELT b_coeff[], FF2N_ELT a_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE)
+{
+	/* Extended Euclidean Algorithm */
+	FF2N_ELT c_coeff[MAX_COEFF_SIZE];
+	FF2N_ELT u_coeff[MAX_COEFF_SIZE];
+	FF2N_ELT v_coeff[MAX_COEFF_SIZE];
+	FF2N_ELT temp[MAX_COEFF_SIZE];
+
+	register int j;
+	
+	/* b(x) = 1 */
+	ff2n_set_unit(b_coeff, COEFF_SIZE);
+	/* c(x) = 0 */
+	ff2n_set_zero(c_coeff, MAX_COEFF_SIZE);
+	/* u(x) = a(x) */
+	ff2n_set_equal(u_coeff, a_coeff, COEFF_SIZE);
+	/* v(x) = n(x) */
+	ff2n_set_equal(v_coeff, n_coeff, COEFF_SIZE);
+	
+	while((j = ff2n_poly_deg(u_coeff, COEFF_SIZE)) != 0) {
+		j -= ff2n_poly_deg(v_coeff, COEFF_SIZE);
+		if(j < 0) {
+			/* u(x) <--> v(x) */
+			ff2n_swap(u_coeff, v_coeff, COEFF_SIZE);
+			/* b(x) <--> c(x) */
+			ff2n_swap(b_coeff, c_coeff, COEFF_SIZE);
+			
+			j = -j;
+		}
+		
+		/* u(x) = u(x) - v(x)*x^j */
+		ff2n_kMul(temp, COEFF_SIZE,  v_coeff, COEFF_SIZE, j);
+		ff2n_sub(u_coeff, u_coeff, temp, COEFF_SIZE);
+		
+		/* b(x) = b(x) - c(x)*x^j */
+		ff2n_kMul(temp, MAX_COEFF_SIZE, c_coeff, COEFF_SIZE, j);
+		ff2n_sub(b_coeff, b_coeff, temp, COEFF_SIZE);
+	}
+
+	return 0;
+}
+/*----------------------------------------------------------------------*/
+/* ff2n_inverse2: Inversion                                   	   	*/
+/* input    : a(x)                                                      */
+/* output   : b(x) s.t a(x)*b(x) = 1 mod n(x)                           */
+/*----------------------------------------------------------------------*/
+int ff2n_inverse2(FF2N_ELT b_coeff[], FF2N_ELT a_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE)
+{
+	/* dont use this yets, it still has some bug */
+	/* Almost Inverse Algorithm */
+	FF2N_ELT c_coeff[MAX_COEFF_SIZE];
+	FF2N_ELT u_coeff[MAX_COEFF_SIZE];
+	FF2N_ELT v_coeff[MAX_COEFF_SIZE];
+	
+	/* b(x) = 1 */
+	ff2n_set_unit(b_coeff, COEFF_SIZE);
+	/* c(x) = 0 */
+	ff2n_set_zero(c_coeff, COEFF_SIZE);
+	/* u(x) = a(x) */
+	ff2n_set_equal(u_coeff, a_coeff, COEFF_SIZE);
+	/* v(x) = n(x) */
+	ff2n_set_equal(v_coeff, n_coeff, COEFF_SIZE);
+	
+	while(1) {
+		while((u_coeff[0] & WORD_LOW_BITMASK) == 0){ /* x divides u(x) */
+		
+			ff2n_kDiv(u_coeff, u_coeff, COEFF_SIZE, 1);
+			if((b_coeff[0] & WORD_LOW_BITMASK) == 0) /* x divides b(x) */
+				ff2n_kDiv(b_coeff, b_coeff, COEFF_SIZE, 1);
+			else {
+				ff2n_add(b_coeff, b_coeff, n_coeff, COEFF_SIZE);
+				ff2n_kDiv(b_coeff, b_coeff, COEFF_SIZE, 1);
+			}
+		}
+
+		if(ff2n_is_unit(u_coeff, COEFF_SIZE)) /* u(x) = 1 */
+			return 0;
+		if(ff2n_poly_deg(u_coeff, COEFF_SIZE) < ff2n_poly_deg(v_coeff, COEFF_SIZE)){
+			/* u(x) <---> v(x) */
+			ff2n_swap(u_coeff, v_coeff, COEFF_SIZE);
+			/* b(x) <---> c(x) */
+			ff2n_swap(b_coeff, c_coeff, COEFF_SIZE);
+		}
+		/* u(x) = u(x) + v(x) */
+		ff2n_add(u_coeff, u_coeff, v_coeff, COEFF_SIZE);
+		/* b(x) = b(x) + c(x) */
+		ff2n_add(b_coeff, b_coeff, c_coeff, COEFF_SIZE);
+	}
+	
+	return 0;
+}
+/*----------------------------------------------------------------------*/
+/* ff2n_div: Division                                                   */
+/* input   : a(x), b(x)                                                 */
+/* output  : a(x)*inv(b(x)) mod n(x)                                    */
+/*----------------------------------------------------------------------*/
+int ff2n_div(FF2N_ELT c_coeff[], FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE)
+{
+	FF2N_ELT temp[MAX_COEFF_SIZE];
+
+	ff2n_inverse(temp, b_coeff, n_coeff, COEFF_SIZE);
+	ff2n_mul(c_coeff, a_coeff, temp, n_coeff, COEFF_SIZE);
+
+	return 0;
+}
+/*----------------------------------------------------------------------*/
+/* ff2n_exp : Exponentiation 		                                */
+/* input : a(x), k                                                      */
+/* output: a(x)^k mod n(x)                                              */
+/*----------------------------------------------------------------------*/
+int ff2n_exp(FF2N_ELT b_coeff[], FF2N_ELT a_coeff[], DIGIT_T k[], UINT k_size, FF2N_ELT n_coeff[], UINT COEFF_SIZE)
+{
+	/* left-to-right binary method */	
+	register int i, j;
+	register DIGIT_T mask;
+	
+	/* b(x) = 1 */
+	ff2n_set_unit(b_coeff, COEFF_SIZE);
+	
+	for(i=k_size-1;i>=0;i--)
+		for(mask = HIBITMASK, j=BITS_PER_DIGIT-1; j>=0; mask >>= 1, j--){
+			/* b(x) = b(x)^2 */
+			ff2n_sqr2(b_coeff, b_coeff, n_coeff, COEFF_SIZE);
+			
+			if(k[i] & mask)
+				/* b(x) = b(x)*a(x) */
+				ff2n_mul(b_coeff, a_coeff, b_coeff, n_coeff, COEFF_SIZE); 
+		}
+
+	return 0;
+}
+/*-------------------------------------------------------------------------*/
+/* ff2n_random_poly : Random Element Generator				   */
+/* input  : none							   */
+/* ouput  : a finite field element at random				   */ 	
+/*-------------------------------------------------------------------------*/
+int ff2n_random_poly(FF2N_ELT a_coeff[], UINT COEFF_SIZE)
+{
+#if STRONG_RANDOM
+	prng((BYTE *)a_coeff, FF2N_NBYTE(COEFF_SIZE));
+#else
+	register UINT i;
+	
+	for(i=0;i<COEFF_SIZE-1;i++)
+		a_coeff[i] = ranfunc(0, WORD_MAXVAL); 
+#endif
+	return 0;
+}
+/*-----------------------------------------------------------------------*/
+/* ff2n_print : Print a polynomial's coefficients to screen              */
+/*-----------------------------------------------------------------------*/
+void ff2n_print(FF2N_ELT a_coeff[], UINT COEFF_SIZE)
+{
+	register UINT i = 0;
+	register UINT len = COEFF_SIZE;
+	
+	while (len--){
+		if ((i % 8) == 0 && i)
+			printf("\n");
+		printf("%08lx ", a_coeff[len]);
+		i++;
+	}
+	printf("\n");
+
+}
+/*-----------------------------------------------------------------------*/
+/* ff2n_str2poly : Convert a hexa-string to a polynomial's coefficients  */
+/*-----------------------------------------------------------------------*/
+static BYTE hex2byte(char c)
+{
+	BYTE b;
+	
+	switch(c) {
+	case '0': 	b = 0; break;
+	case '1':	b = 1; break;
+	case '2':	b = 2; break;
+	case '3':	b = 3; break;
+	case '4':	b = 4; break;
+	case '5':	b = 5; break;
+	case '6':	b = 6; break;
+	case '7':	b = 7; break;
+	case '8':	b = 8; break;
+	case '9':	b = 9; break;
+	case 'A': 	
+	case 'a':	b = 10; break;
+	case 'B':	
+	case 'b':	b = 11; break;
+	case 'C':	
+	case 'c':	b = 12; break;
+	case 'D':	
+	case 'd':	b = 13; break;
+	case 'E':	
+	case 'e':	b = 14; break;
+	case 'F': 	
+	case 'f':	b = 15; break;
+	default: b = 0;
+	}
+	
+	return b;
+}
+
+FF2N_ELT *ff2n_str2poly(UINT COEFF_SIZE, char *s)
+{
+	BYTE *p;
+	int i = 0;
+	int slen;
+	
+	/* Hexa string should be 8-digit blocks */
+	if((slen=strlen(s)) % (BITS_PER_WORD / 4))
+		return NULL;
+		
+	p = (BYTE *)malloc(COEFF_SIZE*BITS_PER_WORD/8);
+	memset(p, 0x00, COEFF_SIZE*BITS_PER_WORD/8);
+	
+	while(i<slen){
+		/* read 2 characters each = 1 byte */
+		p[i/2] = hex2byte(s[slen-i-1]) + (hex2byte(s[slen-i-2]) << 4);
+		i+=2;
+	}
+	
+	return (FF2N_ELT *)p;
+}
+
+/*-----------------------------------------------------------------------*/
+/* ff2n_quad_eqn : solve quadretic equation. IEEE 1363 - A.4.6  	 */
+/* Added by vdliem							 */
+/*-----------------------------------------------------------------------*/
+int ff2n_quad_eqn(FF2N_ELT H[], FF2N_ELT alpha[], FF2N_ELT n_coeff[], UINT COEFF_SIZE)
+{
+	FF2N_ELT temp1[MAX_COEFF_SIZE];
+	FF2N_ELT temp2[MAX_COEFF_SIZE];
+	register UINT i;
+	ff2n_set_equal(temp1,alpha, COEFF_SIZE);
+	for (i=1;i<=(ff2n_poly_deg(n_coeff,COEFF_SIZE)-1)/2;i++)
+	{
+		ff2n_sqr2(temp2, temp1, n_coeff, COEFF_SIZE);
+		ff2n_sqr2(temp1, temp2, n_coeff, COEFF_SIZE);
+		ff2n_add(temp1, temp1, alpha, COEFF_SIZE);
+	}
+	
+	ff2n_set_equal(H,temp1,COEFF_SIZE);
+	return 0;
+
+}
+
+/*-----------------------------------------------------------------------*/
+/* ff2n_sqrt: square root = repeated square n-1                 	 */
+/* Added by vdliem							 */
+/*-----------------------------------------------------------------------*/
+int ff2n_sqrt(FF2N_ELT a[], FF2N_ELT b[], FF2N_ELT n_coeff[], UINT COEFF_SIZE)
+{
+	FF2N_ELT temp[MAX_COEFF_SIZE];
+	register UINT j;
+	int deg_b;
+	
+	ff2n_set_zero(temp, COEFF_SIZE);
+	if (ff2n_is_zero(b, COEFF_SIZE)){
+		ff2n_set_zero(a, COEFF_SIZE);
+		return 0;
+	}
+	deg_b=ff2n_poly_deg(b,COEFF_SIZE);
+	ff2n_set_equal(temp,b,COEFF_SIZE);
+	for (j=1; j<ff2n_poly_deg(n_coeff, COEFF_SIZE);j++) 
+		/*repeated square for deg(n_coeff)-1 times */
+       		ff2n_sqr2(temp,temp,n_coeff,COEFF_SIZE);
+	ff2n_set_equal(a,temp,COEFF_SIZE);
+    return 0;
+
+}
+/*-----------------------------------------------------------------------*/
diff --git a/src/libm/ff2n.h b/src/libm/ff2n.h
new file mode 100644
index 000000000000..c515ddf88e35
--- /dev/null
+++ b/src/libm/ff2n.h
@@ -0,0 +1,127 @@
+/*------------------------------------------------------*/
+/* Finite Field Implemetation Header file - ff2n.h      */
+/* Author : Dang Nguyen Duc - nguyenduc-nMRlb+72nxtQFI55V6+gNQ@public.gmane.org       */
+/* Date   : 11/17/2001                                  */        
+/*------------------------------------------------------*/              
+#ifndef _FF2N_H_
+#define _FF2N_H_
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#include "bigdigits.h"
+
+typedef	unsigned long FF2N_ELT;	/* coefficient datatype */
+
+/* added by Liem */
+typedef FF2N_ELT *ff2n_p;
+typedef FF2N_ELT ff2n_t;
+
+#define WORD_MAXVAL 0xffffffff
+#define WORD_HI_BITMASK 0x80000000
+#define WORD_LOW_BITMASK 0x00000001
+#define BITS_PER_WORD	32
+#define MAX_COEFF_SIZE	64 + 1
+#define FF2N_NBYTE(len)	len*BITS_PER_WORD / 8
+
+/* Some Utility function */
+int ff2n_swap(FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], UINT COEFF_SIZE);
+	/* Swap a(x) <---> b(x) */
+
+int ff2n_is_unit(FF2N_ELT a_coeff[], UINT COEFF_SIZE);
+	/* Return 1 if a(x) = 1 */ 
+	
+int ff2n_is_zero(FF2N_ELT a_coeff[], UINT COEFF_SIZE);
+	/* Return 1 if a(x) = 0 */ 
+	
+int ff2n_is_equal(FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], UINT COEFF_SIZE);
+	/* Return 1 if a(x) = b(x) */ 
+
+int ff2n_get_bit(FF2N_ELT a_coeff[], UINT k, UINT COEFF_SIZE);
+	/* Return k-th coefficient of a(x) */
+	
+int ff2n_set_bit(FF2N_ELT a_coeff[], UINT k, UINT COEFF_SIZE);
+	/* Set k-th coefficient of a(x) to 1 */
+	
+int ff2n_clear_bit(FF2N_ELT a_coeff[], UINT k, UINT COEFF_SIZE);
+	/* Set k-th coefficient of a(x) to 0 */
+	
+int ff2n_kMul(FF2N_ELT a_coeff[], UINT a_COEFF_SIZE, FF2N_ELT b_coeff[], UINT b_COEFF_SIZE, UINT k);
+	/* a(x) = a(x) * x^k */
+
+int ff2n_kDiv(FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], UINT COEFF_SIZE,  UINT k);
+	/* a(x) = a(x) / x^k */
+	
+int ff2n_set_zero(FF2N_ELT a_coeff[], UINT COEFF_SIZE);
+	/* Set a(x) = 0 */
+	
+int ff2n_set_unit(FF2N_ELT a_coeff[], UINT COEFF_SIZE);
+	/* Set a(x) = 1 */
+	
+int ff2n_set_equal(FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], UINT COEFF_SIZE);
+	/* Make a(x) = b(x) */
+	
+int ff2n_poly_deg(FF2N_ELT a_coeff[], UINT COEFF_SIZE);
+	/* Return degree of a(x) */
+
+int ff2n_add(FF2N_ELT c_coeff[], FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], UINT COEFF_SIZE);
+	/* Compute c(x) = a(x) + b(x) */
+	
+int ff2n_sub(FF2N_ELT c_coeff[], FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], UINT COEFF_SIZE);
+	/* Compute c(x) = a(x) - b(x) */
+
+int ff2n_reduce(FF2N_ELT a_coeff[], UINT a_COEFF_SIZE, FF2N_ELT n_coeff[], UINT n_COEFF_SIZE);
+	/* Compute a(x) = a(x) mod n(x) */
+
+int ff2n_reduce163(FF2N_ELT a_coeff[]);
+	/* Special Reduction Algorithm for GF(2^163) */
+
+int ff2n_mul(FF2N_ELT p_coeff[], FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE);
+	/* Polynomial multiplication using Shift and Add: p(x) = a(x)*b(x) mod n(x) */
+
+int ff2n_rl_comb(FF2N_ELT p_coeff[], FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE);
+	/* Polynomial multiplication - Right to Left Comb: p(x) = a(x)*b(x) mod n(x) */
+
+int ff2n_inverse(FF2N_ELT b_coeff[], FF2N_ELT a_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE);
+	/* Polynomial Inversion using Extended Euclidean Algorithm: b(x) = a(x)^-1 mod n(x) */
+
+int ff2n_inverse2(FF2N_ELT b_coeff[], FF2N_ELT a_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE);
+	/* Polynomial Inversion - Almost Inverse Algorithm: b(x) = a(x)^-1 mod n(x) */
+
+int ff2n_div(FF2N_ELT c_coeff[], FF2N_ELT a_coeff[], FF2N_ELT b_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE);
+	/* Polynomial Division: c(x) = a(x) / b(x) mod n(x) */
+
+int ff2n_exp(FF2N_ELT b_coeff[], FF2N_ELT a_coeff[], DIGIT_T k[], UINT k_size, FF2N_ELT n_coeff[], UINT COEFF_SIZE);
+	/* Polynomial exponentiation: b(x) = a(x)^k mod n(x) */
+
+int ff2n_sqr(FF2N_ELT b_coeff[], FF2N_ELT a_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE);
+	/* Polynomial squaring: b(x) = a(x)^2 mod n(x) */
+
+int ff2n_sqr2(FF2N_ELT b_coeff[], FF2N_ELT a_coeff[], FF2N_ELT n_coeff[], UINT COEFF_SIZE);
+	/* Polynomial squaring with precomputation: b(x) = a(x)^2 mod n(x) */
+
+FF2N_ELT ff2n_ranfunc(FF2N_ELT min, FF2N_ELT max);
+	/* helper for ff2n_random_poly */
+
+int ff2n_random_poly(FF2N_ELT a_coeff[], UINT COEFF_SIZE);
+	/* Polynomial squaring - precomputation */
+	
+FF2N_ELT* ff2n_str2poly(UINT COEFF_SIZE, char *str);
+	/* Hexa-string to polynomial's coefficients */
+
+void ff2n_print(FF2N_ELT a_coeff[], UINT COEFF_SIZE);
+	/* Print polynomial's coefficients */
+
+/* Added by vdliem						*/
+int ff2n_quad_eqn(FF2N_ELT H[], FF2N_ELT alpha[], FF2N_ELT n_coeff[], UINT COEFF_SIZE);
+    /*Solve quadretic equation*/
+
+int ff2n_sqrt(FF2N_ELT a[], FF2N_ELT b[], FF2N_ELT n_coeff[], UINT COEFF_SIZE);
+    /*Compute square root*/	
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/src/libm/galois.c b/src/libm/galois.c
new file mode 100644
index 000000000000..6485f8c4ec44
--- /dev/null
+++ b/src/libm/galois.c
@@ -0,0 +1,497 @@
+/*-----------------------------------------------------------*/
+/* General Galois field implementation GF(p^n) for large p   */
+/* Author: Dang Nguyen Duc                                   */
+/* Date  : 2007/02/03                                        */
+/*-----------------------------------------------------------*/
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include "bigdigits.h"
+#include "galois.h"
+
+GF_T *gf_init(UINT k, DIGIT_T *p, UINT plen)
+{
+	/* the field is GF(p^k) */
+	GF_T *gf = (GF_T *)malloc(sizeof(GF_T));
+	
+	if(gf!=NULL){
+		gf->plen = plen;
+		gf->p = mpMalloc(plen);
+		mpSetEqual(gf->p, p, plen);
+		gf->k = k;
+		gf->n = gf_ele_init(gf, gf->k+1);
+	}
+
+	return gf;
+}
+
+void gf_free(GF_T *gf)
+{
+	/* free memory allocated to GF_T struct including its members */
+	gf_ele_free(gf->n, gf->k+1);
+	mpFree(gf->p);
+	free(gf);
+}
+
+void gf_member_free(GF_T *gf)
+{
+	/* free memory allocated to GF_T struct's members only */
+	gf_ele_free(gf->n, gf->k+1);
+	mpFree(gf->p);
+}
+
+GF_ELE gf_ele_init(GF_T *gf, UINT len)
+{
+	GF_ELE a;
+	register int i;
+
+	/* allocate memory for k coefficients of a(x) */
+	a = (GF_ELE)malloc(len*sizeof(GF_ELE));
+
+	/* allocate memory for each cooeffcient */
+	for(i=0;i<len;i++)
+		a[i] = (DIGIT_T *)malloc(NBYTE(gf->plen));
+	
+	return a;
+}
+
+void gf_ele_free(GF_ELE a, UINT len)
+{
+	register int i;
+	
+	for(i=0;i<len;i++)
+		free(a[i]);
+	free(a);
+}
+
+int gf_ele_zero(GF_T *gf, GF_ELE a, UINT len)
+{
+	register int i;
+
+	for(i=0;i<len;i++)
+		mpSetZero(a[i], gf->plen);
+
+	return 0;
+}
+
+int gf_ele_is_zero(GF_T *gf, GF_ELE a, UINT len)
+{
+	register int i;
+
+	for(i=0; i<len; i++)
+		if(!mpIsZero(a[i], gf->plen))
+			return 0;
+
+	return 1;
+}
+
+int gf_ele_unit(GF_T *gf, GF_ELE a, UINT len)
+{
+	register int i;
+
+	for(i=len-1; i>0; i--)
+		mpSetZero(a[i], gf->plen);
+
+	mpSetDigit(a[0], 1, gf->plen);
+	
+	return 0;
+}
+
+int gf_ele_is_unit(GF_T *gf, GF_ELE a, UINT len)
+{
+	
+	register int i;
+
+	for(i=1; i<len; i++)
+		if(!mpIsZero(a[i], gf->plen))
+			return 0;
+
+	return (mpIsOne(a[0], gf->plen));	
+}
+
+int gf_ele_equal(GF_T *gf, GF_ELE a, GF_ELE b, UINT len)
+{
+	register int i;
+	
+	for(i=0; i<len; i++)
+		mpSetEqual(a[i], b[i], gf->plen);
+
+	return 0;
+}
+
+int gf_ele_is_equal(GF_T *gf, GF_ELE a, GF_ELE b, UINT len)
+{
+	register int i;
+	
+	for(i=0; i<len; i++)
+		if(!mpEqual(a[i], b[i], gf->plen))
+			return 0;
+	return 1;
+}
+
+int gf_ele_random(GF_T *gf, GF_ELE a, UINT len)
+{
+	register int i;
+	DIGIT_T *t = (DIGIT_T *)malloc(NBYTE(gf->plen));
+
+	for(i=0;i<len;i++){
+		mpMakeRandom(t, gf->plen);
+		mpModulo(a[i], t, gf->plen, gf->p, gf->plen);
+	}
+	
+	free(t);
+
+	return 0;		
+}
+
+int gf_ele_add(GF_T *gf, GF_ELE a, GF_ELE b, GF_ELE c, UINT len)
+{
+	register int i;
+
+	for(i=0; i<len; i++)
+		mpModAdd(a[i], b[i], c[i], gf->p, gf->plen);
+
+	return 0;
+}
+
+int gf_ele_sub(GF_T *gf, GF_ELE a, GF_ELE b, GF_ELE c, UINT len)
+{
+	register int i;
+
+	for(i=0; i<len; i++)
+		mpModSubtract(a[i], b[i], c[i], gf->p, gf->plen);
+
+	return 0;
+}
+
+UINT gf_poly_deg(GF_T *gf, GF_ELE a, UINT alen)
+{
+	register int i;
+	
+	for(i=alen-1;i>0;i--)
+		if(!mpIsZero(a[i], gf->plen))
+			return (UINT)i;
+
+	return 0;
+}
+
+int gf_ele_div(GF_T *gf, GF_ELE q, UINT qlen, GF_ELE r, UINT rlen, GF_ELE a, UINT alen, GF_ELE b, UINT blen)
+{
+	register int i;
+	GF_ELE t;
+	GF_ELE r1;
+	int d;
+	UINT rdeg;
+	UINT adeg;
+	UINT bdeg;
+	DIGIT_T *u;
+	DIGIT_T *v;
+
+	gf_ele_zero(gf, q, qlen);	
+	gf_ele_zero(gf, r, rlen);	
+
+	/* check if b(x) = 0 => oops division by zero */
+	if(gf_ele_is_zero(gf, b, blen))
+		return -1;	
+	
+	/* if degree[a(x)] < degree[b(x)] => no devision needed */
+	if((adeg=gf_poly_deg(gf, a, alen)) < (bdeg=gf_poly_deg(gf, b, blen))) {	
+		if(rlen >= adeg) {		
+			gf_ele_equal(gf, r, a, adeg);
+			return 0;
+		}
+		return -1; /* not enough memory for r(x) */
+	}	
+	
+	/* temp memory */	
+	t = gf_ele_init(gf, alen);
+	r1 = gf_ele_init(gf, alen);
+	u = (DIGIT_T *)malloc(NBYTE(gf->plen));
+	v = (DIGIT_T *)malloc(NBYTE(gf->plen));
+	
+	/* make r1(x) = a(x) */
+	gf_ele_equal(gf, r1, a, alen);
+
+	while(1) {
+		
+		/* compute degree of r1(x) */
+		rdeg = gf_poly_deg(gf, r1, alen);
+	
+		/* if r1(x)'s degree is less than b(x)'s degree, nothing more to be done */
+		/* also if r1(x) = 0, stop dividing */
+		if(((d = rdeg - bdeg) < 0) || gf_ele_is_zero(gf, r1, alen))
+			break;
+		
+		mpModInv(u, b[bdeg], gf->p, gf->plen);
+		mpModMult(v, u, r1[rdeg], gf->p, gf->plen);
+		
+		/* q(x) = q(x) + v*x^d */
+		mpSetEqual(q[d], v, gf->plen);
+
+		/* r1(x) = r1(x) - v*x^d*b(x) */
+		gf_ele_zero(gf, t, alen);
+		for(i=0; i<=bdeg; i++){
+			mpSetEqual(t[i+d], b[i], gf->plen);
+			mpModMult(t[i+d], t[i+d], v, gf->p, gf->plen);
+		}
+		gf_ele_sub(gf, r1, r1, t, rdeg+1);		 
+	}		 
+	
+	/* set r(x) = r1(x) */
+	if(rlen+1 < rdeg){
+		/* not enough memory for r(x), free memory and exit */	
+		gf_ele_free(t, blen);
+		gf_ele_free(r1, blen);
+		
+		return -1;
+	}
+	gf_ele_equal(gf, r, r1, rdeg+1);
+	
+	/* free memory */
+	gf_ele_free(t, blen);
+	gf_ele_free(r1, blen);
+	free(u);
+	free(v);	
+	
+	return 0;
+}
+
+int gf_ele_reduce(GF_T *gf, GF_ELE a, GF_ELE b, UINT blen)
+{
+	/* hic, enough time for trivial	division only */
+	/* anyway, be noted that n_k coeffcient of n(x) is 1 ~ n(x) is monic */
+	GF_ELE t;
+	GF_ELE r;
+	UINT rdeg;
+	register int i;
+	int d;
+		
+	t = gf_ele_init(gf, blen);
+	
+	r = gf_ele_init(gf, blen);
+	
+	/* make r(x) = b(x) */
+	gf_ele_equal(gf, r, b, blen);
+
+	while(1) {
+		
+		/* compute degree of r(x) */
+		rdeg = gf_poly_deg(gf, r, blen);
+		
+		/* if r(x)'s degree is less than k, nothing more to be done */
+		if((d = rdeg - gf->k) < 0)
+			break;
+		
+		/* otherwise, reduce rdeg. First, t(x) = r_{rdeg}*x^{rdeg-k}*n(x) */
+		gf_ele_zero(gf, t, blen);
+		for(i=0; i<=gf->k; i++){
+			mpSetEqual(t[i+d], gf->n[i], gf->plen);
+			mpModMult(t[i+d], t[i+d], r[rdeg], gf->p, gf->plen);
+		}
+		
+		/* Now kill off x^{rdeg} by r(x) = r(x) - t(x) */
+		gf_ele_sub(gf, r, r, t, rdeg+1);
+			 
+	}		 
+	
+	/* set a(x) = r(x)  */
+	gf_ele_equal(gf, a, r, gf->k);
+
+	/* free memory */
+	gf_ele_free(t, blen);
+	gf_ele_free(r, blen);
+	
+	return 0;
+}
+
+int gf_ele_mul(GF_T *gf, GF_ELE a, GF_ELE b, GF_ELE c, UINT len)
+{
+	/* just use trivial multiplication */
+	GF_ELE t1;
+	GF_ELE t2;
+		
+	register int i;
+	register int j;
+	
+	t1 = gf_ele_init(gf, 2*len);
+	t2 = gf_ele_init(gf, 2*len);
+	
+	/* t1(x) = 0 */
+	gf_ele_zero(gf, t1, 2*len);
+	
+
+	for(i=0; i<len; i++){
+		/* t2(x) = b_i*x^i*c(x) */
+		gf_ele_zero(gf, t2, 2*len);		
+		for(j=0; j<len; j++)
+			mpModMult(t2[j+i], c[j], b[i], gf->p, gf->plen);
+		
+		/* t1(x) = t1(x) + t2(x) */
+		gf_ele_add(gf, t1, t1, t2, 2*len);
+	}
+	
+	/* reduce modulo n(x) */
+	gf_ele_reduce(gf, a, t1, 2*len);
+
+	gf_ele_free(t1, 2*len);
+	gf_ele_free(t2, 2*len);
+	
+	return 0;
+}
+
+int gf_ele_sqr(GF_T *gf, GF_ELE a, GF_ELE b, UINT blen)
+{
+	/* no fancy algorithm, no precomputation, just call gf_ele_mul here */	
+	return gf_ele_mul(gf, a, b, b, blen);
+}
+
+int gf_ele_inverse(GF_T *gf, GF_ELE a, GF_ELE b)
+{
+#if 0 
+	/* Use Extended Euclidean Algorithm */
+	GF_ELE	r1;	
+	GF_ELE 	r2;
+	GF_ELE	t1;
+	GF_ELE	t2;
+	GF_ELE  r;
+	GF_ELE  q;
+	GF_ELE	t;
+	DIGIT_T *h;
+	register int i;
+	UINT rdeg;
+	
+	r1 = gf_ele_init(gf, gf->k+1);
+	r2 = gf_ele_init(gf, gf->k+1);
+	t1 = gf_ele_init(gf, gf->k+1);
+	t2 = gf_ele_init(gf, gf->k+1);
+	r = gf_ele_init(gf, gf->k+1);
+	q = gf_ele_init(gf, gf->k+1);
+	t = gf_ele_init(gf, gf->k+1);
+	h = (DIGIT_T *)malloc(NBYTE(gf->plen));
+	
+	/* h = -1 mod p */
+	mpShortSub(h, gf->p, 1, gf->plen);
+
+	/* r1(x) = n(x) */
+	gf_ele_equal(gf, r1, gf->n, gf->k+1);
+
+	/* r2(x) = b(x) */
+	gf_ele_equal(gf, r2, b, gf->k);
+	mpSetZero(r2[gf->k], gf->plen);
+
+	/* t1(x) = 0 */
+	gf_ele_zero(gf, t1, gf->k+1);
+
+	/* t2(x) = 1 */
+	gf_ele_unit(gf, t2, gf->k+1);
+	
+	while(1){
+		/* loop until gcd, which is 1, is reached */
+		rdeg = gf_poly_deg(gf, r2, gf->k+1);
+				
+		if(gf_ele_is_unit(gf, r2, gf->k+1))
+			break;
+
+		/* compute r(x) = r1(x) mod r2(x) */
+		/*     and q(x) =  r1(x) / r2(x) */
+		if(gf_ele_div(gf, q, gf->k+1, r, gf->k+1, r1, gf->k+1, r2, gf->k+1) == -1){
+			printf("Something wrong!\n");
+		}
+	
+		/* for next round, r2(x) = r(x) and r1(x) = r2(x) */ 
+		gf_ele_equal(gf, r1, r2, gf->k+1);		
+		gf_ele_equal(gf, r2, r, gf->k+1);
+
+		/* t(x) = -q(x)*t2(x) + t1(x) */
+		for(i=0; i<gf->k+1; i++)
+			mpModMult(q[i], q[i], h, gf->p, gf->plen);
+		
+		gf_ele_mul(gf, r, q, t2, gf->k+1);	
+		gf_ele_add(gf, t, r, t1, gf->k+1);	
+		
+		/* until finished, inverse a(x) = t(x) */
+		gf_ele_equal(gf, a, t, gf->k); 
+
+		/* for next round: t2(x) = t(x) and t1(x) = t2(x) */		
+		gf_ele_equal(gf, t1, t2, gf->k+1);		
+		gf_ele_equal(gf, t2, t, gf->k+1);
+	}
+	
+	gf_ele_free(r1, gf->k+1);
+	gf_ele_free(r2, gf->k+1);
+	gf_ele_free(t1, gf->k+1);
+	gf_ele_free(t2, gf->k+1);
+	gf_ele_free(r, gf->k+1);
+	gf_ele_free(q, gf->k+1);
+	gf_ele_free(t, gf->k+1);
+#endif
+	/* or just use fermat's theorem, a(x) = b(x)^{p^2-2} mod n(x) */
+	DIGIT_T *q;	
+	
+	q = (DIGIT_T *)malloc(2*NBYTE(gf->plen));
+	mpSquare(q, gf->p, gf->plen);
+	mpShortSub(q, q, 2, 2*gf->plen);
+	
+	gf_ele_exp(gf, a, b, q, 2*gf->plen);
+	
+	free(q);
+
+	return 0;
+}
+
+int gf_ele_exp(GF_T *gf, GF_ELE a, GF_ELE b, DIGIT_T *e, UINT elen)
+{
+	/* binary left-to-right method */	
+	register int i, j;
+	register DIGIT_T mask;
+	
+	/* a(x) = 1 */
+	gf_ele_unit(gf, a, gf->k);
+	
+	for(i=elen-1; i>=0;i--)		
+		for(j=BITS_PER_DIGIT-1, mask = HIBITMASK; j>=0; j--, mask >>= 1){
+			/* a(x) = a(x)^2 */
+			gf_ele_sqr(gf, a, a, gf->k);
+
+			/* if j-th bit in the i-th digit is 1, a(x) = b(x)*a(x) */
+			if(e[i] & mask)				
+				gf_ele_mul(gf, a, a, b, gf->k);	
+		}
+
+	return 0;
+}
+
+void gf_ele_print(GF_T *gf, const char *desc, GF_ELE a, UINT len)
+{
+	register int i;
+
+	printf("[%s]\n", desc);
+	for(i=0;i<len;i++)	
+		mpPrintNL(a[i], gf->plen); 
+}
+
+#define GF_N_STRESS_TEST 1000
+int gf_stress_test(GF_T *gf, GF_ELE a, GF_ELE a2)
+{
+	/* prove that gf_ele_sqr behaves consistently */
+	GF_ELE ele[GF_N_STRESS_TEST];
+	int i, j;
+
+	for(i=0; i<GF_N_STRESS_TEST; i++)
+		ele[i] = gf_ele_init(gf, gf->k);
+	
+	for(i=0; i<GF_N_STRESS_TEST; i++){
+		gf_ele_sqr(gf, ele[i], a, gf->k);
+		if(!gf_ele_is_equal(gf, ele[i], a2, gf->k)){
+			for(j=0; j<GF_N_STRESS_TEST; j++)
+				gf_ele_free(ele[j], gf->k);
+			return 0;
+		}
+	}
+	
+	for(j=0; j<GF_N_STRESS_TEST; j++)
+		gf_ele_free(ele[j], gf->k);
+
+	return 1;	
+}
diff --git a/src/libm/galois.h b/src/libm/galois.h
new file mode 100644
index 000000000000..24bfbaa74825
--- /dev/null
+++ b/src/libm/galois.h
@@ -0,0 +1,101 @@
+/*-----------------------------------------------------------*/
+/* General Galois field implementation using polynomia basis */
+/* This applies for field GF(p^k) with large prime p         */
+/* Author: Dang Nguyen Duc                                   */
+/* Date  : 2007/02/03                                        */
+/*-----------------------------------------------------------*/
+
+#ifndef _GALOIS_H
+#define _GALOIS_H
+
+#include "bigdigits.h"
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#define GF_ELE	DIGIT_T** 	/* one field element is a polynomial in F_p[x]/n(x) */
+
+typedef struct {
+	DIGIT_T		*p;	/* field characteristic */
+	UINT		plen;	/* length of p in digit */	
+	UINT		k;	/* extension degree - small please :) */
+	GF_ELE		n;	/* irreducible polynomial in F_p[x] of order k */
+} GF_T;
+
+/* function prototypes */
+GF_T *gf_init(UINT k, DIGIT_T *p, UINT plen);
+	/* allocate memory for GF_T struct including its members */
+
+void gf_free(GF_T *gf);
+	/* free memory allocated to GF_T struct including its members */
+
+void gf_member_free(GF_T *gf);
+	/* free memory allocated to GF_T struct's members only */
+
+GF_ELE gf_ele_init(GF_T *gf, UINT len);
+	/* intialize a field element */
+
+void gf_ele_free(GF_ELE a, UINT len);
+	/* free memory allocated to a(x) */
+
+int gf_ele_zero(GF_T *gf, GF_ELE a, UINT len);
+	/* make a(x) = 0 */
+
+int gf_ele_is_zero(GF_T *gf, GF_ELE a, UINT len);
+	/* return true if a(x) = 0 */
+
+int gf_ele_unit(GF_T *gf, GF_ELE a, UINT len);
+	/* make a(x) = 1 */
+
+int gf_ele_is_unit(GF_T *gf, GF_ELE a, UINT len);
+	/* return true if a(x) = 1 */
+
+int gf_ele_equal(GF_T *gf, GF_ELE a, GF_ELE b, UINT len);
+	/* make a(x) = b(x) */
+
+int gf_ele_is_equal(GF_T *gf, GF_ELE a, GF_ELE b, UINT len);
+	/* return true if a(x) = b(x) */
+
+int gf_ele_random(GF_T *gf, GF_ELE a, UINT len);
+	/* generate a random polynomial in GF(p^k) */
+
+int gf_ele_add(GF_T *gf, GF_ELE a, GF_ELE b, GF_ELE c, UINT len);
+	/* compute a(x) = b(x) + c(x) */
+
+int gf_ele_sub(GF_T *gf, GF_ELE a, GF_ELE b, GF_ELE c, UINT len);
+	/* compute a(x) = b(x) - c(x) */
+
+UINT gf_poly_deg(GF_T *gf, GF_ELE a, UINT alen);
+	/* return degree of polynomial a(x) */
+
+int gf_ele_reduce(GF_T *gf, GF_ELE a, GF_ELE b, UINT blen);
+	/* compute a(x) = b(x) mod n(x) - n(x) is part gf */
+
+int gf_ele_mul(GF_T *gf, GF_ELE a, GF_ELE b, GF_ELE c, UINT len);
+	/* compute a(x) = b(x)*c(x) mod n(x) */
+
+int gf_ele_sqr(GF_T *gf, GF_ELE a, GF_ELE b, UINT blen);
+	/* compute a(x) = b(x)^2 mod n(x) */
+
+int gf_ele_div(GF_T *gf, GF_ELE q, UINT qlen, GF_ELE r, UINT rlen, GF_ELE a, UINT alen, GF_ELE b, UINT blen);
+	/* polynomial division, compute r(x) and q(x) such that a(x) = b(x)*q(x) + r(x) */
+	/* degree[r(x)] < degree[b(x)] */
+
+int gf_ele_inverse(GF_T *gf, GF_ELE a, GF_ELE b);
+	/* compute multiplicative inverse a(x) = b(x)^{-1} mod n(x) */
+	/* restriction: on degree of b(x) < degree of n(x) */
+
+int gf_ele_exp(GF_T *gf, GF_ELE a, GF_ELE b, DIGIT_T *e, UINT elen);
+	/* compute a(x) = b(x)^e mod n(x) */
+
+void gf_ele_print(GF_T *gf, const char *desc, GF_ELE a, UINT len);
+	/* print out a field element with description */
+
+int gf_stress_test(GF_T *gf, GF_ELE a, GF_ELE a2);
+	
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/src/libm/hash.c b/src/libm/hash.c
new file mode 100644
index 000000000000..d28bbb6f5f45
--- /dev/null
+++ b/src/libm/hash.c
@@ -0,0 +1,114 @@
+/* Hash wrapper functions */
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include "mcrypto.h"
+#include "bigdigits.h"
+#include "hash.h"
+#include "md5.h"
+#include "sha1.h"
+#include "sha2.h"
+
+void GenSeed(BYTE *p, UINT len)
+{
+	prng(p, len);
+}
+
+UINT HashLenQuery(UINT hid)
+{
+	UINT hlen;	/* in byte */
+	
+	switch(hid) {
+	case HASH_MD5:		hlen = 16; break;
+	case HASH_SHA1:		hlen = 20; break;
+	case HASH_SHA256:	hlen = 32; break;
+	case HASH_SHA384:	hlen = 48; break;
+	case HASH_SHA512:	hlen = 64; break;
+	default: hlen = 0;
+	}
+ 	
+ 	return hlen;
+}
+
+int MD5Hash(BYTE *data, UINT len, BYTE *hash)
+{
+	/* To do: length of input checking */
+	MD5_CTX md5context;
+	
+	MD5Init(&md5context);
+	MD5Update(&md5context, data, len);
+	MD5Final(&md5context);
+	
+	memcpy(hash, md5context.digest, 16);
+	
+	return 0;
+}
+
+int SHA1Hash(BYTE *data, UINT len, BYTE *hash)
+{
+	/* To do: length of input checking */
+	SHA1_CTX sha1context;
+	
+	SHA1Init(&sha1context);
+	SHA1Update(&sha1context, data, len);
+	SHA1Final(hash, &sha1context);
+	
+	return 0;
+}
+
+int SHA256Hash(BYTE *data, UINT len, BYTE *hash)
+{
+	/* To do: length of input checking */
+	sha256_ctx sha256context;
+	
+	sha256_begin(&sha256context);
+	sha256_hash(data, len, &sha256context);
+	sha256_end(hash, &sha256context);
+	
+	return 0;
+}
+
+int SHA384Hash(BYTE *data, UINT len, BYTE *hash)
+{
+	/* To do: length of input checking */
+	sha384_ctx sha384context;
+	
+	sha384_begin(&sha384context);
+	sha384_hash(data, len, &sha384context);
+	sha384_end(hash, &sha384context);
+	
+	return 0;
+}
+
+int SHA512Hash(BYTE *data, UINT len, BYTE *hash)
+{
+	/* To do: length of input checking */
+	sha512_ctx sha512context;
+	
+	sha512_begin(&sha512context);
+	sha512_hash(data, len, &sha512context);
+	sha512_end(hash, &sha512context);
+	
+	return 0;
+}
+
+int Hash(UINT hid, BYTE *data, UINT len, BYTE *hash)
+{
+	/* Compute hash value of data */
+	switch(hid) {
+	case HASH_MD5:	  return MD5Hash(data, len, hash); 
+	case HASH_SHA1:	  return SHA1Hash(data, len, hash); 
+	case HASH_SHA256: return SHA256Hash(data, len, hash);
+	case HASH_SHA384: return SHA384Hash(data, len, hash);
+	case HASH_SHA512: return SHA512Hash(data, len, hash);
+	default: return -1;	/* unknown hash algorithm */
+	}
+	
+	return 0;
+}
+
+int Hash2BigInt(UINT hid, BYTE* data, UINT len, DIGIT_T *p)
+{
+	/* have to allocate memory for p yourself */
+	return Hash(hid, data, len, (BYTE *)p);
+}
diff --git a/src/libm/hash.h b/src/libm/hash.h
new file mode 100644
index 000000000000..80babc34d40f
--- /dev/null
+++ b/src/libm/hash.h
@@ -0,0 +1,49 @@
+/* Hash wrapper header file */
+#ifndef _HASH_H_
+#define _HASH_H_
+
+#include "bigdigits.h"
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/* Message-digest algorithms. */
+#define HASH_MD5	1
+#define HASH_SHA1	2
+#define HASH_SHA256	3 
+#define HASH_SHA384	4
+#define HASH_SHA512	5
+
+void GenSeed(BYTE *p, UINT len);
+	/* Generate a len-byte pseudorandom number for hash seed */
+
+int MD5Hash(BYTE *data, UINT len, BYTE *hash);
+	/* MD5 Hash Function Call Interface */
+	
+int SHA1Hash(BYTE *data, UINT len, BYTE *hash);
+	/* SHA1 Hash Function Call Interface */
+
+int SHA256Hash(BYTE *data, UINT len, BYTE *hash);
+	/* SHA256 Hash Function Call Interface */
+	
+int SHA384Hash(BYTE *data, UINT len, BYTE *hash);
+	/* SHA384 Hash Function Call Interface */
+
+int SHA512Hash(BYTE *data, UINT len, BYTE *hash);
+	/* SHA512 Hash Function Call Interface */
+
+int Hash(UINT hid, BYTE *data, UINT len, BYTE *hash);
+	/* Generic Hash Function Call Interface */
+
+UINT HashLenQuery(UINT hid);
+	/* Query Output Length of a Hash Function Specified by hid */
+
+int Hash2BigInt(UINT hid, BYTE* data, UINT len, DIGIT_T *p);
+	/* Hash directly to big integer */
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif	/* _HASH_H_ */
diff --git a/src/libm/mcrypto.h b/src/libm/mcrypto.h
new file mode 100644
index 000000000000..2beaa99cfc09
--- /dev/null
+++ b/src/libm/mcrypto.h
@@ -0,0 +1,34 @@
+/* libmcrypto - math crypto library - header file */
+#ifndef _MCRYPTO_H_
+#define _MCRYPTO_H_
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/* data type macros */
+#define UINT 	unsigned int
+#define BYTE	unsigned char
+#define DWORD 	unsigned long
+
+/* define all return codes here */
+
+/* some C preprocessors to customize the lib operation */
+#define STRONG_RANDOM	1	/* use cryptographic prng rather than rand() function */
+#define LINUX_URANDOM	1	/* use linux's /dev/urandom for cryptographic prng */
+#define N_TEST_PRIME 200	/* The number of rounds for Miller-Rabin primality test */
+
+int prng(BYTE* buf, int buf_size);
+	/* generate pseudo-random numbers using linux's /dev/urandom */
+
+void mcrypto_msg(const char *s);
+	/* enable MCRYPTO_DEBUG to dump simple debug message to stdout */
+
+void mcrypto_dump(char *desc, BYTE *p, UINT len);
+	/* more detail debug information */
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/src/libm/md5.c b/src/libm/md5.c
new file mode 100644
index 000000000000..93150f9cde3b
--- /dev/null
+++ b/src/libm/md5.c
@@ -0,0 +1,296 @@
+/*
+ ***********************************************************************
+ ** md5.c -- the source code for MD5 routines                         **
+ ** RSA Data Security, Inc. MD5 Message-Digest Algorithm              **
+ ** Created: 2/17/90 RLR                                              **
+ ** Revised: 1/91 SRD,AJ,BSK,JT Reference C Version                   **
+ ***********************************************************************
+ */
+
+/*
+ ***********************************************************************
+ ** Copyright (C) 1990, RSA Data Security, Inc. All rights reserved.  **
+ **                                                                   **
+ ** License to copy and use this software is granted provided that    **
+ ** it is identified as the "RSA Data Security, Inc. MD5 Message-     **
+ ** Digest Algorithm" in all material mentioning or referencing this  **
+ ** software or this function.                                        **
+ **                                                                   **
+ ** License is also granted to make and use derivative works          **
+ ** provided that such works are identified as "derived from the RSA  **
+ ** Data Security, Inc. MD5 Message-Digest Algorithm" in all          **
+ ** material mentioning or referencing the derived work.              **
+ **                                                                   **
+ ** RSA Data Security, Inc. makes no representations concerning       **
+ ** either the merchantability of this software or the suitability    **
+ ** of this software for any particular purpose.  It is provided "as  **
+ ** is" without express or implied warranty of any kind.              **
+ **                                                                   **
+ ** These notices must be retained in any copies of any part of this  **
+ ** documentation and/or software.                                    **
+ ***********************************************************************
+ */
+
+#include "md5.h"
+
+/*
+ ***********************************************************************
+ **  Message-digest routines:                                         **
+ **  To form the message digest for a message M                       **
+ **    (1) Initialize a context buffer mdContext using MD5Init        **
+ **    (2) Call MD5Update on mdContext and M                          **
+ **    (3) Call MD5Final on mdContext                                 **
+ **  The message digest is now in mdContext->digest[0...15]           **
+ ***********************************************************************
+ */
+
+/* forward declaration */
+static void Transform ();
+
+static unsigned char PADDING[64] = {
+  0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+
+/* F, G, H and I are basic MD5 functions */
+#define F(x, y, z) (((x) & (y)) | ((~x) & (z)))
+#define G(x, y, z) (((x) & (z)) | ((y) & (~z)))
+#define H(x, y, z) ((x) ^ (y) ^ (z))
+#define I(x, y, z) ((y) ^ ((x) | (~z)))
+
+/* ROTATE_LEFT rotates x left n bits */
+#define ROTATE_LEFT(x, n) (((x) << (n)) | ((x) >> (32-(n))))
+
+/* FF, GG, HH, and II transformations for rounds 1, 2, 3, and 4 */
+/* Rotation is separate from addition to prevent recomputation */
+#define FF(a, b, c, d, x, s, ac) \
+  {(a) += F ((b), (c), (d)) + (x) + (UINT4)(ac); \
+   (a) = ROTATE_LEFT ((a), (s)); \
+   (a) += (b); \
+  }
+#define GG(a, b, c, d, x, s, ac) \
+  {(a) += G ((b), (c), (d)) + (x) + (UINT4)(ac); \
+   (a) = ROTATE_LEFT ((a), (s)); \
+   (a) += (b); \
+  }
+#define HH(a, b, c, d, x, s, ac) \
+  {(a) += H ((b), (c), (d)) + (x) + (UINT4)(ac); \
+   (a) = ROTATE_LEFT ((a), (s)); \
+   (a) += (b); \
+  }
+#define II(a, b, c, d, x, s, ac) \
+  {(a) += I ((b), (c), (d)) + (x) + (UINT4)(ac); \
+   (a) = ROTATE_LEFT ((a), (s)); \
+   (a) += (b); \
+  }
+
+/* The routine MD5Init initializes the message-digest context
+   mdContext. All fields are set to zero.
+ */
+void MD5Init (mdContext)
+MD5_CTX *mdContext;
+{
+  mdContext->i[0] = mdContext->i[1] = (UINT4)0;
+
+  /* Load magic initialization constants.
+   */
+  mdContext->buf[0] = (UINT4)0x67452301;
+  mdContext->buf[1] = (UINT4)0xefcdab89;
+  mdContext->buf[2] = (UINT4)0x98badcfe;
+  mdContext->buf[3] = (UINT4)0x10325476;
+}
+
+/* The routine MD5Update updates the message-digest context to
+   account for the presence of each of the characters inBuf[0..inLen-1]
+   in the message whose digest is being computed.
+ */
+void MD5Update (mdContext, inBuf, inLen)
+MD5_CTX *mdContext;
+unsigned char *inBuf;
+unsigned int inLen;
+{
+  UINT4 in[16];
+  int mdi;
+  unsigned int i, ii;
+
+  /* compute number of bytes mod 64 */
+  mdi = (int)((mdContext->i[0] >> 3) & 0x3F);
+
+  /* update number of bits */
+  if ((mdContext->i[0] + ((UINT4)inLen << 3)) < mdContext->i[0])
+    mdContext->i[1]++;
+  mdContext->i[0] += ((UINT4)inLen << 3);
+  mdContext->i[1] += ((UINT4)inLen >> 29);
+
+  while (inLen--) {
+    /* add new character to buffer, increment mdi */
+    mdContext->in[mdi++] = *inBuf++;
+
+    /* transform if necessary */
+    if (mdi == 0x40) {
+      for (i = 0, ii = 0; i < 16; i++, ii += 4)
+        in[i] = (((UINT4)mdContext->in[ii+3]) << 24) |
+                (((UINT4)mdContext->in[ii+2]) << 16) |
+                (((UINT4)mdContext->in[ii+1]) << 8) |
+                ((UINT4)mdContext->in[ii]);
+      Transform (mdContext->buf, in);
+      mdi = 0;
+    }
+  }
+}
+
+/* The routine MD5Final terminates the message-digest computation and
+   ends with the desired message digest in mdContext->digest[0...15].
+ */
+void MD5Final (mdContext)
+MD5_CTX *mdContext;
+{
+  UINT4 in[16];
+  int mdi;
+  unsigned int i, ii;
+  unsigned int padLen;
+
+  /* save number of bits */
+  in[14] = mdContext->i[0];
+  in[15] = mdContext->i[1];
+
+  /* compute number of bytes mod 64 */
+  mdi = (int)((mdContext->i[0] >> 3) & 0x3F);
+
+  /* pad out to 56 mod 64 */
+  padLen = (mdi < 56) ? (56 - mdi) : (120 - mdi);
+  MD5Update (mdContext, PADDING, padLen);
+
+  /* append length in bits and transform */
+  for (i = 0, ii = 0; i < 14; i++, ii += 4)
+    in[i] = (((UINT4)mdContext->in[ii+3]) << 24) |
+            (((UINT4)mdContext->in[ii+2]) << 16) |
+            (((UINT4)mdContext->in[ii+1]) << 8) |
+            ((UINT4)mdContext->in[ii]);
+  Transform (mdContext->buf, in);
+
+  /* store buffer in digest */
+  for (i = 0, ii = 0; i < 4; i++, ii += 4) {
+    mdContext->digest[ii] = (unsigned char)(mdContext->buf[i] & 0xFF);
+    mdContext->digest[ii+1] =
+      (unsigned char)((mdContext->buf[i] >> 8) & 0xFF);
+    mdContext->digest[ii+2] =
+      (unsigned char)((mdContext->buf[i] >> 16) & 0xFF);
+    mdContext->digest[ii+3] =
+      (unsigned char)((mdContext->buf[i] >> 24) & 0xFF);
+  }
+}
+
+/* Basic MD5 step. Transforms buf based on in.
+ */
+static void Transform (buf, in)
+UINT4 *buf;
+UINT4 *in;
+{
+  UINT4 a = buf[0], b = buf[1], c = buf[2], d = buf[3];
+
+  /* Round 1 */
+#define S11 7
+#define S12 12
+#define S13 17
+#define S14 22
+  FF ( a, b, c, d, in[ 0], S11, 3614090360); /* 1 */
+  FF ( d, a, b, c, in[ 1], S12, 3905402710); /* 2 */
+  FF ( c, d, a, b, in[ 2], S13,  606105819); /* 3 */
+  FF ( b, c, d, a, in[ 3], S14, 3250441966); /* 4 */
+  FF ( a, b, c, d, in[ 4], S11, 4118548399); /* 5 */
+  FF ( d, a, b, c, in[ 5], S12, 1200080426); /* 6 */
+  FF ( c, d, a, b, in[ 6], S13, 2821735955); /* 7 */
+  FF ( b, c, d, a, in[ 7], S14, 4249261313); /* 8 */
+  FF ( a, b, c, d, in[ 8], S11, 1770035416); /* 9 */
+  FF ( d, a, b, c, in[ 9], S12, 2336552879); /* 10 */
+  FF ( c, d, a, b, in[10], S13, 4294925233); /* 11 */
+  FF ( b, c, d, a, in[11], S14, 2304563134); /* 12 */
+  FF ( a, b, c, d, in[12], S11, 1804603682); /* 13 */
+  FF ( d, a, b, c, in[13], S12, 4254626195); /* 14 */
+  FF ( c, d, a, b, in[14], S13, 2792965006); /* 15 */
+  FF ( b, c, d, a, in[15], S14, 1236535329); /* 16 */
+
+  /* Round 2 */
+#define S21 5
+#define S22 9
+#define S23 14
+#define S24 20
+  GG ( a, b, c, d, in[ 1], S21, 4129170786); /* 17 */
+  GG ( d, a, b, c, in[ 6], S22, 3225465664); /* 18 */
+  GG ( c, d, a, b, in[11], S23,  643717713); /* 19 */
+  GG ( b, c, d, a, in[ 0], S24, 3921069994); /* 20 */
+  GG ( a, b, c, d, in[ 5], S21, 3593408605); /* 21 */
+  GG ( d, a, b, c, in[10], S22,   38016083); /* 22 */
+  GG ( c, d, a, b, in[15], S23, 3634488961); /* 23 */
+  GG ( b, c, d, a, in[ 4], S24, 3889429448); /* 24 */
+  GG ( a, b, c, d, in[ 9], S21,  568446438); /* 25 */
+  GG ( d, a, b, c, in[14], S22, 3275163606); /* 26 */
+  GG ( c, d, a, b, in[ 3], S23, 4107603335); /* 27 */
+  GG ( b, c, d, a, in[ 8], S24, 1163531501); /* 28 */
+  GG ( a, b, c, d, in[13], S21, 2850285829); /* 29 */
+  GG ( d, a, b, c, in[ 2], S22, 4243563512); /* 30 */
+  GG ( c, d, a, b, in[ 7], S23, 1735328473); /* 31 */
+  GG ( b, c, d, a, in[12], S24, 2368359562); /* 32 */
+
+  /* Round 3 */
+#define S31 4
+#define S32 11
+#define S33 16
+#define S34 23
+  HH ( a, b, c, d, in[ 5], S31, 4294588738); /* 33 */
+  HH ( d, a, b, c, in[ 8], S32, 2272392833); /* 34 */
+  HH ( c, d, a, b, in[11], S33, 1839030562); /* 35 */
+  HH ( b, c, d, a, in[14], S34, 4259657740); /* 36 */
+  HH ( a, b, c, d, in[ 1], S31, 2763975236); /* 37 */
+  HH ( d, a, b, c, in[ 4], S32, 1272893353); /* 38 */
+  HH ( c, d, a, b, in[ 7], S33, 4139469664); /* 39 */
+  HH ( b, c, d, a, in[10], S34, 3200236656); /* 40 */
+  HH ( a, b, c, d, in[13], S31,  681279174); /* 41 */
+  HH ( d, a, b, c, in[ 0], S32, 3936430074); /* 42 */
+  HH ( c, d, a, b, in[ 3], S33, 3572445317); /* 43 */
+  HH ( b, c, d, a, in[ 6], S34,   76029189); /* 44 */
+  HH ( a, b, c, d, in[ 9], S31, 3654602809); /* 45 */
+  HH ( d, a, b, c, in[12], S32, 3873151461); /* 46 */
+  HH ( c, d, a, b, in[15], S33,  530742520); /* 47 */
+  HH ( b, c, d, a, in[ 2], S34, 3299628645); /* 48 */
+
+  /* Round 4 */
+#define S41 6
+#define S42 10
+#define S43 15
+#define S44 21
+  II ( a, b, c, d, in[ 0], S41, 4096336452); /* 49 */
+  II ( d, a, b, c, in[ 7], S42, 1126891415); /* 50 */
+  II ( c, d, a, b, in[14], S43, 2878612391); /* 51 */
+  II ( b, c, d, a, in[ 5], S44, 4237533241); /* 52 */
+  II ( a, b, c, d, in[12], S41, 1700485571); /* 53 */
+  II ( d, a, b, c, in[ 3], S42, 2399980690); /* 54 */
+  II ( c, d, a, b, in[10], S43, 4293915773); /* 55 */
+  II ( b, c, d, a, in[ 1], S44, 2240044497); /* 56 */
+  II ( a, b, c, d, in[ 8], S41, 1873313359); /* 57 */
+  II ( d, a, b, c, in[15], S42, 4264355552); /* 58 */
+  II ( c, d, a, b, in[ 6], S43, 2734768916); /* 59 */
+  II ( b, c, d, a, in[13], S44, 1309151649); /* 60 */
+  II ( a, b, c, d, in[ 4], S41, 4149444226); /* 61 */
+  II ( d, a, b, c, in[11], S42, 3174756917); /* 62 */
+  II ( c, d, a, b, in[ 2], S43,  718787259); /* 63 */
+  II ( b, c, d, a, in[ 9], S44, 3951481745); /* 64 */
+
+  buf[0] += a;
+  buf[1] += b;
+  buf[2] += c;
+  buf[3] += d;
+}
+
+/*
+ ***********************************************************************
+ ** End of md5.c                                                      **
+ ******************************** (cut) ********************************
+ */
diff --git a/src/libm/md5.h b/src/libm/md5.h
new file mode 100644
index 000000000000..8a23a20293b4
--- /dev/null
+++ b/src/libm/md5.h
@@ -0,0 +1,57 @@
+/*
+ ***********************************************************************
+ ** md5.h -- header file for implementation of MD5                    **
+ ** RSA Data Security, Inc. MD5 Message-Digest Algorithm              **
+ ** Created: 2/17/90 RLR                                              **
+ ** Revised: 12/27/90 SRD,AJ,BSK,JT Reference C version               **
+ ** Revised (for MD5): RLR 4/27/91                                    **
+ **   -- G modified to have y&~z instead of y&z                       **
+ **   -- FF, GG, HH modified to add in last register done             **
+ **   -- Access pattern: round 2 works mod 5, round 3 works mod 3     **
+ **   -- distinct additive constant for each step                     **
+ **   -- round 4 added, working mod 7                                 **
+ ***********************************************************************
+ */
+
+/*
+ ***********************************************************************
+ ** Copyright (C) 1990, RSA Data Security, Inc. All rights reserved.  **
+ **                                                                   **
+ ** License to copy and use this software is granted provided that    **
+ ** it is identified as the "RSA Data Security, Inc. MD5 Message-     **
+ ** Digest Algorithm" in all material mentioning or referencing this  **
+ ** software or this function.                                        **
+ **                                                                   **
+ ** License is also granted to make and use derivative works          **
+ ** provided that such works are identified as "derived from the RSA  **
+ ** Data Security, Inc. MD5 Message-Digest Algorithm" in all          **
+ ** material mentioning or referencing the derived work.              **
+ **                                                                   **
+ ** RSA Data Security, Inc. makes no representations concerning       **
+ ** either the merchantability of this software or the suitability    **
+ ** of this software for any particular purpose.  It is provided "as  **
+ ** is" without express or implied warranty of any kind.              **
+ **                                                                   **
+ ** These notices must be retained in any copies of any part of this  **
+ ** documentation and/or software.                                    **
+ ***********************************************************************
+ */
+
+#ifndef _MD5_H
+#define _MD5_H
+/* typedef a 32-bit type */
+typedef unsigned long UINT4;
+
+/* Data structure for MD5 (Message-Digest) computation */
+typedef struct {
+  UINT4 i[2];                   /* number of _bits_ handled mod 2^64 */
+  UINT4 buf[4];                                    /* scratch buffer */
+  unsigned char in[64];                              /* input buffer */
+  unsigned char digest[16];     /* actual digest after MD5Final call */
+} MD5_CTX;
+
+void MD5Init ();
+void MD5Update ();
+void MD5Final ();
+
+#endif
diff --git a/src/libm/mpAND.c b/src/libm/mpAND.c
new file mode 100644
index 000000000000..1a04c7368015
--- /dev/null
+++ b/src/libm/mpAND.c
@@ -0,0 +1,9 @@
+/* mpAND.c: multi-precision bitwise AND */
+
+#include "bigdigits.h"
+
+void mpAND(DIGIT_T a[], const DIGIT_T x[], const DIGIT_T y[], UINT ndigits)	
+{
+	while(ndigits--)
+		a[ndigits] = x[ndigits] & y[ndigits];
+}
diff --git a/src/libm/mpAdd.c b/src/libm/mpAdd.c
new file mode 100644
index 000000000000..b5624cf3250c
--- /dev/null
+++ b/src/libm/mpAdd.c
@@ -0,0 +1,41 @@
+/* mpAdd.c */
+
+#include <assert.h>
+#include "bigdigits.h"
+
+DIGIT_T mpAdd(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T v[], UINT ndigits)
+{
+	/*	Calculates w = u + v
+		where w, u, v are multiprecision integers of ndigits each
+		Returns carry if overflow. Carry = 0 or 1.
+
+		Ref: Knuth Vol 2 Ch 4.3.1 p 266 Algorithm A.
+	*/
+
+	DIGIT_T k;
+	UINT j;
+	
+	assert(w != v);
+
+	/* Step A1. Initialise */
+	k = 0;
+
+	for (j = 0; j < ndigits; j++) {
+		/*	Step A2. Add digits w_j = (u_j + v_j + k)
+			Set k = 1 if carry (overflow) occurs
+		*/
+		w[j] = u[j] + k;
+		if (w[j] < k)
+			k = 1;
+		else
+			k = 0;
+		
+		w[j] += v[j];
+		if (w[j] < v[j])
+			k++;
+
+	}	/* Step A3. Loop on j */
+
+	return k;	/* w_n = k */
+}
+
diff --git a/src/libm/mpBitLength.c b/src/libm/mpBitLength.c
new file mode 100644
index 000000000000..0400796ed1a9
--- /dev/null
+++ b/src/libm/mpBitLength.c
@@ -0,0 +1,24 @@
+/* mpBitLength - return bit length of a big integer */
+#include "bigdigits.h"
+
+UINT mpBitLength(const DIGIT_T d[], UINT ndigits)
+{
+	UINT n, i, bits;
+	DIGIT_T mask;
+
+	if (!d || ndigits == 0)
+		return 0;
+
+	n = mpSizeof(d, ndigits);
+	if (0 == n) return 0;
+
+	for (i = 0, mask = HIBITMASK; mask > 0; mask >>= 1, i++)
+	{
+		if (d[n-1] & mask)
+			break;
+	}
+
+	bits = n * BITS_PER_DIGIT - i;
+
+	return bits;
+}
diff --git a/src/libm/mpCompare.c b/src/libm/mpCompare.c
new file mode 100644
index 000000000000..4e26c2960e61
--- /dev/null
+++ b/src/libm/mpCompare.c
@@ -0,0 +1,21 @@
+/* mpCompare.c */
+
+#include "bigdigits.h"
+
+int mpCompare(const DIGIT_T a[], const DIGIT_T b[], UINT ndigits)
+{
+	/*	Returns sign of (a - b)
+	*/
+
+	if (ndigits == 0) return 0;
+
+	while (ndigits--){
+		if (a[ndigits] > b[ndigits])
+			return 1;	/* GT */
+		if (a[ndigits] < b[ndigits])
+			return -1;	/* LT */
+	}
+
+	return 0;	/* EQ */
+}
+
diff --git a/src/libm/mpComplement.c b/src/libm/mpComplement.c
new file mode 100644
index 000000000000..233200b908d9
--- /dev/null
+++ b/src/libm/mpComplement.c
@@ -0,0 +1,9 @@
+/* mpComplement.c: multi-precicion bitwise complement */
+
+#include "bigdigits.h"
+
+void mpComplement(DIGIT_T a[], const DIGIT_T b[], UINT ndigits)
+{
+	while(ndigits--)
+		 a[ndigits] = ~b[ndigits];
+}
diff --git a/src/libm/mpDivide.c b/src/libm/mpDivide.c
new file mode 100644
index 000000000000..53c4209bd3ed
--- /dev/null
+++ b/src/libm/mpDivide.c
@@ -0,0 +1,202 @@
+/* mpDivide.c */
+
+#include "bigdigits.h"
+
+static DIGIT_T mpMultSub(DIGIT_T wn, DIGIT_T w[], const DIGIT_T v[], DIGIT_T q, UINT n);
+
+static int QhatTooBig(DIGIT_T qhat, DIGIT_T rhat, DIGIT_T vn2, DIGIT_T ujn2);
+
+int mpDivide(DIGIT_T q[], DIGIT_T r[], const DIGIT_T u[], UINT udigits, const DIGIT_T v[], UINT vdigits)
+{	/*	Computes quotient q = u / v and remainder r = u mod v
+		where q, r, u are multiple precision digits
+		all of udigits and the divisor v is vdigits.
+
+		Ref: Knuth Vol 2 Ch 4.3.1 p 272 Algorithm D.
+
+		Do without extra storage space, i.e. use r[] for
+		normalised u[], unnormalise v[] at end, and cope with
+		extra digit Uj+n added to u after normalisation.
+
+		WARNING: this trashes q and r first, so cannot do
+		u = u / v or v = u mod v.
+	*/
+	UINT shift;
+	int n, m, j;
+	DIGIT_T bitmask, overflow;
+	DIGIT_T qhat, rhat, t[2];
+	DIGIT_T *uu, *ww;
+	int qhatOK, cmp;
+
+	/* Clear q and r */
+	mpSetZero(q, udigits);
+	mpSetZero(r, udigits);
+
+	/* Work out exact sizes of u and v */
+	n = (int)mpSizeof(v, vdigits);
+	m = (int)mpSizeof(u, udigits);
+	m -= n;
+
+	/* Catch special cases */
+	if (n == 0)
+		return -1;	/* Error: divide by zero */
+
+	if (n == 1){	
+		/* Use short division instead */
+		r[0] = mpShortDiv(q, u, v[0], udigits);
+		return 0;
+	}
+
+	if (m < 0){	
+		/* v > u, so just set q = 0 and r = u */
+		mpSetEqual(r, u, udigits);
+		return 0;
+	}
+
+	if (m == 0){	
+		/* u and v are the same length */
+		cmp = mpCompare(u, v, (UINT)n);
+		if (cmp < 0){	
+			/* v > u, as above */
+			mpSetEqual(r, u, udigits);
+			return 0;
+		}
+		else if (cmp == 0){	
+			/* v == u, so set q = 1 and r = 0 */
+			mpSetDigit(q, 1, udigits);
+			return 0;
+		}
+	}
+
+	/*	In Knuth notation, we have:
+		Given
+		u = (Um+n-1 ... U1U0)
+		v = (Vn-1 ... V1V0)
+		Compute
+		q = u/v = (QmQm-1 ... Q0)
+		r = u mod v = (Rn-1 ... R1R0)
+	*/
+
+	/*	Step D1. Normalise */
+	/*	Requires high bit of Vn-1
+		to be set, so find most signif. bit then shift left,
+		i.e. d = 2^shift, u' = u * d, v' = v * d.
+	*/
+	bitmask = HIBITMASK;
+	for (shift = 0; shift < BITS_PER_DIGIT; shift++){
+		if (v[n-1] & bitmask)
+			break;
+		bitmask >>= 1;
+	}
+
+	/* Normalise v in situ - NB only shift non-zero digits */
+	overflow = mpShiftLeft(v, v, shift, n);
+
+	/* Copy normalised dividend u*d into r */
+	overflow = mpShiftLeft(r, u, shift, n + m);
+	uu = r;	/* Use ptr to keep notation constant */
+
+	t[0] = overflow;	/* New digit Um+n */
+
+	/* Step D2. Initialise j. Set j = m */
+	for (j = m; j >= 0; j--){
+		/* Step D3. Calculate Qhat = (b.Uj+n + Uj+n-1)/Vn-1 */
+		qhatOK = 0;
+		t[1] = t[0];	/* This is Uj+n */
+		t[0] = uu[j+n-1];
+		overflow = spDivide(&qhat, &rhat, t, v[n-1]);
+
+		/* Test Qhat */
+		if (overflow){	
+			/* Qhat = b */
+			qhat = MAX_DIGIT;
+			rhat = uu[j+n-1];
+			rhat += v[n-1];
+			if (rhat < v[n-1])	/* Overflow */
+				qhatOK = 1;
+		}
+		if (!qhatOK && QhatTooBig(qhat, rhat, v[n-2], uu[j+n-2])){	
+			/* Qhat.Vn-2 > b.Rhat + Uj+n-2 */
+			qhat--;
+			rhat += v[n-1];
+			if (!(rhat < v[n-1]))
+				if (QhatTooBig(qhat, rhat, v[n-2], uu[j+n-2]))
+					qhat--;
+		}
+
+
+		/* Step D4. Multiply and subtract */
+		ww = &uu[j];
+		overflow = mpMultSub(t[1], ww, v, qhat, (UINT)n);
+
+		/* Step D5. Test remainder. Set Qj = Qhat */
+		q[j] = qhat;
+		if (overflow){	
+			/* Step D6. Add back if D4 was negative */
+			q[j]--;
+			overflow = mpAdd(ww, ww, v, (UINT)n);
+		}
+
+		t[0] = uu[j+n-1];	/* Uj+n on next round */
+
+	}	/* Step D7. Loop on j */
+
+	/* Clear high digits in uu */
+	for (j = n; j < m+n; j++)
+		uu[j] = 0;
+
+	/* Step D8. Unnormalise. */
+
+	mpShiftRight(r, r, shift, n);
+	mpShiftRight(v, v, shift, n);
+
+	return 0;
+}
+
+static DIGIT_T mpMultSub(DIGIT_T wn, DIGIT_T w[], const DIGIT_T v[], DIGIT_T q, UINT n)
+{	/*	Compute w = w - qv
+		where w = (WnW[n-1]...W[0])
+		return modified Wn.
+	*/
+	DIGIT_T k, t[2];
+	UINT i;
+
+	if (q == 0)	/* No change */
+		return wn;
+
+	k = 0;
+
+	for (i = 0; i < n; i++){
+		spMultiply(t, q, v[i]);
+		w[i] -= k;
+		if (w[i] > MAX_DIGIT - k)
+			k = 1;
+		else
+			k = 0;
+		w[i] -= t[0];
+		if (w[i] > MAX_DIGIT - t[0])
+			k++;
+		k += t[1];
+	}
+
+	/* Cope with Wn not stored in array w[0..n-1] */
+	wn -= k;
+
+	return wn;
+}
+
+static int QhatTooBig(DIGIT_T qhat, DIGIT_T rhat, DIGIT_T vn2, DIGIT_T ujn2)
+{	/*	Returns true if Qhat is too big
+		i.e. if (Qhat * Vn-2) > (b.Rhat + Uj+n-2)
+	*/
+	DIGIT_T t[2];
+
+	spMultiply(t, qhat, vn2);
+	if (t[1] < rhat)
+		return 0;
+	else if (t[1] > rhat)
+		return 1;
+	else if (t[0] > ujn2)
+		return 1;
+
+	return 0;
+}
diff --git a/src/libm/mpEqual.c b/src/libm/mpEqual.c
new file mode 100644
index 000000000000..9f6a36b1effc
--- /dev/null
+++ b/src/libm/mpEqual.c
@@ -0,0 +1,19 @@
+/* mpEqual.c */
+
+#include "bigdigits.h"
+
+int mpEqual(const DIGIT_T a[], const DIGIT_T b[], UINT ndigits)
+{
+	/*	Returns true if a == b, else false
+	*/
+
+	if (ndigits == 0) return -1;
+
+	while (ndigits--){
+		if (a[ndigits] != b[ndigits])
+			return 0;	/* False */
+	}
+
+	return (!0);	/* True */
+}
+
diff --git a/src/libm/mpGcd.c b/src/libm/mpGcd.c
new file mode 100644
index 000000000000..345a1dadcc72
--- /dev/null
+++ b/src/libm/mpGcd.c
@@ -0,0 +1,26 @@
+/* mpGcd.c */
+
+#include "bigdigits.h"
+
+int mpGcd(DIGIT_T g[], const DIGIT_T x[], const DIGIT_T y[], UINT ndigits)
+{	
+	/* Computes g = gcd(x, y) */
+	/* Ref: Schneier  */
+
+	/*	NB This function requires temp storage 
+	*/
+	DIGIT_T yy[MAX_DIG_LEN], xx[MAX_DIG_LEN];
+	
+	mpSetEqual(xx, x, ndigits);
+	mpSetEqual(yy, y, ndigits);
+
+	mpSetEqual(g, yy, ndigits);		/* g = y */
+	
+	while (!mpIsZero(xx, ndigits)){	
+		mpSetEqual(g, xx, ndigits);	/* g = x */
+		mpModulo(xx, yy, ndigits, xx, ndigits);	/* x = y mod x */
+		mpSetEqual(yy, g, ndigits);	/* y = g; */
+	}
+
+	return 0;	/* gcd is in g */
+}
diff --git a/src/libm/mpHalfDiv.c b/src/libm/mpHalfDiv.c
new file mode 100644
index 000000000000..abf37d69a457
--- /dev/null
+++ b/src/libm/mpHalfDiv.c
@@ -0,0 +1,99 @@
+/* mpHalfDiv.c */
+
+#include "bigdigits.h"
+
+/* Two alternative methods - Knuth and Zimmerman */
+DIGIT_T mpHalfDivK(DIGIT_T q[], const DIGIT_T u[], HALF_DIGIT_T v, UINT ndigits);
+DIGIT_T mpHalfDivZ(DIGIT_T q[], const DIGIT_T a[], HALF_DIGIT_T d, UINT ndigits);
+
+DIGIT_T mpHalfDiv(DIGIT_T q[], const DIGIT_T u[], HALF_DIGIT_T v, UINT ndigits)
+{
+	return mpHalfDivK(q, u, v, ndigits);
+}
+
+DIGIT_T mpHalfDivK(DIGIT_T q[], const DIGIT_T u[], HALF_DIGIT_T v, UINT ndigits)
+{
+	/*	Calculates quotient q = u div v
+		Returns remainder r = u mod v
+		where q, u are multiprecision integers of ndigits each
+		and d, v are single precision digits
+		
+		d must be <= MAX_HALF_DIGIT
+
+		Ref: Knuth Vol 2 Ch 4.3.1 Exercise 16 p625
+	*/
+	UINT j;
+	DIGIT_T t, r, qHigh, qLow;
+
+	if (ndigits == 0) return 0;
+	if (v == 0)	return 0;	/* Divide by zero error */
+
+	/* Step S1. */
+	r = 0;
+	j = ndigits;
+	while (j--) {
+		/* Step S2. */
+		t = TOHIGH(r) | HIHALF(u[j]);
+		qHigh = t / v;
+		r = t - qHigh * v;
+
+		t = TOHIGH(r) | LOHALF(u[j]);
+		qLow = t / v;
+		r = t - qLow * v;
+
+		q[j] = TOHIGH(qHigh) | qLow;
+	}
+
+	return r;
+}
+
+DIGIT_T mpHalfDivZ(DIGIT_T q[], const DIGIT_T a[], HALF_DIGIT_T d, UINT ndigits)
+{
+	/*	Calculates quotient q = a div d
+		Returns remainder r = a mod d
+		where q, a are multiprecision integers of ndigits each
+		and d, r are single precision digits
+		using bit-by-bit method from left to right.
+
+		d must be <= MAX_HALF_DIGIT
+
+		Ref: Principles in PGP by Phil Zimmermann
+	*/
+
+	DIGIT_T mask = HIBITMASK;
+	DIGIT_T r = 0;
+	UINT i;
+
+	if (ndigits == 0) return 0;
+
+	/* Initialise quotient */
+	for (i = 0; i < ndigits; i++)
+		q[i] = 0;
+	
+	while (ndigits)
+	{	/* Work from left to right */
+
+		r <<= 1;	/* Multiply remainder by 2 */
+
+		/* Look at current bit */
+		if (a[ndigits-1] & mask)
+			r++;
+		if (r >= d)
+		{
+			r -= d;
+			q[ndigits-1] |= mask;
+		}
+
+		/* Move to next bit */
+		if (mask == 1)
+		{
+			mask = HIBITMASK;
+			ndigits--;
+		}
+		else
+			mask >>= 1;
+	}
+	
+	return r;
+}
+
diff --git a/src/libm/mpHalfMod.c b/src/libm/mpHalfMod.c
new file mode 100644
index 000000000000..2e2dc8ad9b98
--- /dev/null
+++ b/src/libm/mpHalfMod.c
@@ -0,0 +1,46 @@
+/* mpHalfMod.c */
+
+
+#include "bigdigits.h"
+
+DIGIT_T mpHalfMod(const DIGIT_T a[], HALF_DIGIT_T d, UINT ndigits)
+{
+	/*	Calculates r = a mod d
+		where a is a multiprecision integer of ndigits
+		and r, d are single precision digits
+		using bit-by-bit method from left to right.
+
+		Ref: Derived from principles in PGP by Phil Zimmermann
+		Note: This method will only work until r <<= 1 overflows.
+		i.e. for d < HIBITMASK, but we keep HALF_DIGIT
+		limit for safety 
+		(and also because we don't have a 31/32nds_digit).
+	*/
+
+	DIGIT_T mask = HIBITMASK;
+	DIGIT_T r = 0;
+
+	if (ndigits == 0) return 0;
+
+	while (ndigits){	
+		/* Work from left to right */
+		r <<= 1;	/* Multiply remainder by 2 */
+
+		/* Look at current bit */
+		if (a[ndigits-1] & mask)
+			r++;
+		if (r >= d)
+			r -= d;
+
+		/* Move to next bit */
+		if (mask == 1){
+			mask = HIBITMASK;
+			ndigits--;
+		}
+		else
+			mask >>= 1;
+	}
+	
+	return r;
+}
+
diff --git a/src/libm/mpIsOne.c b/src/libm/mpIsOne.c
new file mode 100644
index 000000000000..c785c1b780d2
--- /dev/null
+++ b/src/libm/mpIsOne.c
@@ -0,0 +1,18 @@
+/* mpIsOne.c */
+
+#include "bigdigits.h"
+
+int mpIsOne(const DIGIT_T a[], UINT ndigits)
+{
+	UINT i;
+	if (ndigits == 0) 
+		return -1;
+
+	for (i = 1; i < ndigits; i++){
+		if (a[i] != 0)
+			return 0;	/* False */
+	}
+
+	return (a[0]==1);
+}
+
diff --git a/src/libm/mpIsPrime.c b/src/libm/mpIsPrime.c
new file mode 100644
index 000000000000..ae235d01616e
--- /dev/null
+++ b/src/libm/mpIsPrime.c
@@ -0,0 +1,124 @@
+/* mpIsPrime.c */
+
+#include "bigdigits.h"
+
+static DIGIT_T SMALL_PRIMES[] = {
+	3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 
+	47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 
+	103, 107, 109, 113,
+	127, 131, 137, 139, 149, 151, 157, 163, 167, 173,
+	179, 181, 191, 193, 197, 199, 211, 223, 227, 229,
+	233, 239, 241, 251, 257, 263, 269, 271, 277, 281,
+	283, 293, 307, 311, 313, 317, 331, 337, 347, 349,
+	353, 359, 367, 373, 379, 383, 389, 397, 401, 409,
+	419, 421, 431, 433, 439, 443, 449, 457, 461, 463,
+	467, 479, 487, 491, 499, 503, 509, 521, 523, 541,
+	547, 557, 563, 569, 571, 577, 587, 593, 599, 601,
+	607, 613, 617, 619, 631, 641, 643, 647, 653, 659,
+	661, 673, 677, 683, 691, 701, 709, 719, 727, 733,
+	739, 743, 751, 757, 761, 769, 773, 787, 797, 809,
+	811, 821, 823, 827, 829, 839, 853, 857, 859, 863,
+	877, 881, 883, 887, 907, 911, 919, 929, 937, 941,
+	947, 953, 967, 971, 977, 983, 991, 997,
+};
+
+#define N_SMALL_PRIMES (sizeof(SMALL_PRIMES)/sizeof(DIGIT_T))
+
+int mpIsPrime(const DIGIT_T w[], UINT ndigits, UINT t)
+{	
+	/*	Returns true if w is a probable prime 
+		Carries out t iterations
+		(Use t = 50 for DSS Standard) */
+	/*	Uses Rabin-Miller Probabilistic Primality Test,
+		Ref: FIPS-186-2 Appendix 2.
+		Also Schneier 2nd ed p 260 & Knuth Vol 2, p 379.
+	*/
+
+	/* Temp big digits */
+	DIGIT_T m[MAX_DIG_LEN], a[MAX_DIG_LEN], b[MAX_DIG_LEN];
+	DIGIT_T z[MAX_DIG_LEN], w1[MAX_DIG_LEN];
+	DIGIT_T j[MAX_DIG_LEN];
+	UINT i;
+	int failed, isprime;
+
+	/* Check the obvious */
+	if (mpISEVEN(w, ndigits))
+		return 0;
+
+	/* First check for small primes, unless we could be one ourself */
+	if (mpShortCmp(w, SMALL_PRIMES[N_SMALL_PRIMES-1], ndigits) > 0) {
+		for (i = 0; i < N_SMALL_PRIMES; i++) {
+			if (mpShortMod(w, SMALL_PRIMES[i], ndigits) == 0)
+			return 0; /* Failed */
+		}
+	}
+	else {	
+		/* w is a small number, so check directly */
+		for (i = 0; i < N_SMALL_PRIMES; i++) {
+			if (mpShortCmp(w, SMALL_PRIMES[i], ndigits) == 0)
+				return 1;	/* w is a small prime */
+		}
+		return 0;	/* w is not a small prime */
+	}
+
+	/*	Now do Rabin-Miller  */
+	/*	Step 2. Find a and m where w = 1 + (2^a)m
+		m is odd and 2^a is largest power of 2 dividing w - 1 */
+	mpShortSub(w1, w, 1, ndigits);		/* Store w1 = w - 1 */
+	mpSetEqual(m, w1, ndigits);		/* Set m = w - 1 */
+	
+	/* for (a = 0; iseven(m); a++) */
+	for (mpSetZero(a, ndigits); mpISEVEN(m, ndigits); mpShortAdd(a, a, 1, ndigits))
+		/* Divide by 2 until m is odd */
+		mpShiftRight(m, m, 1, ndigits);
+	
+
+	/* assert((1 << a) * m + 1 == w); */
+
+	isprime = 1;
+	for (i = 0; i < t; i++) {
+		failed = 1;	/* Assume fail unless passed in loop */
+		/* Step 3. Generate random integer 1 < b < w */
+		mpSetZero(b, ndigits);
+		do {
+			b[0] = spPseudoRand(2, MAX_DIGIT);
+		} while (mpCompare(b, w, ndigits) >= 0);
+
+		/* assert(1 < b && b < w); */
+
+		/* Step 4. Set j = 0 and z = b^m mod w */
+		mpSetZero(j, ndigits);
+		mpModExp(z, b, m, w, ndigits);
+		do {
+			/* Step 5. If j = 0 and z = 1, or if z = w - 1 */
+			/* i.e. if ((j == 0 && z == 1) || (z == w - 1)) */
+			if ((mpIsZero(j, ndigits) && mpShortCmp(z, 1, ndigits) == 0) || (mpCompare(z, w1, ndigits) == 0)) {	
+				/* Passes on this loop  - go to Step 9 */
+				failed = 0;
+				break;
+			}
+
+			/* Step 6. If j > 0 and z = 1 */
+			if (!mpIsZero(j, ndigits) && (mpShortCmp(z, 1, ndigits) == 0)) {	
+				/* Fails - go to Step 8 */
+				failed = 1;
+				break;
+			}
+
+			/* Step 7. j = j + 1. If j < a set z = z^2 mod w */
+			mpShortAdd(j, j, 1, ndigits);
+			if (mpCompare(j, a, ndigits) < 0)
+				mpModMult(z, z, z, w, ndigits);
+			/* Loop: if j < a go to Step 5 */
+		} while (mpCompare(j, a, ndigits) < 0);
+
+		if (failed) {	
+			/* Step 8. Not a prime - stop */
+			isprime = 0;
+			break;
+		}
+	}	/* Step 9. Go to Step 3 until i >= n */
+	/* Else, if i = n, w is probably prime => success */
+
+	return isprime;
+}
diff --git a/src/libm/mpIsZero.c b/src/libm/mpIsZero.c
new file mode 100644
index 000000000000..647a7b313ab5
--- /dev/null
+++ b/src/libm/mpIsZero.c
@@ -0,0 +1,19 @@
+/* mpIsZero.c */
+
+#include "bigdigits.h"
+
+int mpIsZero(const DIGIT_T a[], UINT ndigits)
+{
+	UINT i;
+	if (ndigits == 0) 
+		return -1;
+
+	/* Start at lsb */	
+	for (i = 0; i < ndigits; i++){
+		if (a[i] != 0)
+			return 0;	/* False */
+	}
+
+	return (!0);	/* True */
+}
+
diff --git a/src/libm/mpJacobi.c b/src/libm/mpJacobi.c
new file mode 100644
index 000000000000..5b99fe88fe50
--- /dev/null
+++ b/src/libm/mpJacobi.c
@@ -0,0 +1,44 @@
+/* Jacobi Symbol Computation */ 
+#include "bigdigits.h"
+
+int mpJacobi(int *val, const DIGIT_T a[], const DIGIT_T m[], UINT len)
+{
+	/* Compute Jacobi symbol val = (a/m) */
+	
+	int j = 1;
+	DIGIT_T temp_a[MAX_DIG_LEN], temp_m[MAX_DIG_LEN];
+	
+	/* return error if n is not odd */
+	if(mpISEVEN(m, len))
+		return -1;
+	
+	mpSetEqual(temp_a, a, len);
+	mpSetEqual(temp_m, m, len);
+	
+	while(!mpIsZero(temp_a, len)){
+		while(mpISEVEN(temp_a, len)){
+			/* a = a / 2 */
+			mpShiftRight(temp_a, temp_a, 1, len); 
+			
+			/* if (m mod 8 = 3) or (m mod 8 = 5) */
+			if((mpShortMod(temp_m, 8, len) == 3) || (mpShortMod(temp_m, 8, len) == 5))
+				j = -j;
+		}
+		/* a <--> m */
+		mpSwap(temp_a, temp_m, len);
+		
+		/* if (a mod 4 = 3) and (m mod 4 = 3) */
+		if((mpShortMod(temp_a, 4, len) == 3) && (mpShortMod(temp_m, 4, len) == 3))
+			j = -j;
+		
+		/* a = a mod m */
+		mpModulo(temp_a, temp_a, len, temp_m, len);
+	}
+	/* if m = 1 */
+	if(mpShortCmp(temp_m, 1, len)==0)
+		*val = j;
+	else
+		*val = 0;
+	
+	return 0;
+}
diff --git a/src/libm/mpLegendre.c b/src/libm/mpLegendre.c
new file mode 100644
index 000000000000..baaa799832ab
--- /dev/null
+++ b/src/libm/mpLegendre.c
@@ -0,0 +1,8 @@
+/* Legendre Symbol Computation */ 
+
+#include "bigdigits.h"
+
+int mpLegendre(int *val, const DIGIT_T a[], const DIGIT_T p[], UINT len)
+{
+	return mpJacobi(val, a, p, len);
+}
diff --git a/src/libm/mpModAdd.c b/src/libm/mpModAdd.c
new file mode 100644
index 000000000000..bd21fef2566d
--- /dev/null
+++ b/src/libm/mpModAdd.c
@@ -0,0 +1,32 @@
+/* mpModAdd.c */
+
+#include "bigdigits.h"
+
+int mpModAdd(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T v[], const DIGIT_T m[], UINT ndigits)
+{
+	/*	Computes product w = u + v mod m
+		where w, u, v, m are multiprecision integers of ndigits each
+	*/
+	
+	DIGIT_T w1[MAX_DIG_LEN+1];
+	DIGIT_T u1[MAX_DIG_LEN+1];
+	DIGIT_T v1[MAX_DIG_LEN+1];
+	DIGIT_T m1[MAX_DIG_LEN+1];
+	
+	mpSetEqual(u1, u, ndigits);
+	u1[ndigits] = 0;
+	
+	mpSetEqual(v1, v, ndigits);
+	v1[ndigits] = 0;
+	
+	mpSetEqual(m1, m, ndigits);
+	m1[ndigits] = 0;
+	
+	mpAdd(w1, u1, v1, ndigits+1);
+		
+	mpModulo(u1, w1, ndigits+1, m1, ndigits+1);
+	
+	mpSetEqual(w, u1, ndigits);
+	
+	return 0;	
+}
diff --git a/src/libm/mpModExp.c b/src/libm/mpModExp.c
new file mode 100644
index 000000000000..cf134a424b0c
--- /dev/null
+++ b/src/libm/mpModExp.c
@@ -0,0 +1,40 @@
+/* mpModExp.c */
+
+#include "bigdigits.h"
+
+
+int mpModExp(DIGIT_T y[], const DIGIT_T x[], const DIGIT_T e[], const DIGIT_T m[], UINT ndigits)
+{	/*	Computes y = x^e mod m */
+	/*	Binary left-to-right method
+	*/
+	DIGIT_T mask;
+	UINT n;
+	
+	if (ndigits == 0) return -1;
+
+	/* Find second-most significant bit in e */
+	n = mpSizeof(e, ndigits);
+	for (mask = HIBITMASK; mask > 0; mask >>= 1){
+		if (e[n-1] & mask)
+			break;
+	}
+	mpNEXTBITMASK(mask, n);
+
+	/* Set y = x */
+	mpSetEqual(y, x, ndigits);
+
+	/* For bit j = k-2 downto 0 step -1 */
+	while (n){
+		mpModMult(y, y, y, m, ndigits);		/* Square */
+		if (e[n-1] & mask)
+			mpModMult(y, y, x, m, ndigits);	/* Multiply */
+		
+		/* Move to next bit */
+		mpNEXTBITMASK(mask, n);
+	}
+
+	return 0;
+}
+
+
+
diff --git a/src/libm/mpModInv.c b/src/libm/mpModInv.c
new file mode 100644
index 000000000000..659f5023e1aa
--- /dev/null
+++ b/src/libm/mpModInv.c
@@ -0,0 +1,49 @@
+/* mpModInv.c */
+
+#include "bigdigits.h"
+
+int mpModInv(DIGIT_T inv[], const DIGIT_T u[], const DIGIT_T v[], UINT ndigits)
+{	/*	Computes inv = u^(-1) mod v */
+	/*	Ref: Knuth Algorithm X Vol 2 p 342
+		ignoring u2, v2, t2
+		and avoiding negative numbers.
+	*/
+	/* Allocate temp variables */
+	DIGIT_T u1[MAX_DIG_LEN], u3[MAX_DIG_LEN], v1[MAX_DIG_LEN], v3[MAX_DIG_LEN];
+	DIGIT_T t1[MAX_DIG_LEN], t3[MAX_DIG_LEN], q[MAX_DIG_LEN];
+	DIGIT_T w[2*MAX_DIG_LEN];
+	/* TODO: CHECK LENGTHS HERE */
+	int bIterations;
+
+	/* Step X1. Initialise */
+	mpSetDigit(u1, 1, ndigits);		/* u1 = 1 */
+	mpSetEqual(u3, u, ndigits);		/* u3 = u */
+	mpSetZero(v1, ndigits);			/* v1 = 0 */
+	mpSetEqual(v3, v, ndigits);		/* v3 = v */
+
+	bIterations = 1;	/* Remember odd/even iterations */
+	while (!mpIsZero(v3, ndigits))		/* Step X2. Loop while v3 != 0 */
+	{					/* Step X3. Divide and "Subtract" */
+		mpDivide(q, t3, u3, ndigits, v3, ndigits);
+						/* q = u3 / v3, t3 = u3 % v3 */
+		mpMultiply(w, q, v1, ndigits);	/* w = q * v1 */
+		mpAdd(t1, u1, w, ndigits);		/* t1 = u1 + w */
+
+		/* Swap u1 = v1; v1 = t1; u3 = v3; v3 = t3 */
+		mpSetEqual(u1, v1, ndigits);
+		mpSetEqual(v1, t1, ndigits);
+		mpSetEqual(u3, v3, ndigits);
+		mpSetEqual(v3, t3, ndigits);
+
+		bIterations = -bIterations;
+	}
+
+	if (bIterations < 0)
+		mpSubtract(inv, v, u1, ndigits);	/* inv = v - u1 */
+	else
+		mpSetEqual(inv, u1, ndigits);		/* inv = u1 */
+
+	
+	return 0;
+}
+
diff --git a/src/libm/mpModMult.c b/src/libm/mpModMult.c
new file mode 100644
index 000000000000..0c48c98baa4b
--- /dev/null
+++ b/src/libm/mpModMult.c
@@ -0,0 +1,20 @@
+/* mpModMult.c */
+
+#include "bigdigits.h"
+
+int mpModMult(DIGIT_T a[], const DIGIT_T x[], const DIGIT_T y[], const DIGIT_T m[], UINT ndigits)
+{	
+	/*	Computes a = (x * y) mod m */
+	
+	/* Double-length temp variable */
+	DIGIT_T p[MAX_DIG_LEN * 2];
+
+	/* Calc p[2n] = x * y */
+	mpMultiply(p, x, y, ndigits);
+
+	/* Then modulo */
+	mpModulo(a, p, ndigits * 2, m, ndigits);
+
+	return 0;
+}
+
diff --git a/src/libm/mpModSquare.c b/src/libm/mpModSquare.c
new file mode 100644
index 000000000000..1cc37e45177f
--- /dev/null
+++ b/src/libm/mpModSquare.c
@@ -0,0 +1,18 @@
+/* Modulo Squaring */
+
+#include "bigdigits.h"
+
+int mpModSquare(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T p[], UINT ndigits)
+{
+	/* Computes w = u^2 mod p */
+	
+	DIGIT_T t[MAX_DIG_LEN * 2];
+
+	/* Calc t[2n] = u^2 */
+	mpSquare(t, u, ndigits);
+
+	/* Then modulo */
+	mpModulo(w, t, ndigits * 2, p, ndigits);
+
+	return 0;
+}
diff --git a/src/libm/mpModSquareRoot.c b/src/libm/mpModSquareRoot.c
new file mode 100644
index 000000000000..ea41ade2b0f4
--- /dev/null
+++ b/src/libm/mpModSquareRoot.c
@@ -0,0 +1,96 @@
+/* Compute Modulo Square Root */
+
+#include "bigdigits.h"
+
+int mpModSquareRootPre(UINT *S, DIGIT_T Q[], DIGIT_T V[], const DIGIT_T p[], UINT len)
+{
+	/* Precomputation for computing square root */
+	DIGIT_T W[MAX_DIG_LEN];
+	int val = 0;
+	
+	/* find S and Q such that P - 1 = Q*2^S, Q is odd */
+	mpShortSub(Q, p, 1, len);
+	*S = 0;
+	while(mpISEVEN(Q, len)){
+		mpShiftRight(Q, Q, 1, len);
+		(*S)++;
+	}
+	
+	/* find a quadratic nonresidue W mod p and compute V = W^Q mod p */
+	mpMakeRandom(W, len);
+	while(val!=-1){
+		mpShortAdd(W, W, 1, len);
+		
+		/* Test Legendre Symbol */
+		if(mpLegendre(&val, W, p, len)!=0)
+			return -1;	/* error */	
+	}
+	
+	mpModExp(V, W, Q, p, len);
+	
+	return 0;
+}
+
+
+int mpModSquareRoot(DIGIT_T x[], const DIGIT_T a[], const DIGIT_T p[], UINT S, const DIGIT_T Q[], const DIGIT_T V[], const DIGIT_T a1[], UINT len)
+{
+	/* Shanks-Tonelli Algorithm */
+	int i;
+	UINT T;
+	DIGIT_T e[MAX_DIG_LEN];
+	DIGIT_T w[MAX_DIG_LEN];
+
+	/* Check Legendre symbol (a/p) first */
+	if(mpLegendre(&i, a, p, len) != 0)
+		return -2; /* error */
+	
+	if(i != 1)	/* a has no square root */
+		return -1;
+	
+	/* Compute square root modulo p of a using Shanks-Tonelli algorithm */
+	
+	/* x = a^[(Q+1)/2] mod p - first approximation */
+	mpShortAdd(e, Q, 1, len);
+	mpShiftRight(e, e, 1, len);
+		
+	mpModExp(x, a, e, p, len);
+	
+	if(S==1)
+		/* Done, a^[(Q+1)/2] mod p is square root modulo p of a */	
+		return 0;
+	
+	while(1)
+	{
+		/* w = x^2*a1 mod p */
+		mpModSquare(e, x, p, len);
+		mpModMult(w, e, a1, p, len);
+		
+		if(mpShortCmp(w, 1 , len) == 0)
+			/* Done since x^2*a^-1 = 1 mod p */
+			return 0;
+				
+		/* Looking for better approximation of x */
+		T = 0;
+		while(mpShortCmp(w, 1 , len))
+		{
+			/* w = w^2 mod p */
+			mpSetEqual(e, w, len);
+			mpModSquare(w, e, p, len);
+			
+			T++;
+		}
+		
+		/* Compute new approximation x' = x*V^[2^(S-T-1)] */
+		mpSetEqual(e, V, len);
+		for(i=0;i<S-T-1;i++)
+		{
+			mpModSquare(w, e, p, len);
+			mpSetEqual(e, w, len);
+		}
+		
+		mpModMult(e, w, x, p, len);
+		mpSetEqual(x, e, len);
+	}
+		
+	return 0;
+}
diff --git a/src/libm/mpModSubtract.c b/src/libm/mpModSubtract.c
new file mode 100644
index 000000000000..01ca9238926e
--- /dev/null
+++ b/src/libm/mpModSubtract.c
@@ -0,0 +1,38 @@
+/* mpModSubtract.c */
+
+#include "bigdigits.h"
+
+int mpModSubtract(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T v[], const DIGIT_T m[], UINT ndigits)
+{
+	/*	Computes product w = u - v mod m
+		where w, u, v, m are multiprecision integers of ndigits each
+	*/
+	
+	DIGIT_T w1[MAX_DIG_LEN+1];
+	DIGIT_T u1[MAX_DIG_LEN+1];
+	DIGIT_T v1[MAX_DIG_LEN+1];
+	DIGIT_T m1[MAX_DIG_LEN+1];
+	
+	mpSetEqual(u1, u, ndigits);
+	u1[ndigits] = 0;
+	
+	mpSetEqual(v1, v, ndigits);
+	v1[ndigits] = 0;
+	
+	mpSetEqual(m1, m, ndigits);
+	m1[ndigits] = 0;
+	
+	while(mpCompare(u1, v1, ndigits+1) < 0){ /* u1 < v1 */
+		/* u1 = u1 + m1 */
+		mpAdd(u1, u1, m1, ndigits+1);
+	}
+	
+	mpSubtract(w1, u1, v1, ndigits+1);
+	
+	mpModulo(u1, w1, ndigits+1, m1, ndigits+1);
+	
+	mpSetEqual(w, u1, ndigits);
+	
+	return 0;
+	
+}
diff --git a/src/libm/mpModulo.c b/src/libm/mpModulo.c
new file mode 100644
index 000000000000..c929dd5a2c02
--- /dev/null
+++ b/src/libm/mpModulo.c
@@ -0,0 +1,34 @@
+/* mpModulo.c */
+
+#include "bigdigits.h"
+
+int mpModulo(DIGIT_T r[], const DIGIT_T u[], UINT udigits, const DIGIT_T v[], UINT vdigits)
+{
+#ifdef MCRYPTO_TRIVIAL_DIVISION	
+	/*	Calculates r = u mod v
+		where r, v are multiprecision integers of length vdigits
+		and u is a multiprecision integer of length udigits.
+		r may overlap v.
+
+		Note that r here is only vdigits long, 
+		whereas in mpDivide it is udigits long.
+
+		Use remainder from mpDivide function.
+	*/
+
+	/* Double-length temp variable for divide fn */
+	DIGIT_T qq[MAX_DIG_LEN * 2];
+	/* Use a double-length temp for r to allow overlap of r and v */
+	DIGIT_T rr[MAX_DIG_LEN * 2];
+
+	/* rr[2n] = u[2n] mod v[n] */
+	mpDivide(qq, rr, u, udigits, v, vdigits);
+
+	mpSetEqual(r, rr, vdigits);
+#elif defined(MCRYPTO_BARRET)
+	/* use Barret reduction method */
+
+#endif
+	return 0;
+}
+
diff --git a/src/libm/mpMultiply.c b/src/libm/mpMultiply.c
new file mode 100644
index 000000000000..faf4a75ccd7f
--- /dev/null
+++ b/src/libm/mpMultiply.c
@@ -0,0 +1,55 @@
+/* mpMultiply.c */
+#include <assert.h>
+#include "bigdigits.h"
+
+int mpMultiply(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T v[], UINT ndigits)
+{
+#ifdef MCRYPTO_SCHOOL_BOOK	
+	/*	Computes product w = u * v
+		where u, v are multiprecision integers of ndigits each
+		and w is a multiprecision integer of 2*ndigits
+
+		Ref: Knuth Vol 2 Ch 4.3.1 p 268 Algorithm M.
+	*/
+
+	DIGIT_T k, t[2];
+	UINT i, j, m, n;
+	
+	assert(w != u && w != v);
+	m = n = ndigits;
+
+	/* Step M1. Initialise */
+	mpSetZero(w, 2*ndigits);
+	
+	for (j = 0; j < n; j++) {
+		/* Step M2. Zero multiplier? */
+		if (v[j] == 0)
+			w[j + m] = 0;
+		else{
+			/* Step M3. Initialise i */
+			k = 0;
+			for (i = 0; i < m; i++){
+				/* Step M4. Multiply and add */
+				/* t = u_i * v_j + w_(i+j) + k */
+				spMultiply(t, u[i], v[j]);
+
+				t[0] += k;
+				if (t[0] < k)
+					t[1]++;
+				t[0] += w[i+j];
+				if (t[0] < w[i+j])
+					t[1]++;
+
+				w[i+j] = t[0];
+				k = t[1];
+			}	
+			/* Step M5. Loop on i, set w_(j+m) = k */
+			w[j+m] = k;
+		}
+	}	/* Step M6. Loop on j */
+#elif defined(MCRYPTO_FFT_MUL)
+ 
+#endif
+	return 0;
+}
+
diff --git a/src/libm/mpOR.c b/src/libm/mpOR.c
new file mode 100644
index 000000000000..71ace1e43d50
--- /dev/null
+++ b/src/libm/mpOR.c
@@ -0,0 +1,9 @@
+/* mpOR : multi-precision bitwise OR */
+
+#include "bigdigits.h"
+
+void mpOR(DIGIT_T a[], const DIGIT_T x[], const DIGIT_T y[], UINT ndigits)	
+{
+	while(ndigits--)
+		 a[ndigits] = x[ndigits] | y[ndigits];
+}
diff --git a/src/libm/mpSetDigit.c b/src/libm/mpSetDigit.c
new file mode 100644
index 000000000000..7c2b03e210bb
--- /dev/null
+++ b/src/libm/mpSetDigit.c
@@ -0,0 +1,15 @@
+/* mpSetDigit.c */
+
+#include "bigdigits.h"
+
+void mpSetDigit(DIGIT_T a[], DIGIT_T d, UINT ndigits)
+{	
+	/* Sets a = d where d is a single digit */
+	UINT i;
+	
+	for (i = 1; i < ndigits; i++)
+	{
+		a[i] = 0;
+	}
+	a[0] = d;
+}
diff --git a/src/libm/mpSetEqual.c b/src/libm/mpSetEqual.c
new file mode 100644
index 000000000000..bdfb1c00f5df
--- /dev/null
+++ b/src/libm/mpSetEqual.c
@@ -0,0 +1,11 @@
+/* mpSetEqual.c */
+
+#include "bigdigits.h"
+
+void mpSetEqual(DIGIT_T a[], const DIGIT_T b[], UINT ndigits)
+{	
+	/* Sets a = b */
+		
+	while(ndigits--)
+		a[ndigits] = b[ndigits];
+}
diff --git a/src/libm/mpSetZero.c b/src/libm/mpSetZero.c
new file mode 100644
index 000000000000..ca4a64c05ee2
--- /dev/null
+++ b/src/libm/mpSetZero.c
@@ -0,0 +1,11 @@
+/* mpSetZero.c */
+
+#include "bigdigits.h"
+
+void mpSetZero(DIGIT_T a[], UINT ndigits)
+{	
+	/* Sets a = 0 */
+	while(ndigits--)	
+		a[ndigits] = 0;
+	
+}
diff --git a/src/libm/mpShiftLeft.c b/src/libm/mpShiftLeft.c
new file mode 100644
index 000000000000..7bd0867f558f
--- /dev/null
+++ b/src/libm/mpShiftLeft.c
@@ -0,0 +1,43 @@
+/* mpShiftLeft.c */
+
+#include "bigdigits.h"
+
+DIGIT_T mpShiftLeft(DIGIT_T a[], const DIGIT_T b[], UINT shift, UINT ndigits)
+{	
+	UINT i, y, nw, bits;
+	DIGIT_T mask, carry, nextcarry;
+
+	/* Do we shift whole digits? */
+	if (shift >= BITS_PER_DIGIT){
+		nw = shift / BITS_PER_DIGIT;
+		i = ndigits;
+		while (i--){
+			if (i >= nw)
+				a[i] = b[i-nw];
+			else
+				a[i] = 0;
+		}
+		/* Call again to shift bits inside digits */
+		bits = shift % BITS_PER_DIGIT;
+		carry = b[ndigits-nw] << bits;
+		if (bits) 
+			carry |= mpShiftLeft(a, a, bits, ndigits);
+		return carry;
+	}
+	else{
+		bits = shift;
+	}
+
+	/* Construct mask = high bits set */
+	mask = ~(~(DIGIT_T)0 >> bits);
+	
+	y = BITS_PER_DIGIT - bits;
+	carry = 0;
+	for (i = 0; i < ndigits; i++){
+		nextcarry = (b[i] & mask) >> y;
+		a[i] = b[i] << bits | carry;
+		carry = nextcarry;
+	}
+
+	return carry;
+}
diff --git a/src/libm/mpShiftRight.c b/src/libm/mpShiftRight.c
new file mode 100644
index 000000000000..05421d37e23d
--- /dev/null
+++ b/src/libm/mpShiftRight.c
@@ -0,0 +1,45 @@
+/* mpShiftRight.c */
+
+#include "bigdigits.h"
+
+DIGIT_T mpShiftRight(DIGIT_T a[], const DIGIT_T b[], UINT shift, UINT ndigits)
+{	
+	UINT i, y, nw, bits;
+	DIGIT_T mask, carry, nextcarry;
+
+	/* Do we shift whole digits? */
+	if (shift >= BITS_PER_DIGIT)
+	{
+		nw = shift / BITS_PER_DIGIT;
+		for (i = 0; i < ndigits; i++){
+			if ((i+nw) < ndigits)
+				a[i] = b[i+nw];
+			else
+				a[i] = 0;
+		}
+		/* Call again to shift bits inside digits */
+		bits = shift % BITS_PER_DIGIT;
+		carry = b[nw-1] >> bits;
+		if (bits) 
+			carry |= mpShiftRight(a, a, bits, ndigits);
+		return carry;
+	}
+	else{
+		bits = shift;
+	}
+
+	/* Construct mask to set low bits */
+	/* (thanks to Jesse Chisholm for suggesting this improved technique) */
+	mask = ~(~(DIGIT_T)0 << bits);
+	
+	y = BITS_PER_DIGIT - bits;
+	carry = 0;
+	i = ndigits;
+	while (i--){
+		nextcarry = (b[i] & mask) << y;
+		a[i] = b[i] >> bits | carry;
+		carry = nextcarry;
+	}
+
+	return carry;
+}
diff --git a/src/libm/mpShortAdd.c b/src/libm/mpShortAdd.c
new file mode 100644
index 000000000000..b4c9d9e589c7
--- /dev/null
+++ b/src/libm/mpShortAdd.c
@@ -0,0 +1,38 @@
+/* mpShortAdd.c */
+
+#include "bigdigits.h"
+
+DIGIT_T mpShortAdd(DIGIT_T w[], const DIGIT_T u[], DIGIT_T v, UINT ndigits)
+{
+	/*	Calculates w = u + v
+		where w, u are multiprecision integers of ndigits each
+		and v is a single precision digit.
+		Returns carry if overflow.
+
+		Ref: Derived from Knuth Algorithm A.
+	*/
+
+	DIGIT_T k;
+	UINT j;
+
+	k = 0;
+
+	/* Add v to first digit of u */
+	w[0] = u[0] + v;
+	if (w[0] < v)
+		k = 1;
+	else
+		k = 0;
+
+	/* Add carry to subsequent digits */
+	for (j = 1; j < ndigits; j++){
+		w[j] = u[j] + k;
+		if (w[j] < k)
+			k = 1;
+		else
+			k = 0;
+	}
+
+	return k;
+}
+
diff --git a/src/libm/mpShortCmp.c b/src/libm/mpShortCmp.c
new file mode 100644
index 000000000000..e71de20333b5
--- /dev/null
+++ b/src/libm/mpShortCmp.c
@@ -0,0 +1,25 @@
+/* mpShortCmp.c */
+
+#include "bigdigits.h"
+
+int mpShortCmp(const DIGIT_T a[], DIGIT_T b, UINT ndigits)
+{
+	/* Returns sign of (a - b) where b is a single digit */
+
+	UINT i;
+
+	if (ndigits == 0) return 0;
+
+	for (i = 1; i < ndigits; i++){
+		if (a[i] != 0)
+			return 1;	/* GT */
+	}
+
+	if (a[0] < b)
+		return -1;		/* LT */
+	else if (a[0] > b)
+		return 1;		/* GT */
+
+	return 0;	/* EQ */
+}
+
diff --git a/src/libm/mpShortDiv.c b/src/libm/mpShortDiv.c
new file mode 100644
index 000000000000..f59824506c66
--- /dev/null
+++ b/src/libm/mpShortDiv.c
@@ -0,0 +1,55 @@
+/* mpShortDiv.c */
+
+#include "bigdigits.h"
+
+DIGIT_T mpShortDiv(DIGIT_T q[], const DIGIT_T u[], DIGIT_T v, UINT ndigits)
+{
+	/*	Calculates quotient q = u div v
+		Returns remainder r = u mod v
+		where q, u are multiprecision integers of ndigits each
+		and d, v are single precision digits.
+
+		Makes no assumptions about normalisation.
+		
+		Ref: Knuth Vol 2 Ch 4.3.1 Exercise 16 p625
+	*/
+	UINT j;
+	DIGIT_T t[2], r;
+	UINT shift;
+	DIGIT_T bitmask, overflow, *uu;
+
+	if (ndigits == 0) return 0;
+	if (v == 0)	return 0;	/* Divide by zero error */
+
+	/*	Normalise first */
+	/*	Requires high bit of V
+		to be set, so find most signif. bit then shift left,
+		i.e. d = 2^shift, u' = u * d, v' = v * d.
+	*/
+	bitmask = HIBITMASK;
+	for (shift = 0; shift < BITS_PER_DIGIT; shift++){
+		if (v & bitmask)
+			break;
+		bitmask >>= 1;
+	}
+
+	v <<= shift;
+	overflow = mpShiftLeft(q, u, shift, ndigits);
+	uu = q;
+	
+	/* Step S1 - modified for extra digit. */
+	r = overflow;	/* New digit Un */
+	j = ndigits;
+	while (j--){
+		/* Step S2. */
+		t[1] = r;
+		t[0] = uu[j];
+		overflow = spDivide(&q[j], &r, t, v);
+	}
+
+	/* Unnormalise */
+	r >>= shift;
+	
+	return r;
+}
+
diff --git a/src/libm/mpShortMod.c b/src/libm/mpShortMod.c
new file mode 100644
index 000000000000..85c6798ab880
--- /dev/null
+++ b/src/libm/mpShortMod.c
@@ -0,0 +1,22 @@
+/* mpShortMod.c */
+
+#include "bigdigits.h"
+
+DIGIT_T mpShortMod(const DIGIT_T a[], DIGIT_T d, UINT ndigits)
+{
+	/*	Calculates r = a mod d
+		where a is a multiprecision integer of ndigits
+		and r, d are single precision digits
+		using bit-by-bit method from left to right.
+
+		Use remainder from divide function.
+	*/
+
+	DIGIT_T q[MAX_DIG_LEN * 2];
+	DIGIT_T r = 0;
+
+	r= mpShortDiv(q, a, d, ndigits);
+
+	return r;
+}
+
diff --git a/src/libm/mpShortModMult.c b/src/libm/mpShortModMult.c
new file mode 100644
index 000000000000..314bb455849a
--- /dev/null
+++ b/src/libm/mpShortModMult.c
@@ -0,0 +1,30 @@
+/* mpShortModMult.c */
+
+#include "bigdigits.h"
+
+int mpShortModMult(DIGIT_T w[], const DIGIT_T u[], DIGIT_T v, DIGIT_T m[], UINT ndigits)
+{
+	/*	Computes product w = u * v mod m
+		where w, u, m are multiprecision integers of ndigits each
+		and v are single precision digits
+	*/
+	
+	DIGIT_T w1[MAX_DIG_LEN+1];
+	DIGIT_T u1[MAX_DIG_LEN+1];
+	DIGIT_T m1[MAX_DIG_LEN+1];
+	
+	mpSetEqual(u1, u, ndigits);
+	u1[ndigits] = 0;
+	
+	mpSetEqual(m1, m, ndigits);
+	m1[ndigits] = 0;
+	
+	mpShortMult(w1, u1, v, ndigits+1);
+		
+	mpModulo(u1, w1, ndigits+1, m1, ndigits+1);
+	
+	mpSetEqual(w, u1, ndigits);
+		
+	return 0;
+	
+}
diff --git a/src/libm/mpShortMult.c b/src/libm/mpShortMult.c
new file mode 100644
index 000000000000..da934d6f910b
--- /dev/null
+++ b/src/libm/mpShortMult.c
@@ -0,0 +1,40 @@
+/* mpShortMult.c */
+
+#include "bigdigits.h"
+
+DIGIT_T mpShortMult(DIGIT_T w[], const DIGIT_T u[], DIGIT_T v, UINT ndigits)
+{
+	/*	Computes product w = u * v
+		Returns overflow k
+		where w, u are multiprecision integers of ndigits each
+		and v, k are single precision digits
+
+		Ref: Knuth Algorithm M.
+	*/
+
+	DIGIT_T k, t[2];
+	UINT j;
+
+	
+	if (v == 0) {
+		mpSetZero(w, ndigits);
+		
+		return 0;
+	}
+
+	k = 0;
+	for (j = 0; j < ndigits; j++){
+		/* t = x_i * v */
+		spMultiply(t, u[j], v);
+		/* w_i = LOHALF(t) + carry */
+		w[j] = t[0] + k;
+		/* Overflow? */
+		if (w[j] < k)
+			t[1]++;
+		/* Carry forward HIHALF(t) */
+		k = t[1];
+	}
+
+	return k;
+}
+
diff --git a/src/libm/mpShortSub.c b/src/libm/mpShortSub.c
new file mode 100644
index 000000000000..87a832aaa993
--- /dev/null
+++ b/src/libm/mpShortSub.c
@@ -0,0 +1,39 @@
+/* mpShortSub.c */
+
+#include "bigdigits.h"
+
+DIGIT_T mpShortSub(DIGIT_T w[], const DIGIT_T u[], DIGIT_T v, UINT ndigits)
+{
+	/*	Calculates w = u - v
+		where w, u are multiprecision integers of ndigits each
+		and v is a single precision digit.
+		Returns borrow: 0 if u >= v, or 1 if v > u.
+
+		Ref: Derived from Knuth Algorithm S.
+	*/
+
+	DIGIT_T k;
+	UINT j;
+
+	k = 0;
+
+	/* Subtract v from first digit of u */
+	w[0] = u[0] - v;
+	if (w[0] > MAX_DIGIT - v)
+		k = 1;
+	else
+		k = 0;
+
+	/* Subtract borrow from subsequent digits */
+	for (j = 1; j < ndigits; j++)
+	{
+		w[j] = u[j] - k;
+		if (w[j] > MAX_DIGIT - k)
+			k = 1;
+		else
+			k = 0;
+	}
+
+	return k;
+}
+
diff --git a/src/libm/mpSizeof.c b/src/libm/mpSizeof.c
new file mode 100644
index 000000000000..1eb5753c8f38
--- /dev/null
+++ b/src/libm/mpSizeof.c
@@ -0,0 +1,14 @@
+/* mpSizeof.c */
+
+#include "bigdigits.h"
+
+UINT mpSizeof(const DIGIT_T a[], UINT ndigits)
+{	/* Returns size of significant digits in a */
+	
+	while(ndigits--){
+		if (a[ndigits] != 0)
+			return (++ndigits);
+	}
+	
+	return 0;
+}
diff --git a/src/libm/mpSolinasPrime.c b/src/libm/mpSolinasPrime.c
new file mode 100644
index 000000000000..6176eec2a9ed
--- /dev/null
+++ b/src/libm/mpSolinasPrime.c
@@ -0,0 +1,41 @@
+/* mpSolinasPrime.c - generate Solinas' prime of the form p = 2^a + 2^b + 1, 0 < b < a */
+/* useful for generating type-1 elliptic curve for pairing implementation */
+/* todo: try p = 2^a - 2^b -1 too */
+
+#include <stdlib.h>
+#include <time.h>
+#include "bigdigits.h"
+
+UINT mpSolinasPrime(DIGIT_T p[], UINT ndigits, UINT bit_len)
+{
+	UINT a, b;	
+	UINT i, j;
+	UINT n = 1000;	/* going to try at most n times */
+	
+	srand((unsigned)time(NULL));	
+	while(n--){
+		/* first, make p = 1 */		
+		mpSetDigit(p, 1, ndigits);
+		
+		/* let a = bit_len - 1 s.t. p's bit length is exactly bit_len */
+		a = bit_len - 1;
+		i = a / BITS_PER_DIGIT;
+		j = a % BITS_PER_DIGIT;
+		p[i] |= ((DIGIT_T)0x01) << j;
+		
+		/* choose b randomly from 1 to a - 1 */
+		do {
+			b = rand() % a;
+		} while(b==0);
+		i = b / BITS_PER_DIGIT;
+		j = b % BITS_PER_DIGIT;
+		p[i] |= ((DIGIT_T)0x01) << j;
+
+		/* test if p is a prime number */
+		if(mpIsPrime(p, ndigits, N_TEST_PRIME))
+			return b;
+	}	
+	
+	/* failed */
+	return 0;
+}
diff --git a/src/libm/mpSquare.c b/src/libm/mpSquare.c
new file mode 100644
index 000000000000..3e425ff00e8c
--- /dev/null
+++ b/src/libm/mpSquare.c
@@ -0,0 +1,65 @@
+/* Multi-precision squaring */
+
+#include <assert.h>
+#include "bigdigits.h"
+
+int mpSquare(DIGIT_T w[], const DIGIT_T u[], UINT ndigits)
+{
+	/* Ref: Modified Squaring Algorithm by Jorge Guajardo and Christof Paar */
+	UINT i, j;
+	DIGIT_T t[2];
+	DIGIT_T prod[2];
+	DIGIT_T C1;
+	DIGIT_T C2;
+	
+	assert(w != u);
+
+	mpSetZero(w, 2*ndigits);
+	
+	for(i=0;i<ndigits;i++){
+		/* t = w_(2i) + (x_i)^2 */
+		spMultiply(t, u[i], u[i]);
+		mpShortAdd(t, t, w[2*i], 2); 
+		
+		w[2*i] = t[0];
+		C1 = t[1];
+		C2 = 0;
+		
+		for(j=i+1;j<ndigits;j++){
+			/* prod = x_i * x_j */
+			spMultiply(prod, u[i], u[j]);
+			
+			/* t = w_(i+j) + prod + C1 */
+			mpShortAdd(t, prod, C1, 2);
+			mpShortAdd(t, t, w[i+j], 2);
+			
+			w[i+j] = t[0];
+			C1 = t[1];
+			
+			/* t = w_(i+j) + prod + C2 */
+			mpShortAdd(t, prod, C2, 2);
+			mpShortAdd(t, t, w[i+j], 2);
+			
+			w[i+j] = t[0];
+			C2 = t[1];
+		}
+		/* t = C1 + C2 */
+		mpSetZero(t, 2);
+		mpShortAdd(t, t, C1, 2);
+		mpShortAdd(t, t, C2, 2);
+		
+		C1 = t[0];
+		C2 = t[1];
+		
+		/* t = w_(i+ndigits) + C1 */
+		mpSetZero(t, 2);
+		mpShortAdd(t, t, w[i+ndigits], 2);
+		mpShortAdd(t, t, C1, 2);
+		
+		w[i+ndigits] = t[0];
+		
+		w[i+ndigits+1] = C2 + t[1];
+	}
+	
+	return 0;
+}
diff --git a/src/libm/mpSubtract.c b/src/libm/mpSubtract.c
new file mode 100644
index 000000000000..a65a8aa9e72e
--- /dev/null
+++ b/src/libm/mpSubtract.c
@@ -0,0 +1,41 @@
+/* mpSubtract.c */
+
+#include <assert.h>
+#include "bigdigits.h"
+
+DIGIT_T mpSubtract(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T v[], UINT ndigits)
+{
+	/*	Calculates w = u - v where u >= v
+		w, u, v are multiprecision integers of ndigits each
+		Returns 0 if OK, or 1 if v > u.
+
+		Ref: Knuth Vol 2 Ch 4.3.1 p 267 Algorithm S.
+	*/
+
+	DIGIT_T k;
+	UINT j;
+
+	assert(w != v);
+
+	/* Step S1. Initialise */
+	k = 0;
+
+	for (j = 0; j < ndigits; j++){
+		/*	Step S2. Subtract digits w_j = (u_j - v_k - k)
+			Set k = 1 if borrow occurs.
+		*/
+		w[j] = u[j] - k;
+		if (w[j] > MAX_DIGIT - k)
+			k = 1;
+		else
+			k = 0;
+		
+		w[j] -= v[j];
+		if (w[j] > MAX_DIGIT - v[j])
+			k++;
+
+	}	/* Step S3. Loop on j */
+
+	return k;	/* Should be zero if u >= v */
+}
+
diff --git a/src/libm/mpSwap.c b/src/libm/mpSwap.c
new file mode 100644
index 000000000000..1e5aee4b68c6
--- /dev/null
+++ b/src/libm/mpSwap.c
@@ -0,0 +1,16 @@
+/* Swap two integers */
+
+#include "bigdigits.h"
+
+int mpSwap(DIGIT_T a[], DIGIT_T b[], UINT len)
+{
+	DIGIT_T temp[MAX_DIG_LEN];
+	
+	while(len--) {
+		temp[len] = a[len];
+		a[len] = b[len];
+		b[len] = temp[len];
+	}
+	
+	return 0;
+}
diff --git a/src/libm/mpXOR.c b/src/libm/mpXOR.c
new file mode 100644
index 000000000000..799668badd7d
--- /dev/null
+++ b/src/libm/mpXOR.c
@@ -0,0 +1,9 @@
+/* mpXOR : multi-precision bitwise XOR */
+
+#include "bigdigits.h"
+
+void mpXOR(DIGIT_T a[], const DIGIT_T x[], const DIGIT_T y[], UINT ndigits)	
+{
+	while(ndigits--)
+		a[ndigits] = x[ndigits] ^ y[ndigits];
+}
diff --git a/src/libm/pkcs1-rsa.c b/src/libm/pkcs1-rsa.c
new file mode 100644
index 000000000000..1a3132e1fa75
--- /dev/null
+++ b/src/libm/pkcs1-rsa.c
@@ -0,0 +1,833 @@
+/*--------------------------------------------------------*/
+/* PKCS #1 - RSA Cryptosystem Simplified Implementation   */
+/* Author : Dang Nguyen Duc, nguyenduc-nMRlb+72nxtQFI55V6+gNQ@public.gmane.org          */
+/* Date   : 2006/11/12                                    */
+/* Note   : Bit length of modulus of ways divisible by bit*/
+/*          length of a double word (i.e. 32 bits)        */
+/* To do  :						  */
+/*          1. Fast Decryption Using CRT                  */			  
+/*--------------------------------------------------------*/
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <assert.h>
+#include "mcrypto.h"
+#include "pkcs1-rsa.h"
+#include "hash.h"
+#include "bigdigits.h"
+
+/* Internal Functions - Forward Declaration */
+static void memxor(BYTE *c, BYTE *a, BYTE *b, UINT len); 
+	/* Perform c = a XOR b */
+
+static int GenRsaPrime(DIGIT_T p[], UINT ndigits);
+	/* Generate a pseudoprime of length ndigits */ /* To do: put in BigInt lib */	
+
+static int MGF1(UINT hid, BYTE *seed, UINT seedlen, BYTE  *mask, UINT masklen);
+	/* Mask Generation Function Using Hash Function */
+
+/* Internal Functions */
+static void memxor(BYTE *c, BYTE *a, BYTE *b, UINT len)
+{
+	while(len--)
+		c[len] = a[len] ^ b[len]; 
+}
+
+static int GenRsaPrime(DIGIT_T p[], UINT ndigits)
+{
+	/* Generate a pseudorandom number */
+	mpMakeRandom(p, ndigits);
+
+	/*	Make sure two highest and the low bits are set.
+		Having the two highest bits set means the product
+		(pq) will always have its highest bit set. 
+	*/
+	p[ndigits - 1] |= HIBITMASK | (HIBITMASK >> 1);
+	p[0] |= 0x1;
+
+	/* Primality Testing using Miller-Rabin Method */
+	while (!mpIsPrime(p, ndigits, N_TEST_PRIME)) {
+		/* add 2 to p and try to test again */
+		mpShortAdd(p, p, 2, ndigits);
+
+		/* Check for overflow */
+		if (!(p[ndigits - 1] & HIBITMASK))
+			return -1;	/* Failed to find a prime */
+	}
+	
+	return 0;
+}
+
+static int MGF1(UINT hid, BYTE *seed, UINT seedlen, BYTE  *mask, UINT masklen)
+{
+	/* Mask Generation Function Using Hash Function */
+	UINT hlen;
+	DWORD i;
+	BYTE *hash;
+	BYTE *data;
+	DWORD n;
+	DWORD MAX_SIZE = 0x8000;
+	BYTE T[MAX_SIZE];
+	int ret;
+	
+	/* Init Ouput */
+	memset(T, 0x00, MAX_SIZE);
+	
+	/* masklen should be less than MAX_SIZE */
+	if((hlen = HashLenQuery(hid))==0)	/* Unkown Hash Algorithm */
+		return ERR_UNKNOWN_HASH;
+	
+	if(masklen % hlen)
+		n = masklen / hlen + 1;
+	else
+		n = masklen / hlen;
+	
+	/* Preparing Hash Input/Ouput */
+	data = (BYTE *)malloc(seedlen + 4);
+	memcpy(data, seed, seedlen);
+	
+	hash = (BYTE *)malloc(hlen);
+		 
+	for(i=0;i<n;i++) {
+		/* Constructing Hash Input */
+		memcpy(data+seedlen, &i, 4);
+		
+		/* Computing Hash */
+		if((ret=Hash(hid, data, seedlen+4, hash))!=0) {
+			free(data);
+			free(hash);
+			return ERR_HASH;
+		}
+		
+		/* Appending Hash to T */ 
+		memcpy(T+i*hlen, hash, hlen);
+	}
+	
+	free(data);
+	free(hash);
+	
+	memcpy(mask, T, masklen);
+	
+	return ERR_OK;
+}
+
+/* Main Functions */
+
+int PKCS1_RSA_GenKey(PKCS1_RSA_PUBLIC_KEY *spk, PKCS1_RSA_PRIVATE_KEY *ssk, UINT mod_len)
+{
+	DIGIT_T *p, *q, *n, *e, *d;
+	DIGIT_T Phi[MAX_DIG_LEN];
+	DIGIT_T g[MAX_DIG_LEN];
+	DIGIT_T t[MAX_DIG_LEN];
+	UINT plen;
+	UINT qlen;
+	UINT prime_len;
+	int ret;
+		
+	/* Limit checking */
+	if(mod_len < MIN_RSA_MODULUS_LEN)
+		return ERR_MOD_TOO_SMALL;
+	if(mod_len > MAX_RSA_MODULUS_LEN)
+		return ERR_MOD_TOO_LONG;
+		
+	/* Computing length of two primes */
+	prime_len = plen = mod_len / 2;
+	qlen = mod_len - plen;
+	if(qlen > prime_len)
+		prime_len = qlen;
+		
+	/* allocate memory */
+	n = (DIGIT_T*)malloc(NBYTE(mod_len));
+	mpSetZero(n, mod_len);
+	
+	e = (DIGIT_T*)malloc(NBYTE(mod_len));
+	mpSetZero(e, mod_len);
+	
+	d = (DIGIT_T*)malloc(NBYTE(mod_len));
+	mpSetZero(d, mod_len);
+	
+	p = (DIGIT_T*)malloc(NBYTE(plen));
+	mpSetZero(p, plen);
+	
+	q = (DIGIT_T*)malloc(NBYTE(qlen));
+	mpSetZero(q, qlen);
+	
+	/* Generate p and q */
+	ret = GenRsaPrime(p, plen);
+	if (ret==-1) 
+		return ERR_PRIME_FAILED;
+	mcrypto_dump("Key Gen: prime p",(BYTE *)p, NBYTE(plen));
+	
+	ret = GenRsaPrime(q, qlen);
+	if (ret==-1) 
+		return ERR_PRIME_FAILED;
+	mcrypto_dump("Key Gen: prime q",(BYTE *)q, NBYTE(qlen));
+	
+	/* Compute n */
+	mpMultiply(Phi, p, q, prime_len);
+	mpSetEqual(n, Phi, mod_len);
+	mcrypto_dump("Key Gen Modulus",(BYTE *)n, NBYTE(mod_len));
+	
+	/* Phi(n) = (p-1)*(q-1) */
+	mpShortSub(g, p, 1, plen);
+	mpShortSub(t, q, 1, qlen);
+	mpMultiply(Phi, g, t, prime_len);
+	mcrypto_dump("Key Gen Phi(n)=(p-1)(q-1)",(BYTE *)Phi, NBYTE(2*prime_len));
+	
+	do {
+		/* Generate e */
+		mpMakeRandom(e, mod_len);
+		
+		/* Calculate private key, d = e^-1 Mod L */
+		mpModInv(d, e, Phi, mod_len);
+		
+		/* Check whether e*d = 1 mod Phi(n) */
+		mpModMult(t, d, e, Phi, mod_len);
+		
+	} while(mpShortCmp(t, 1, mod_len) != 0); 
+	
+	mcrypto_dump("Key Gen Public Exponent e",(BYTE *)e, NBYTE(mod_len));
+	mcrypto_dump("Key Gen Private Exponent d",(BYTE *)d, NBYTE(mod_len));
+	
+	/* Collecting data */
+	spk->len = mod_len;
+	spk->modulus = n;
+	spk->exponent = e;
+	
+	ssk->len = mod_len;
+	ssk->modulus = n;
+	ssk->PublicExponent = e;
+	ssk->exponent = d;
+	ssk->p = p;
+	ssk->plen = plen;
+	ssk->q = q;
+	ssk->qlen = qlen;
+	
+	return ERR_OK;
+}
+
+int PKCS1_RSAEP(PKCS1_RSA_PUBLIC_KEY *spk, DIGIT_T *m, DIGIT_T *c)
+{
+	/* Do RSA Encryption */
+	mpModExp(c, m, spk->exponent, spk->modulus, spk->len);
+	
+	return ERR_OK;
+}
+
+int PKCS1_RSADP(PKCS1_RSA_PRIVATE_KEY *ssk, DIGIT_T *c, DIGIT_T *m)
+{
+	/* Do RSA Decryption */
+	mpModExp(m, c, ssk->exponent, ssk->modulus, ssk->len);
+	
+	return ERR_OK;
+}
+
+int PKCS1_RSASP1(PKCS1_RSA_PRIVATE_KEY *ssk, DIGIT_T *m, DIGIT_T *s)
+{
+	/* Do RSA Signing */
+	return PKCS1_RSADP(ssk, m, s);
+}
+
+
+int PKCS1_RSAVP1(PKCS1_RSA_PUBLIC_KEY *spk, DIGIT_T *s, DIGIT_T *m)
+{
+	/* Extract Encoded Message */
+	return PKCS1_RSAEP(spk, s, m);
+
+}
+
+int PKCS1_EME_OAEP_ENC(PKCS1_RSA_PUBLIC_KEY *spk, UINT hid, BYTE *m, UINT mlen, BYTE *L, UINT llen, BYTE *em)
+{
+	/* Encoding message m of length mlen to em using OAEP */
+	UINT hlen;	/* Hash Output Length in Byte */
+	UINT k;		/* Encoded Message Length */
+	BYTE *lHash;	/* Hash of L */
+	BYTE *DB;
+	BYTE *seed;
+	BYTE *dbMask;
+	BYTE *seedMask;
+	int ret;
+	
+	k = NBYTE(spk->len);
+	if((hlen = HashLenQuery(hid))==0)
+		return ERR_UNKNOWN_HASH;
+		
+	/* Length checking */
+	if(mlen > (k - 2*hlen - 2))
+		return ERR_MSG_TOO_LONG;
+	
+	/* Compute Hash of L */
+	mcrypto_dump("OAEP Encoding: L", L, llen);
+	lHash = (BYTE *)malloc(hlen);
+	if(Hash(hid, L, llen, lHash)!=0){
+		return ERR_HASH;
+	}
+	mcrypto_dump("OAEP Encoding: Hash of L", lHash, hlen);
+	
+	/* Forming DB */
+	DB = (BYTE *)malloc(k-hlen-1);
+	memset(DB, 0x00, k-hlen-1);
+	
+	memcpy(DB, lHash, hlen);
+	DB[k-hlen-mlen-2] = 0x01;
+	memcpy(DB+k-hlen-mlen-1, m, mlen);
+	mcrypto_dump("OAEP Encoding: DB", DB, k-hlen-1);
+	
+	/* Make a random seed */
+	seed = (BYTE *)malloc(hlen);
+	GenSeed(seed, hlen);
+	mcrypto_dump("OAEP Encoding: seed", seed, hlen);
+	
+	/* Forming maskedDB and maskedSeed */
+	dbMask = (BYTE *)malloc(k-hlen-1);
+	if((ret=MGF1(hid, seed, hlen, dbMask, k-hlen-1))!=ERR_OK) {
+		free(lHash);
+		free(DB);
+		free(seed);
+		
+		return ret;
+	}
+	mcrypto_dump("OAEP Encoding: dbMask", dbMask, k-hlen-1); 
+	
+	memxor(DB, DB, dbMask, k-hlen-1);
+	mcrypto_dump("OAEP Encoding: maskedDB", DB, k-hlen-1);
+	
+	seedMask = (BYTE *)malloc(hlen);
+	if((ret=MGF1(hid, DB, k-hlen-1, seedMask, hlen))!=ERR_OK) {
+		free(lHash);
+		free(DB);
+		free(seed);
+		free(seedMask);
+		
+		return ret;
+	}
+
+	mcrypto_dump("OAEP Encoding: seedMask", seedMask, hlen);
+	
+	memxor(seed, seed, seedMask, hlen);
+	mcrypto_dump("OAEP Encoding: maskedSeed", seed, hlen);
+	
+	/* forming OAEP-encoded message */
+	memset(em, 0x00, k);
+	memcpy(em+1, seed, hlen);
+	memcpy(em+1+hlen, DB, k-hlen-1);
+	mcrypto_dump("OAEP Encoding: Encoded Message em", em, k);
+	
+	/* free used memory */
+	free(lHash);
+	free(DB);
+	free(seed);
+	free(dbMask);
+	free(seedMask);
+	
+	return ERR_OK;
+}
+
+int PKCS1_RSA_OAEP_ENCRYPT(PKCS1_RSA_PUBLIC_KEY *spk, UINT hid, BYTE *m, UINT mlen, BYTE *L, UINT llen, BYTE *c)
+{
+	/* Encryption using RSA-OAEP */
+	BYTE *em;
+	int ret;
+	
+	mcrypto_dump("RSAOAEP Encrupt: Plaintext m", m, mlen);
+	
+	/* Encoding message */
+	em = (BYTE *)malloc(NBYTE(spk->len));
+	
+	if((ret = PKCS1_EME_OAEP_ENC(spk, hid, m, mlen, L, llen, em))!=ERR_OK) {
+		free(em);
+		return ret;
+	}
+	
+	/* Do Encryption */
+	ret = PKCS1_RSAEP(spk, (DIGIT_T *)em, (DIGIT_T *)c);
+	mcrypto_dump("RSAOAEP Encrypt: Ciphertext c", c, NBYTE(spk->len));
+	
+	free(em);
+	
+	return ret;
+}
+	
+
+int PKCS1_EME_OAEP_DEC(PKCS1_RSA_PRIVATE_KEY *ssk, UINT hid, BYTE *em, BYTE *L, UINT llen, BYTE *m, UINT *mlen)
+{
+	/* OAEP Decoding */
+	UINT hlen;	/* Hash Output Length in Byte */
+	UINT k;		/* Encoded Message Length */
+	BYTE *lHash;	/* Hash of L */
+	BYTE *DB;
+	BYTE *seed;
+	BYTE *maskedDB;
+	BYTE *maskedSeed;
+	UINT i;
+	int ret;
+	
+	k = NBYTE(ssk->len);
+	mcrypto_dump("OAEP Decoding: Encoded Message em", em, k);
+	
+	if(*(em)) /* fist byte of encoded message not 0x00 */
+		return ERR_DECRYPTION;
+	
+	if((hlen = HashLenQuery(hid))==0)
+		return ERR_UNKNOWN_HASH;
+		
+	/* Compute Hash of L */
+	mcrypto_dump("OAEP Decoding: L", L, llen);
+	lHash = (BYTE *)malloc(hlen);
+	if((ret=Hash(hid, L, llen, lHash))!=0) {
+		free(lHash);
+		
+		return ret;
+	}
+	
+	mcrypto_dump("OAEP Decoding: Hash of L", lHash, hlen);
+	
+	/* Extracting maskedDB and maskedSeed from encoded message em */
+	maskedSeed = (BYTE *)malloc(hlen);
+	memcpy(maskedSeed, em+1, hlen);
+	mcrypto_dump("OAEP Decoding: maskedSeed", maskedSeed, hlen);
+	
+	maskedDB = (BYTE *)malloc(k-hlen-1);
+	memcpy(maskedDB, em+1+hlen, k-hlen-1);
+	mcrypto_dump("OAEP Decoding: maskedDB", maskedDB, k-hlen-1);
+	
+	/* Finding seed and DB */
+	seed = (BYTE *)malloc(hlen);
+	if((ret=MGF1(hid, maskedDB, k-hlen-1, seed, hlen))!=ERR_OK)
+	{
+		free(lHash);
+		free(maskedSeed);
+		free(maskedDB);
+		free(seed);
+		
+		return ret;
+	}
+	mcrypto_dump("OAEP Decoding: seedMask", seed, hlen);
+	
+	memxor(seed, seed, maskedSeed, hlen);
+	mcrypto_dump("OAEP Decoding: seed", seed, hlen);
+	
+	DB = (BYTE *)malloc(k-hlen-1);
+	if((ret=MGF1(hid, seed, hlen, DB, k-hlen-1))!=ERR_OK) {
+		free(lHash);
+		free(maskedSeed);
+		free(maskedDB);
+		free(seed);
+		free(DB);
+		
+		return ret;
+	}
+
+	mcrypto_dump("OAEP Decoding: dbMask", DB, k-hlen-1);
+	memxor(DB, DB, maskedDB, k-hlen-1);
+	mcrypto_dump("OAEP Decoding: DB", DB, k-hlen-1);
+	
+	/* Checking whether first hlen bits of DB equals to lHash */
+	if(memcmp(lHash, DB, hlen)!=0) {
+		free(lHash);
+		free(DB);
+		free(seed);
+		free(maskedDB);
+		free(maskedSeed);
+		
+		return ERR_DECRYPTION;
+	}
+	
+	/* Try to Extract M from DB */
+	i = hlen;
+	while((DB[i] == 0x00) && (DB[i] != 0x01) && (i < (k-hlen-1-1))) i++;
+	
+	if(i == (k-hlen-1-1)) {
+		free(lHash);
+		free(DB);
+		free(seed);
+		free(maskedDB);
+		free(maskedSeed);
+		
+		return ERR_DECRYPTION;
+	}
+	
+	if(DB[i] != 0x01) {
+		free(lHash);
+		free(DB);
+		free(seed);
+		free(maskedDB);
+		free(maskedSeed);
+		
+		return ERR_DECRYPTION;
+	}	
+	
+	*mlen = k-hlen-1-1 - (i+1) + 1; /* starting after 0x01 byte to the end of DB */
+	memcpy(m, DB+i+1, *mlen);
+	mcrypto_dump("OAEP Decoding: Plaintext m", m, *mlen);
+	
+	free(lHash);
+	free(DB);
+	free(seed);
+	free(maskedDB);
+	free(maskedSeed);
+		
+	return ERR_OK;
+}
+
+int PKCS1_RSA_OAEP_DECRYPT(PKCS1_RSA_PRIVATE_KEY *ssk, UINT hid, BYTE *c, BYTE *L, UINT llen, BYTE *m, UINT *mlen)
+{
+	/* RSA-OAEP Decryption */
+	BYTE *em;
+	int ret;
+	UINT hlen;
+	
+	if((hlen = HashLenQuery(hid)) == 0)
+		return ERR_UNKNOWN_HASH;
+	
+	/* Length checking */
+	if(NBYTE(ssk->len)<(2*hlen+2))
+		return ERR_DECRYPTION;
+	
+	mcrypto_dump("RSAOAEP Decrypt: Ciphertext", c, NBYTE(ssk->len));
+	
+	/* Do RSA Decryption */
+	em = (BYTE *)malloc(NBYTE(ssk->len));
+	ret = PKCS1_RSADP(ssk, (DIGIT_T *)c, (DIGIT_T *)em);
+	
+	mcrypto_dump("RSAOAEP Decrypt: OAEP-Encoded Message (After Decryption)",(BYTE *)em, NBYTE(ssk->len));
+	
+	/* Decoding Message */
+	ret = PKCS1_EME_OAEP_DEC(ssk, hid, em, L, llen, m, mlen);
+	
+	free(em); 
+	
+	return ret;
+}
+
+int PKCS1_RSASSA_PSS_SIGN(PKCS1_RSA_PRIVATE_KEY *ssk, UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *s)
+{
+	/* PKCS1 #1 RSA Signature Generation Using PSS Encoding */
+	BYTE *em;
+	int ret;
+	
+	/* Preparing encoded message */
+	em = (BYTE *)malloc(NBYTE(ssk->len));
+	
+	/* PSS Encoding */
+	if((ret=PKCS1_EMSA_PSS_ENCODE(hid, m, mlen, slen, em, NBYTE(ssk->len)))!=ERR_OK) {
+		free(em);
+		return ret;
+	}
+	
+	/* Signing */
+	ret = PKCS1_RSASP1(ssk, (DIGIT_T*)em, (DIGIT_T*)s);
+	mcrypto_dump("Signature",(BYTE *)s, NBYTE(ssk->len));
+	
+	free(em);
+	
+	return ret;
+}
+
+int PKCS1_RSASSA_PSS_VERIFY(PKCS1_RSA_PUBLIC_KEY *spk, UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *s)
+{
+	/* PKCS #1 RSA Signature Verification Using PSS Encoding */
+	BYTE *em;
+	int ret;
+	
+	mcrypto_dump("Signature", s, NBYTE(spk->len));
+
+	/* Extracting encoded message */
+	em = (BYTE *)malloc(NBYTE(spk->len));
+	
+	if((ret = PKCS1_RSAVP1(spk, (DIGIT_T *)s, (DIGIT_T *)em))!=ERR_OK) {
+		free(em);
+		return ret;
+	}
+	mcrypto_dump("PSS-Encoded Message (Before Verificaton)",(BYTE *)em, NBYTE(spk->len));
+	
+	/* Verify encoded message */
+	ret = PKCS1_EMSA_PSS_VERIFY(hid, m, mlen, slen, em, NBYTE(spk->len));
+	
+	free(em);
+	
+	if(ret == ERR_PSS_CONSISTENT)
+		return ERR_VALID_SIGNATURE;
+		
+	return ERR_INVALID_SIGNATURE;
+}
+
+int PKCS1_EMSA_PSS_ENCODE(UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *em, UINT emlen)
+{
+	/* PSS Encoding */
+	UINT hlen;	/* Length of Hash Output */
+	BYTE *H;	/* Hash of m */
+	BYTE *salt;
+	BYTE *M;
+	BYTE *DB;
+	BYTE *maskedDB;
+	int ret;
+	
+	if((hlen = HashLenQuery(hid)) == 0)
+		return ERR_UNKNOWN_HASH;
+	
+	/* Computing Hash of m */
+	mcrypto_dump("PSS Encoding: Message", m, mlen);
+	H = (BYTE *)malloc(hlen);
+	if((ret = Hash(hid, m, mlen, H))!=0) {
+		free(H);
+		
+		return ret;
+	}
+
+	mcrypto_dump("PSS Encoding: Hashed Message", H, hlen);
+	
+	/* Length checking */
+	if(emlen<(hlen+slen+2)) {
+		free(H);
+		return ERR_PSS_ENCODING;
+	}
+	
+	/* Generating salt and constructing M */
+	salt = (BYTE *)malloc(slen);
+	GenSeed(salt, slen);
+	mcrypto_dump("PSS Encoding: Salt", salt, slen);
+	
+	M = (BYTE *)malloc(8+hlen+slen);
+	memset(M, 0x00, 8+hlen+slen);
+	memcpy(M+8, H, hlen);
+	memcpy(M+8+hlen, salt, slen);
+	mcrypto_dump("PSS Encoding: Message to be encoded", M, 8+hlen+slen);
+	
+	/* Constructing DB */
+	if((ret = Hash(hid, M, 8+hlen+slen, H))!=0) {
+		free(H);
+		free(M);
+		free(salt);
+		
+		return ret;
+	}
+	mcrypto_dump("PSS Encoding: Hash of Message to be encoded", H, hlen);
+	
+	DB = (BYTE *)malloc(emlen-hlen-1);
+	memset(DB, 0x00, emlen-hlen-1);
+	DB[emlen-slen-hlen-2] = 0x01;
+	memcpy(DB+emlen-slen-hlen-1, salt, slen);
+	mcrypto_dump("PSS Encoding: DB", DB, emlen-hlen-1);
+	
+	/* Computing maskedDB */
+	maskedDB = (BYTE *)malloc(emlen-hlen-1);
+	if((ret=MGF1(hid, H, hlen, maskedDB, emlen-hlen-1))!=ERR_OK) {
+		free(H);
+		free(M);
+		free(salt);
+		free(maskedDB);
+		free(DB);
+		
+		return ret;
+	}
+
+	mcrypto_dump("PSS Encoding: dbMask", maskedDB, emlen-hlen-1);
+	
+	memxor(maskedDB, maskedDB, DB, emlen-hlen-1);
+	mcrypto_dump("PSS Encoding: maskedDB", maskedDB, emlen-hlen-1);
+	
+	/* Constructing encoded message, em */
+	memcpy(em, maskedDB, emlen-hlen-1);
+	memcpy(em+emlen-hlen-1, H, hlen);
+	em[emlen-1] = 0xbc;
+	mcrypto_dump("PSS Encoding: Encoded Message", em, emlen);
+	
+	return ERR_OK;
+}
+
+int PKCS1_EMSA_PSS_VERIFY(UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *em, UINT emlen)
+{
+	/* PSS Verification */
+	UINT hlen;	/* Length of Hash Output */
+	BYTE *H;	/* Hash of m */
+	BYTE *M;
+	BYTE *mHash;
+	BYTE *DB;
+	BYTE *maskedDB;
+	int ret;
+	
+	if((hlen = HashLenQuery(hid)) == 0)
+		return ERR_UNKNOWN_HASH;
+	
+	/* Computing Hash of m */
+	mcrypto_dump("PSS Verify: Message", m, mlen);
+	mHash = (BYTE *)malloc(hlen);
+	if((ret = Hash(hid, m, mlen, mHash))!=0) {
+		free(mHash);
+		return ret;
+	}
+	
+	mcrypto_dump("PSS Verify: Hash of Message", mHash, hlen);
+	
+	/* Length checking */
+	mcrypto_dump("PSS Verify: Encoded Message", em, emlen);
+	
+	if(emlen<(hlen+slen+2)) {
+		free(mHash);
+		return ERR_PSS_INCONSISTENT;
+	}
+	
+	/* Verification */
+	if(em[emlen-1]!=0xbc) {
+		free(mHash);
+		return ERR_PSS_INCONSISTENT;
+	}
+	
+	/* Extracting maskedDB and H */
+	maskedDB = (BYTE *)malloc(emlen-hlen-1);
+	memcpy(maskedDB, em, emlen-hlen-1);
+	mcrypto_dump("PSS Verify: maskedDB", maskedDB, emlen-hlen-1);
+	
+	H = (BYTE *)malloc(hlen);
+	memcpy(H, em+emlen-hlen-1, hlen);
+	mcrypto_dump("PSS Verify: H", H, hlen);
+	
+	/* Computing DB */ 
+	DB = (BYTE *)malloc(emlen-hlen-1);
+	if((ret=MGF1(hid, H, hlen, DB, emlen-hlen-1))!=ERR_OK) {
+		free(H);
+		free(mHash);
+		free(maskedDB);
+		free(DB);
+		
+		return ret;
+	}
+	mcrypto_dump("PSS Verify: dbMask", DB, emlen-hlen-1);
+	
+	memxor(DB, DB, maskedDB, emlen-hlen-1);
+	mcrypto_dump("PSS Verify: DB", DB, emlen-hlen-1);
+	
+	if(DB[emlen-slen-hlen-2]!=0x01) {
+		free(H);
+		free(mHash);
+		free(maskedDB);
+		free(DB);
+		
+		return ERR_PSS_INCONSISTENT;
+	}
+	
+	M = (BYTE *)malloc(8+hlen+slen);
+	memset(M, 0x00, 8+hlen+slen);
+	memcpy(M+8, mHash, hlen);
+	memcpy(M+8+hlen, DB+emlen-slen-hlen-1, slen);
+	mcrypto_dump("PSS Verify: Message to encoded", M, 8+hlen+slen);
+	
+	if((ret = Hash(hid, M, 8+hlen+slen, mHash))!=0) {
+		free(H);
+		free(mHash);
+		free(maskedDB);
+		free(DB);
+		free(M);
+		
+		return ret;
+	}
+	
+	mcrypto_dump("PSS Verify: Hash of Message to encoded", mHash, hlen);
+	
+	if(memcmp(H, mHash, hlen)!=0) 
+		return ERR_PSS_INCONSISTENT;
+		
+	return ERR_PSS_CONSISTENT;
+}
+
+void errmsg(int err)
+{
+	switch(err) {
+	case ERR_OK:			printf("Job Done Successfully!!!\n"); break;
+	case ERR_MOD_TOO_SMALL:		printf("Wow!!! Modulus Length Too Short.\n"); break;
+	case ERR_MOD_TOO_LONG:		printf("Sorry!!! Modulus Length Too Long.\n"); break;
+	case ERR_PRIME_FAILED:		printf("Failed To Generate A Prime. Try It Again.\n"); break;
+	case ERR_MSG_TOO_LONG:		printf("Sorry!!! Message Too Long.\n"); break;
+	case ERR_LABEL_TOO_LONG:	printf("Sorry!!! OAEP Label Too Long\n"); break;
+	case ERR_DECRYPTION:		printf("Sorry!!! Decryption Error.\n"); break;
+	case ERR_UNKNOWN_HASH:		printf("Sorry!!! Hash Function Not Available.\n"); break;
+	case ERR_VALID_SIGNATURE:	printf("Good!!! Signature Is Valid.\n"); break;	
+	case ERR_INVALID_SIGNATURE:	printf("Sorry!!! Signature Is Invalid.\n"); break;
+	case ERR_PSS_CONSISTENT:	printf("Good!!! PSS-Encoded Message Is Consistent.\n"); break;
+	case ERR_PSS_INCONSISTENT:	printf("Sorry!!! PSS-Encoded Message Is Inconsistent.\n"); break;
+	case ERR_PSS_ENCODING:		printf("Sorry!!! PSS Encoding Error\n"); break;
+	case ERR_HASH:			printf("Sorry!!! Hash Function Error. Maybe Hash Input Limit Exceeded\n"); break;
+	default: 			printf("Unkown Error!!!\n"); break;
+	}
+}
+
+int LoadPublicKey(char *fname, PKCS1_RSA_PUBLIC_KEY *spk)
+{
+	/* Load keys from files */
+	char s[5][PKCS1_MAX_LINE_LEN];	
+	FILE *f;
+	UINT i;
+	UINT len;
+	
+	f = fopen(fname, "r");
+	if(f == NULL)
+		return -1;
+	
+	memset(s, 0x00, PKCS1_MAX_LINE_LEN*5);	
+	/* reading data */
+	for(i=0;i<5;i++)
+	{
+		if(feof(f))
+		{
+			fclose(f);
+			return -1;
+		}
+		fgets(s[i], PKCS1_MAX_LINE_LEN, f);
+		
+		/* ignore newline charater */		
+		s[i][strlen(s[i])-1] = '\0';
+	}
+	fclose(f);
+	
+	/* Decoding data */
+	spk->len = (UINT)atoi(s[1]);
+	
+	if((spk->modulus = mpBase64Decode(&len, s[2]))==NULL)
+		return -1; 
+	if((spk->exponent = mpBase64Decode(&len, s[3]))==NULL)
+		return -1; 
+	return 0;
+}
+
+int LoadPrivateKey(char *fname, PKCS1_RSA_PRIVATE_KEY *ssk)
+{
+	/* Load keys from files */
+	char s[6][PKCS1_MAX_LINE_LEN];
+	FILE *f;
+	UINT i;
+	UINT len;
+	
+	f = fopen(fname, "r");
+	if(f == NULL)
+		return -1;
+		
+	memset(s, 0x00, PKCS1_MAX_LINE_LEN*6);	
+	
+	/* reading data */
+	for(i=0;i<5;i++)
+	{
+		if(feof(f))
+		{
+			fclose(f);
+			return -1;
+		}
+		fgets(s[i], PKCS1_MAX_LINE_LEN, f);
+		s[i][strlen(s[i])-1] = '\0';
+	}
+	fclose(f);
+	
+	ssk->len = (UINT)atoi(s[1]);
+	
+	if((ssk->modulus = mpBase64Decode(&len, s[2]))==NULL)
+		return -1; 
+	if((ssk->PublicExponent = mpBase64Decode(&len, s[3]))==NULL)
+		return -1; 
+	if((ssk->exponent = mpBase64Decode(&len, s[4]))==NULL)
+		return -1; 	
+	
+	return 0;
+}
+
+
diff --git a/src/libm/pkcs1-rsa.h b/src/libm/pkcs1-rsa.h
new file mode 100644
index 000000000000..9e2b58acd9da
--- /dev/null
+++ b/src/libm/pkcs1-rsa.h
@@ -0,0 +1,119 @@
+/* pkcs1-rsa.h */
+
+#ifndef _PKCS1RSA_H_
+#define _PKCS1RSA_H_
+
+#include "bigdigits.h"
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#define PKCS1_MAX_LINE_LEN	346	/* for reading parameter file */
+
+#define PKCS1_VERSION_MAJOR 2
+#define PKCS1_VERSION_MINOR 1
+
+/* RSA key lengths. */
+#define MIN_RSA_MODULUS_LEN 	5		/* 160 bits */
+#define MAX_RSA_MODULUS_LEN 	MAX_DIG_LEN	/* 2048 bits */
+#define MAX_MSG_LEN		256		/* bytes */
+
+/* Error codes - todo: move into mcrypto.h and add MCRYPTO prefix */
+#define ERR_DEFAULT		0x00
+#define ERR_OK			0x01
+#define ERR_MOD_TOO_SMALL	0x02
+#define ERR_MOD_TOO_LONG	0x03
+#define ERR_PRIME_FAILED	0x04
+#define ERR_MSG_TOO_LONG        0x05
+#define ERR_LABEL_TOO_LONG      0x06
+#define ERR_DECRYPTION		0x07
+#define ERR_UNKNOWN_HASH	0x08
+#define ERR_VALID_SIGNATURE     0x09
+#define ERR_INVALID_SIGNATURE   0x0a
+#define ERR_PSS_CONSISTENT	0x0b
+#define ERR_PSS_INCONSISTENT	0x0c
+#define ERR_PSS_ENCODING	0x0d
+#define ERR_HASH		0x0e
+
+
+
+/* PKCS1-RSA public and private key. */
+typedef struct {
+  UINT    len;			/* length in digits of modulus */
+  DIGIT_T *modulus;  		/* modulus */
+  DIGIT_T *exponent; 		/* public exponent */
+} PKCS1_RSA_PUBLIC_KEY;
+
+typedef struct {
+  UINT len;       		/* length in digits of modulus */
+  DIGIT_T *modulus;		/* modulus */
+  DIGIT_T *PublicExponent; 	/* public exponent */
+  DIGIT_T *exponent; 		/* private exponent */
+  
+  /* for fast decryption using CRT */
+  DIGIT_T *p;   		/* prime factor 1 */
+  UINT    plen;			/* length in digits of p */
+  DIGIT_T *q;   		/* prime factor 2 */
+  UINT    qlen;			/* length in digits of q = len - plen */
+  DIGIT_T *dP;     		/* e*dP = 1 mod p-1 */
+  DIGIT_T *dQ;     		/* e*dQ = 1 mod q-1 */
+  DIGIT_T *qInv;          	/* q*qInv = 1 mod p */
+} PKCS1_RSA_PRIVATE_KEY;
+
+
+/* function prototype */
+void errmsg(int err);
+	/* Print out error message */
+	
+int PKCS1_RSA_GenKey(PKCS1_RSA_PUBLIC_KEY *spk, PKCS1_RSA_PRIVATE_KEY *ssk, UINT mod_len);
+	/* PKCS #1 Key Generation according to modulus bit length, len*BITS_PER_DIGIT */
+
+int PKCS1_RSAEP(PKCS1_RSA_PUBLIC_KEY *spk, DIGIT_T *m, DIGIT_T *c);
+	/* PKCS #1 Encryption Primitive */
+
+int PKCS1_RSADP(PKCS1_RSA_PRIVATE_KEY *ssk, DIGIT_T *c, DIGIT_T *m);
+	/* PKCS #1 Decryption Primitive */
+
+int PKCS1_RSASP1(PKCS1_RSA_PRIVATE_KEY *ssk, DIGIT_T *m, DIGIT_T *s);
+	/* PKCS #1 Signature Generation Primitive */
+
+int PKCS1_RSAVP1(PKCS1_RSA_PUBLIC_KEY *spk, DIGIT_T *s, DIGIT_T *m);
+	/* PKCS #1 Signature Verification Primitive */
+
+int PKCS1_EME_OAEP_ENC(PKCS1_RSA_PUBLIC_KEY *spk, UINT hid, BYTE *m, UINT mlen, BYTE *L, UINT llen, BYTE *em);
+	/* PKCS #1 OAEP encoding function */
+
+int PKCS1_RSA_OAEP_ENCRYPT(PKCS1_RSA_PUBLIC_KEY *spk, UINT hid, BYTE *m, UINT mlen, BYTE *L, UINT llen, BYTE *c); 
+	/* PKCS #1 OAEP Encryption */
+
+int PKCS1_EME_OAEP_DEC(PKCS1_RSA_PRIVATE_KEY *ssk, UINT hid, BYTE *em, BYTE *L, UINT llen, BYTE *m, UINT *mlen);
+	/* PKCS #1 OAEP decoding function */
+
+int PKCS1_RSA_OAEP_DECRYPT(PKCS1_RSA_PRIVATE_KEY *ssk, UINT hid, BYTE *c, BYTE *L, UINT llen, BYTE *m, UINT *mlen); 
+	/* PKCS #1 OAEP Decryption */
+
+int PKCS1_RSASSA_PSS_SIGN(PKCS1_RSA_PRIVATE_KEY *ssk, UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *s);
+	/* PKCS #1 Signature Generation Using PSS encoding method */
+
+int PKCS1_RSASSA_PSS_VERIFY(PKCS1_RSA_PUBLIC_KEY *spk, UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *s);
+	/* PKCS #1 Signature Verification */
+
+int PKCS1_EMSA_PSS_ENCODE(UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *em, UINT emlen);
+	/* PKCS #1 PSS Encoding */
+
+int PKCS1_EMSA_PSS_VERIFY(UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *em, UINT emlen);	
+	/* PKCS #1 PSS Verification */
+
+/* Untility Functions */
+int LoadPublicKey(char *fname, PKCS1_RSA_PUBLIC_KEY *spk);
+	/* Public Key Loader */
+
+int LoadPrivateKey(char *fname, PKCS1_RSA_PRIVATE_KEY *ssk);
+	/* Secret Key Loader */
+			
+#ifdef __cplusplus
+}
+#endif
+
+#endif	/* _PKCS1RSA_H_ */
diff --git a/src/libm/sha1.c b/src/libm/sha1.c
new file mode 100644
index 000000000000..ffe9645d80c9
--- /dev/null
+++ b/src/libm/sha1.c
@@ -0,0 +1,155 @@
+/*
+SHA-1 in C
+
+Test Vectors (from FIPS PUB 180-1)
+"abc"
+  A9993E36 4706816A BA3E2571 7850C26C 9CD0D89D
+"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
+  84983E44 1C3BD26E BAAE4AA1 F95129E5 E54670F1
+A million repetitions of "a"
+  34AA973C D4C4DAA4 F61EEB2B DBAD2731 6534016F
+*/
+
+#include <stdio.h>
+#include <string.h>
+#include "sha1.h"
+
+#define rol(value, bits) (((value) << (bits)) | ((value) >> (32 - (bits))))
+
+/* blk0() and blk() perform the initial expand. */
+#define blk0(i) (block->l[i] = (rol(block->l[i],24)&0xFF00FF00) \
+    |(rol(block->l[i],8)&0x00FF00FF))
+
+#define blk(i) (block->l[i&15] = rol(block->l[(i+13)&15]^block->l[(i+8)&15] \
+    ^block->l[(i+2)&15]^block->l[i&15],1))
+
+/* (R0+R1), R2, R3, R4 are the different operations used in SHA1 */
+#define R0(v,w,x,y,z,i) z+=((w&(x^y))^y)+blk0(i)+0x5A827999+rol(v,5);w=rol(w,30);
+#define R1(v,w,x,y,z,i) z+=((w&(x^y))^y)+blk(i)+0x5A827999+rol(v,5);w=rol(w,30);
+#define R2(v,w,x,y,z,i) z+=(w^x^y)+blk(i)+0x6ED9EBA1+rol(v,5);w=rol(w,30);
+#define R3(v,w,x,y,z,i) z+=(((w|x)&y)|(w&x))+blk(i)+0x8F1BBCDC+rol(v,5);w=rol(w,30);
+#define R4(v,w,x,y,z,i) z+=(w^x^y)+blk(i)+0xCA62C1D6+rol(v,5);w=rol(w,30);
+
+/* Hash a single 512-bit block. This is the core of the algorithm. */
+void SHA1Transform(unsigned long state[5], unsigned char buffer[64])
+{
+    unsigned long a, b, c, d, e;
+    typedef union {
+        unsigned char c[64];
+        unsigned long l[16];
+    } CHAR64LONG16;
+    
+    CHAR64LONG16* block;
+    
+    block = (CHAR64LONG16*)buffer;
+
+    /* Copy context->state[] to working vars */
+    a = state[0];
+    b = state[1];
+    c = state[2];
+    d = state[3];
+    e = state[4];
+    /* 4 rounds of 20 operations each. Loop unrolled. */
+    R0(a,b,c,d,e, 0); R0(e,a,b,c,d, 1); R0(d,e,a,b,c, 2); R0(c,d,e,a,b, 3);
+    R0(b,c,d,e,a, 4); R0(a,b,c,d,e, 5); R0(e,a,b,c,d, 6); R0(d,e,a,b,c, 7);
+    R0(c,d,e,a,b, 8); R0(b,c,d,e,a, 9); R0(a,b,c,d,e,10); R0(e,a,b,c,d,11);
+    R0(d,e,a,b,c,12); R0(c,d,e,a,b,13); R0(b,c,d,e,a,14); R0(a,b,c,d,e,15);
+    R1(e,a,b,c,d,16); R1(d,e,a,b,c,17); R1(c,d,e,a,b,18); R1(b,c,d,e,a,19);
+    R2(a,b,c,d,e,20); R2(e,a,b,c,d,21); R2(d,e,a,b,c,22); R2(c,d,e,a,b,23);
+    R2(b,c,d,e,a,24); R2(a,b,c,d,e,25); R2(e,a,b,c,d,26); R2(d,e,a,b,c,27);
+    R2(c,d,e,a,b,28); R2(b,c,d,e,a,29); R2(a,b,c,d,e,30); R2(e,a,b,c,d,31);
+    R2(d,e,a,b,c,32); R2(c,d,e,a,b,33); R2(b,c,d,e,a,34); R2(a,b,c,d,e,35);
+    R2(e,a,b,c,d,36); R2(d,e,a,b,c,37); R2(c,d,e,a,b,38); R2(b,c,d,e,a,39);
+    R3(a,b,c,d,e,40); R3(e,a,b,c,d,41); R3(d,e,a,b,c,42); R3(c,d,e,a,b,43);
+    R3(b,c,d,e,a,44); R3(a,b,c,d,e,45); R3(e,a,b,c,d,46); R3(d,e,a,b,c,47);
+    R3(c,d,e,a,b,48); R3(b,c,d,e,a,49); R3(a,b,c,d,e,50); R3(e,a,b,c,d,51);
+    R3(d,e,a,b,c,52); R3(c,d,e,a,b,53); R3(b,c,d,e,a,54); R3(a,b,c,d,e,55);
+    R3(e,a,b,c,d,56); R3(d,e,a,b,c,57); R3(c,d,e,a,b,58); R3(b,c,d,e,a,59);
+    R4(a,b,c,d,e,60); R4(e,a,b,c,d,61); R4(d,e,a,b,c,62); R4(c,d,e,a,b,63);
+    R4(b,c,d,e,a,64); R4(a,b,c,d,e,65); R4(e,a,b,c,d,66); R4(d,e,a,b,c,67);
+    R4(c,d,e,a,b,68); R4(b,c,d,e,a,69); R4(a,b,c,d,e,70); R4(e,a,b,c,d,71);
+    R4(d,e,a,b,c,72); R4(c,d,e,a,b,73); R4(b,c,d,e,a,74); R4(a,b,c,d,e,75);
+    R4(e,a,b,c,d,76); R4(d,e,a,b,c,77); R4(c,d,e,a,b,78); R4(b,c,d,e,a,79);
+    
+    /* Add the working vars back into context.state[] */
+    state[0] += a;
+    state[1] += b;
+    state[2] += c;
+    state[3] += d;
+    state[4] += e;
+    
+    /* Wipe variables */
+    a = b = c = d = e = 0;
+}
+
+
+/* SHA1Init - Initialize new context */
+void SHA1Init(SHA1_CTX* context)
+{
+    /* SHA1 initialization constants */
+    context->state[0] = 0x67452301;
+    context->state[1] = 0xEFCDAB89;
+    context->state[2] = 0x98BADCFE;
+    context->state[3] = 0x10325476;
+    context->state[4] = 0xC3D2E1F0;
+    context->count[0] = context->count[1] = 0;
+}
+
+/* Run your data through this. */
+void SHA1Update(SHA1_CTX* context, unsigned char* data, unsigned int len)
+{
+    unsigned int i, j;
+
+    j = (context->count[0] >> 3) & 63;
+    
+    if ((context->count[0] += len << 3) < (len << 3)) context->count[1]++;
+    context->count[1] += (len >> 29);
+    
+    if ((j + len) > 63) {
+        memcpy(&context->buffer[j], data, (i = 64-j));
+        SHA1Transform(context->state, context->buffer);
+        
+        for ( ; i + 63 < len; i += 64) {
+            SHA1Transform(context->state, &data[i]);
+        }
+        j = 0;
+    }
+    else i = 0;
+    
+    memcpy(&context->buffer[j], &data[i], len - i);
+}
+
+
+/* Add padding and return the message digest. */
+void SHA1Final(unsigned char digest[20], SHA1_CTX* context)
+{
+    unsigned long i, j;
+    unsigned char finalcount[8];
+
+    for (i = 0; i < 8; i++) {
+        finalcount[i] = (unsigned char)((context->count[(i >= 4 ? 0 : 1)]
+         >> ((3-(i & 3)) * 8) ) & 255);  /* Endian independent */
+    }
+    
+    SHA1Update(context, (unsigned char *)"\200", 1);
+    
+    while ((context->count[0] & 504) != 448) {
+        SHA1Update(context, (unsigned char *)"\0", 1);
+    }
+    
+    SHA1Update(context, finalcount, 8);  /* Should cause a SHA1Transform() */
+    for (i = 0; i < 20; i++) {
+        digest[i] = (unsigned char)
+         ((context->state[i>>2] >> ((3-(i & 3)) * 8) ) & 255);
+    }
+    
+    /* Wipe variables */
+    i = j = 0;
+    memset(context->buffer, 0, 64);
+    memset(context->state, 0, 20);
+    memset(context->count, 0, 8);
+    memset(&finalcount, 0, 8);
+}
+
+/*--------------- end of sha1.c -------------------*/
+
diff --git a/src/libm/sha1.h b/src/libm/sha1.h
new file mode 100644
index 000000000000..b208a9533484
--- /dev/null
+++ b/src/libm/sha1.h
@@ -0,0 +1,26 @@
+/* sha1.h */
+
+#ifndef _SHA1_H
+#define _SHA1_H
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+typedef struct {
+    unsigned long state[5];
+    unsigned long count[2];
+    unsigned char buffer[64];
+} SHA1_CTX;
+
+void SHA1Init(SHA1_CTX* context);
+void SHA1Update(SHA1_CTX* context, unsigned char* data, unsigned int len);
+void SHA1Final(unsigned char digest[20], SHA1_CTX* context);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
+
+
diff --git a/src/libm/sha2.c b/src/libm/sha2.c
new file mode 100644
index 000000000000..a9ff5659f54a
--- /dev/null
+++ b/src/libm/sha2.c
@@ -0,0 +1,724 @@
+
+/*
+ -------------------------------------------------------------------------
+ Copyright (c) 2001, Dr Brian Gladman <brg-5Ifv9E4uLVAJ3nxcUk3PyQ@public.gmane.org>, Worcester, UK.
+ All rights reserved.
+
+ LICENSE TERMS
+
+ The free distribution and use of this software in both source and binary 
+ form is allowed (with or without changes) provided that:
+
+   1. distributions of this source code include the above copyright 
+      notice, this list of conditions and the following disclaimer;
+
+   2. distributions in binary form include the above copyright
+      notice, this list of conditions and the following disclaimer
+      in the documentation and/or other associated materials;
+
+   3. the copyright holder's name is not used to endorse products 
+      built using this software without specific written permission. 
+
+ DISCLAIMER
+
+ This software is provided 'as is' with no explicit or implied warranties
+ in respect of its properties, including, but not limited to, correctness 
+ and fitness for purpose.
+ -------------------------------------------------------------------------
+Issue Date: 9/10/2002
+
+   This is a byte oriented version of SHA2 that operates on arrays of bytes
+   stored in memory. This code implements sha256, sha384 and sha512 but the
+   latter two functions rely on efficient 64-bit integer operations that 
+   may not be very efficient on 32-bit machines
+
+   The sha256 functions use a type 'sha256_ctx' to hold details of the 
+   current hash state and uses the following three calls:
+
+       void sha256_begin(sha256_ctx ctx[1])
+       void sha256_hash(const unsigned char data[], 
+							const unsigned long len, sha256_ctx ctx[1])
+       void sha256_end(unsigned char hval[], sha256_ctx ctx[1])
+
+   The first subroutine initialises a hash computation by setting up the 
+   context in the sha256_ctx context. The second subroutine hashes 8-bit 
+   bytes from array data[] into the hash state withinh sha256_ctx context, 
+   the number of bytes to be hashed being given by the the unsigned long 
+   integer len.  The third subroutine completes the hash calculation and 
+   places the resulting digest value in the array of 8-bit bytes hval[].
+
+   The sha384 and sha512 functions are similar and use the interfaces:
+
+       void sha384_begin(sha384_ctx ctx[1]);
+       void sha384_hash(const unsigned char data[], 
+							const unsigned long len, sha384_ctx ctx[1]);
+       void sha384_end(unsigned char hval[], sha384_ctx ctx[1]);
+
+       void sha512_begin(sha512_ctx ctx[1]);
+       void sha512_hash(const unsigned char data[], 
+							const unsigned long len, sha512_ctx ctx[1]);
+       void sha512_end(unsigned char hval[], sha512_ctx ctx[1]);
+
+   In addition there is a function sha2 that can be used to call all these
+   functions using a call with a hash length parameter as follows:
+
+       int sha2_begin(const unsigned long len, sha2_ctx ctx[1]);
+       void sha2_hash(const unsigned char data[], 
+							const unsigned long len, sha2_ctx ctx[1]);
+       void sha2_end(unsigned char hval[], sha2_ctx ctx[1]);
+
+   My thanks to Erik Andersen <andersen-7hA2VRSQAb9g9hUCZPvPmw@public.gmane.org> for testing this code 
+   on big-endian systems and for his assistance with corrections
+ */
+
+/* define the hash functions that you need  */
+
+#define SHA_2
+#define SHA_256
+#define SHA_384
+#define SHA_512
+
+/*  Defining FAST_COPY will generally improve speed but it assumes that 
+    arrays of 32-bit words can be addressed as arrays of bytes by casting 
+	the array base address. Defining WORD_COPY avoids this problem by 
+	assembling bytes into a word variable before copying to memory. If
+    neither is defined a slow but safe byte oriented version is used.
+*/
+
+#if 1
+#define FAST_COPY
+#elif 0
+#define WORD_COPY
+#endif
+
+/* end of user defined options */
+
+#include <string.h>     /* for memcpy() etc.        */
+#include <stdlib.h>     /* for _lrotr with VC++     */
+
+#include "sha2.h"
+
+/*  1. PLATFORM SPECIFIC INCLUDES */
+
+#if defined(__GNU_LIBRARY__)
+#  include <endian.h>
+#  include <byteswap.h>
+#elif defined(_MSC_VER)
+#  include <stdlib.h>
+#elif !defined(WIN32)
+#  include <stdlib.h>
+#endif
+
+/*  2. BYTE ORDER IN 32-BIT WORDS
+
+    To obtain the highest speed on processors with 32-bit words, this code 
+    needs to determine the order in which bytes are packed into such words.
+    The following block of code is an attempt to capture the most obvious 
+    ways in which various environemnts specify their endian definitions. 
+	It may well fail, in which case the definitions will need to be set by 
+    editing at the points marked **** EDIT HERE IF NECESSARY **** below.
+*/
+#define SHA_LITTLE_ENDIAN   1234 /* byte 0 is least significant (i386) */
+#define SHA_BIG_ENDIAN      4321 /* byte 0 is most significant (mc68k) */
+
+#if !defined(PLATFORM_BYTE_ORDER)
+#if defined(LITTLE_ENDIAN) || defined(BIG_ENDIAN)
+#  if defined(LITTLE_ENDIAN) && defined(BIG_ENDIAN)
+#    if defined(BYTE_ORDER)
+#      if   (BYTE_ORDER == LITTLE_ENDIAN)
+#        define PLATFORM_BYTE_ORDER SHA_LITTLE_ENDIAN
+#      elif (BYTE_ORDER == BIG_ENDIAN)
+#        define PLATFORM_BYTE_ORDER SHA_BIG_ENDIAN
+#      endif
+#    endif
+#  elif defined(LITTLE_ENDIAN) && !defined(BIG_ENDIAN) 
+#    define PLATFORM_BYTE_ORDER SHA_LITTLE_ENDIAN
+#  elif !defined(LITTLE_ENDIAN) && defined(BIG_ENDIAN)
+#    define PLATFORM_BYTE_ORDER SHA_BIG_ENDIAN
+#  endif
+#elif defined(_LITTLE_ENDIAN) || defined(_BIG_ENDIAN)
+#  if defined(_LITTLE_ENDIAN) && defined(_BIG_ENDIAN)
+#    if defined(_BYTE_ORDER)
+#      if   (_BYTE_ORDER == _LITTLE_ENDIAN)
+#        define PLATFORM_BYTE_ORDER SHA_LITTLE_ENDIAN
+#      elif (_BYTE_ORDER == _BIG_ENDIAN)
+#        define PLATFORM_BYTE_ORDER SHA_BIG_ENDIAN
+#      endif
+#    endif
+#  elif defined(_LITTLE_ENDIAN) && !defined(_BIG_ENDIAN) 
+#    define PLATFORM_BYTE_ORDER SHA_LITTLE_ENDIAN
+#  elif !defined(_LITTLE_ENDIAN) && defined(_BIG_ENDIAN)
+#    define PLATFORM_BYTE_ORDER SHA_BIG_ENDIAN
+#  endif
+#elif 0     /* **** EDIT HERE IF NECESSARY **** */
+#define PLATFORM_BYTE_ORDER SHA_LITTLE_ENDIAN
+#elif 0     /* **** EDIT HERE IF NECESSARY **** */
+#define PLATFORM_BYTE_ORDER SHA_BIG_ENDIAN
+#elif (('1234' >> 24) == '1')
+#  define PLATFORM_BYTE_ORDER SHA_LITTLE_ENDIAN
+#elif (('4321' >> 24) == '1')
+#  define PLATFORM_BYTE_ORDER SHA_BIG_ENDIAN
+#endif
+#endif
+
+#if !defined(PLATFORM_BYTE_ORDER)
+#  error Please set undetermined byte order (lines 171 or 173 of sha2.c).
+#endif
+
+/* this Microsft VC++ intrinsic rotate makes a big difference to the speed of this code */
+
+#if defined(_MSC_VER)
+#define rotr32(x,n)   _lrotr(x,n)
+#else
+#define rotr32(x,n)   (((x) >> n) | ((x) << (32 - n)))
+#endif
+
+#define rotr64(x,n)   (((x) >> n) | ((x) << (64 - n)))
+
+/* reverse byte order in 32-bit words   */
+
+#if !defined(bswap_32)
+#define bswap_32(x) (rotr32((x), 24) & 0x00ff00ff | rotr32((x), 8) & 0xff00ff00)
+#endif
+
+#if !defined(bswap_64)
+#define bswap_64(x) (((sha_64t)(bswap_32((sha_32t)(x)))) << 32 | bswap_32((sha_32t)((x) >> 32)))
+#endif
+
+#if defined(FAST_COPY) && (PLATFORM_BYTE_ORDER == SHA_LITTLE_ENDIAN)
+#define SWAP_BYTES
+#else
+#undef  SWAP_BYTES
+#endif
+
+#if defined(SHA_2) || defined(SHA_256)
+
+/* SHA256 mixing function definitions   */
+
+#define ch(x,y,z)   (((x) & (y)) ^ (~(x) & (z)))
+#define maj(x,y,z)  (((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z)))
+
+#define s256_0(x) (rotr32((x),  2) ^ rotr32((x), 13) ^ rotr32((x), 22)) 
+#define s256_1(x) (rotr32((x),  6) ^ rotr32((x), 11) ^ rotr32((x), 25)) 
+#define g256_0(x) (rotr32((x),  7) ^ rotr32((x), 18) ^ ((x) >>  3)) 
+#define g256_1(x) (rotr32((x), 17) ^ rotr32((x), 19) ^ ((x) >> 10)) 
+
+/* rotated SHA256 round definition. Rather than swapping variables as in    */
+/* FIPS-180, different variables are 'rotated' on each round, returning     */
+/* to their starting positions every eight rounds                           */
+
+#define h2(i) ctx->wdat[i & 15] += \
+    g256_1(ctx->wdat[(i + 14) & 15]) + ctx->wdat[(i + 9) & 15] + g256_0(ctx->wdat[(i + 1) & 15])
+
+#define h2_cycle(i,j)  \
+    v[(7 - i) & 7] += (j ? h2(i) : ctx->wdat[i & 15]) + k256[i + j] \
+        + s256_1(v[(4 - i) & 7]) + ch(v[(4 - i) & 7], v[(5 - i) & 7], v[(6 - i) & 7]); \
+    v[(3 - i) & 7] += v[(7 - i) & 7]; \
+    v[(7 - i) & 7] += s256_0(v[(0 - i) & 7]) + maj(v[(0 - i) & 7], v[(1 - i) & 7], v[(2 - i) & 7])
+
+/* SHA256 mixing data   */
+
+const sha_32t k256[64] =
+{   n_u32(428a2f98), n_u32(71374491), n_u32(b5c0fbcf), n_u32(e9b5dba5), 
+    n_u32(3956c25b), n_u32(59f111f1), n_u32(923f82a4), n_u32(ab1c5ed5), 
+    n_u32(d807aa98), n_u32(12835b01), n_u32(243185be), n_u32(550c7dc3), 
+    n_u32(72be5d74), n_u32(80deb1fe), n_u32(9bdc06a7), n_u32(c19bf174), 
+    n_u32(e49b69c1), n_u32(efbe4786), n_u32(0fc19dc6), n_u32(240ca1cc), 
+    n_u32(2de92c6f), n_u32(4a7484aa), n_u32(5cb0a9dc), n_u32(76f988da), 
+    n_u32(983e5152), n_u32(a831c66d), n_u32(b00327c8), n_u32(bf597fc7), 
+    n_u32(c6e00bf3), n_u32(d5a79147), n_u32(06ca6351), n_u32(14292967), 
+    n_u32(27b70a85), n_u32(2e1b2138), n_u32(4d2c6dfc), n_u32(53380d13), 
+    n_u32(650a7354), n_u32(766a0abb), n_u32(81c2c92e), n_u32(92722c85),
+    n_u32(a2bfe8a1), n_u32(a81a664b), n_u32(c24b8b70), n_u32(c76c51a3), 
+    n_u32(d192e819), n_u32(d6990624), n_u32(f40e3585), n_u32(106aa070), 
+    n_u32(19a4c116), n_u32(1e376c08), n_u32(2748774c), n_u32(34b0bcb5), 
+    n_u32(391c0cb3), n_u32(4ed8aa4a), n_u32(5b9cca4f), n_u32(682e6ff3), 
+    n_u32(748f82ee), n_u32(78a5636f), n_u32(84c87814), n_u32(8cc70208), 
+    n_u32(90befffa), n_u32(a4506ceb), n_u32(bef9a3f7), n_u32(c67178f2),
+};
+
+/* SHA256 initialisation data */
+
+const sha_32t i256[8] =
+{
+    n_u32(6a09e667), n_u32(bb67ae85), n_u32(3c6ef372), n_u32(a54ff53a),
+    n_u32(510e527f), n_u32(9b05688c), n_u32(1f83d9ab), n_u32(5be0cd19)
+};
+
+void sha256_begin(sha256_ctx ctx[1])
+{
+    ctx->count[0] = ctx->count[1] = 0;
+    memcpy(ctx->hash, i256, 32);
+}
+
+/* Compile 64 bytes of hash data into SHA256 digest value  */
+
+static void sha256_compile(sha256_ctx ctx[1])
+{   sha_32t    v[8], j;
+
+    memcpy(v, ctx->hash, 32);
+
+    for(j = 0; j < 64; j += 16)
+    {
+        h2_cycle( 0, j); h2_cycle( 1, j); h2_cycle( 2, j); h2_cycle( 3, j);
+        h2_cycle( 4, j); h2_cycle( 5, j); h2_cycle( 6, j); h2_cycle( 7, j);
+        h2_cycle( 8, j); h2_cycle( 9, j); h2_cycle(10, j); h2_cycle(11, j);
+        h2_cycle(12, j); h2_cycle(13, j); h2_cycle(14, j); h2_cycle(15, j);
+    }
+
+    ctx->hash[0] += v[0]; ctx->hash[1] += v[1]; ctx->hash[2] += v[2]; ctx->hash[3] += v[3];
+    ctx->hash[4] += v[4]; ctx->hash[5] += v[5]; ctx->hash[6] += v[6]; ctx->hash[7] += v[7];
+}
+
+/* SHA256 hash data in an array of bytes into hash buffer and call the      */
+/* hash_compile function as required.                                       */
+
+/* If FAST_COPY is defined the data to be hashed is processed as an array   */
+/* bytes and compiled into the buffer ctx->wdat[] of 32-bit words in the    */
+/* native byte order.  On little endian machines a 32-bit word byte swap    */
+/* is then performed before this data is compiled into the hash. But when   */
+/* FAST_COPY is not defined the bytes are compiled into the buffer in the   */
+/* big-endian format directly so no later byte order changes are needed.    */
+
+#if defined(FAST_COPY)
+
+void sha256_hash(const unsigned char data[], const unsigned long len, sha256_ctx ctx[1])
+{   sha_32t            free = 64 - (sha_32t)(ctx->count[0] & 63), rlen = len, j;
+    const unsigned char *sp = data;
+    unsigned char       *p = ((unsigned char*)ctx->wdat) + (ctx->count[0] & 63);
+
+    while(rlen >= free)     /* tranfer whole blocks while possible  */
+    {
+        memcpy(p, sp, free);
+        if((ctx->count[0] += free) < free)
+            ++(ctx->count[1]);
+        sp += free; rlen -= free; free = 64; 
+        p = (unsigned char*)ctx->wdat;
+#if defined(SWAP_BYTES)
+        for(j = 0; j < 16; ++j)
+            ctx->wdat[j] = bswap_32(ctx->wdat[j]);
+#endif
+        sha256_compile(ctx);
+    }
+
+    memcpy(p, sp, rlen);    /* transfer partial block               */
+    if((ctx->count[0] += rlen) < rlen)
+        ++(ctx->count[1]);
+    p = (unsigned char*)ctx->wdat;
+    rlen = (ctx->count[0] & 63);
+    while(rlen & 3)         /* ensure rest of 32-bit word is zero   */
+        *(p + rlen++) = 0;	/* [could be done in sha256_end()]		*/
+}
+
+#elif defined(WORD_COPY)    /* alternative implementations          */
+
+void sha256_hash(const unsigned char data[], unsigned long len, sha256_ctx ctx[1])
+{   sha_32t i = 0, *ptr, cnt, val, j;
+
+    ptr = ctx->wdat + ((ctx->count[0] >> 2) & 15);
+    cnt = (ctx->count[0] << 3) & 24;
+    val = (cnt ? *ptr : 0);
+    while(i < len)
+    {   /* assemble values in big-endian format */
+        val |= ((sha_32t)data[i++]) << 24 - cnt;
+        if(!++(ctx->count[0])) ++(ctx->count[1]);
+        if(!(cnt = (cnt + 8) & 24))
+        {   *ptr++ = val; val = 0;
+            if(ptr - ctx->wdat == 16) 
+            {
+                sha256_compile(ctx); 
+                ptr = ctx->wdat;
+            }
+        }
+    }
+    *ptr = val;
+}
+
+#else
+
+void sha256_hash(const unsigned char data[], unsigned long len, sha256_ctx ctx[1])
+{   sha_32t i = 0, cnt = ctx->count[0], j;
+
+    while(i < len)
+    {   /* assemble values in big-endian format */
+        if((cnt & 3) == 0) ctx->wdat[(cnt >> 2) & 15] = 0;
+        ctx->wdat[(cnt >> 2) & 15] |= (sha_32t)data[i++] << (24 - (8 * (cnt & 3)));
+        if(!++(ctx->count[0])) ++(ctx->count[1]);
+        if((++cnt & 63) == 0) 
+        {
+            sha256_compile(ctx);
+        }
+    }
+}
+
+#endif
+
+/* SHA256 Final padding and digest calculation  */
+
+void sha256_end(unsigned char hval[], sha256_ctx ctx[1])
+{   sha_32t    i, j, cnt = (sha_32t)(ctx->count[0] & 63);
+
+#if defined(SWAP_BYTES)
+        for(i = 0, j = (cnt + 3) >> 2; i < j; ++i)
+            ctx->wdat[i] = bswap_32(ctx->wdat[i]);
+#endif
+
+    /* we are now in big-endian order within the ctx->wdat[] buffer	*/
+	/* we now need to add the padding which is a single 1 bit and	*/
+	/* as many zero bits as necessary. Start by padding out the		*/
+	/* last valid 32-bit word in the buffer							*/
+
+    if(cnt & 3)
+        ctx->wdat[(cnt >> 2) & 15] |= n_u32(00000080) << (24  - (8 * (cnt & 3)));
+    else
+        ctx->wdat[(cnt >> 2) & 15] = n_u32(80000000);
+
+    if((cnt & 63) > 55)	/* there is not enough space in the buffer	*/
+    {					/* for the length field - pad and empty it	*/
+        if((cnt & 63) == 55) ctx->wdat[14] = 0;
+        if((cnt & 63) <= 59) ctx->wdat[15] = 0;
+        sha256_compile(ctx);
+        cnt = 0;
+    }
+    else	/* compute a word index for the empty buffer positions	*/
+        cnt = (cnt >> 2) + 1;
+
+    while(cnt < 14)	/* and zero pad all but last two positions		*/ 
+        ctx->wdat[cnt++] = 0;
+    
+    /* the following 32-bit length fields are assembled in the		*/
+	/* wrong byte order on little endian machines but this is		*/
+	/* corrected later since they are only ever used as 32-bit		*/
+	/* word values.													*/
+
+    ctx->wdat[14] = (ctx->count[1] << 3) | (ctx->count[0] >> 29);
+    ctx->wdat[15] = ctx->count[0] << 3;
+
+    sha256_compile(ctx);
+
+	/* extract the hash value as bytes in case the hash buffer is	*/
+	/* mislaigned for 32-bit words									*/
+
+	for(i = 0; i < SHA256_DIGEST_LENGTH; ++i)
+        hval[i] = (unsigned char)(ctx->hash[i >> 2] >> (24 - 8 * (i & 3)));
+}
+
+#endif
+
+#if defined(SHA_2) || defined(SHA_384) || defined(SHA_512)
+
+/* SHA512 mixing function definitions   */
+
+#define s512_0(x) (rotr64((x), 28) ^ rotr64((x), 34) ^ rotr64((x), 39)) 
+#define s512_1(x) (rotr64((x), 14) ^ rotr64((x), 18) ^ rotr64((x), 41)) 
+#define g512_0(x) (rotr64((x),  1) ^ rotr64((x),  8) ^ ((x) >>  7)) 
+#define g512_1(x) (rotr64((x), 19) ^ rotr64((x), 61) ^ ((x) >>  6)) 
+
+/* rotated SHA512 round definition. Rather than swapping variables as in    */
+/* FIPS-180, different variables are 'rotated' on each round, returning     */
+/* to their starting positions every eight rounds                           */
+
+#define h5(i) ctx->wdat[i & 15] += \
+    g512_1(ctx->wdat[(i + 14) & 15]) + ctx->wdat[(i + 9) & 15] + g512_0(ctx->wdat[(i + 1) & 15])
+
+#define h5_cycle(i,j)  \
+    v[(7 - i) & 7] += (j ? h5(i) : ctx->wdat[i & 15]) + k512[i + j] \
+        + s512_1(v[(4 - i) & 7]) + ch(v[(4 - i) & 7], v[(5 - i) & 7], v[(6 - i) & 7]); \
+    v[(3 - i) & 7] += v[(7 - i) & 7]; \
+    v[(7 - i) & 7] += s512_0(v[(0 - i) & 7]) + maj(v[(0 - i) & 7], v[(1 - i) & 7], v[(2 - i) & 7])
+
+/* SHA384/SHA512 mixing data    */
+
+const sha_64t  k512[80] = 
+{
+    n_u64(428a2f98d728ae22), n_u64(7137449123ef65cd), 
+    n_u64(b5c0fbcfec4d3b2f), n_u64(e9b5dba58189dbbc),
+    n_u64(3956c25bf348b538), n_u64(59f111f1b605d019),
+    n_u64(923f82a4af194f9b), n_u64(ab1c5ed5da6d8118),
+    n_u64(d807aa98a3030242), n_u64(12835b0145706fbe),
+    n_u64(243185be4ee4b28c), n_u64(550c7dc3d5ffb4e2),
+    n_u64(72be5d74f27b896f), n_u64(80deb1fe3b1696b1),
+    n_u64(9bdc06a725c71235), n_u64(c19bf174cf692694),
+    n_u64(e49b69c19ef14ad2), n_u64(efbe4786384f25e3),
+    n_u64(0fc19dc68b8cd5b5), n_u64(240ca1cc77ac9c65),
+    n_u64(2de92c6f592b0275), n_u64(4a7484aa6ea6e483),
+    n_u64(5cb0a9dcbd41fbd4), n_u64(76f988da831153b5),
+    n_u64(983e5152ee66dfab), n_u64(a831c66d2db43210),
+    n_u64(b00327c898fb213f), n_u64(bf597fc7beef0ee4),
+    n_u64(c6e00bf33da88fc2), n_u64(d5a79147930aa725),
+    n_u64(06ca6351e003826f), n_u64(142929670a0e6e70),
+    n_u64(27b70a8546d22ffc), n_u64(2e1b21385c26c926),
+    n_u64(4d2c6dfc5ac42aed), n_u64(53380d139d95b3df),
+    n_u64(650a73548baf63de), n_u64(766a0abb3c77b2a8),
+    n_u64(81c2c92e47edaee6), n_u64(92722c851482353b),
+    n_u64(a2bfe8a14cf10364), n_u64(a81a664bbc423001),
+    n_u64(c24b8b70d0f89791), n_u64(c76c51a30654be30),
+    n_u64(d192e819d6ef5218), n_u64(d69906245565a910),
+    n_u64(f40e35855771202a), n_u64(106aa07032bbd1b8),
+    n_u64(19a4c116b8d2d0c8), n_u64(1e376c085141ab53),
+    n_u64(2748774cdf8eeb99), n_u64(34b0bcb5e19b48a8),
+    n_u64(391c0cb3c5c95a63), n_u64(4ed8aa4ae3418acb),
+    n_u64(5b9cca4f7763e373), n_u64(682e6ff3d6b2b8a3),
+    n_u64(748f82ee5defb2fc), n_u64(78a5636f43172f60),
+    n_u64(84c87814a1f0ab72), n_u64(8cc702081a6439ec),
+    n_u64(90befffa23631e28), n_u64(a4506cebde82bde9),
+    n_u64(bef9a3f7b2c67915), n_u64(c67178f2e372532b),
+    n_u64(ca273eceea26619c), n_u64(d186b8c721c0c207),
+    n_u64(eada7dd6cde0eb1e), n_u64(f57d4f7fee6ed178),
+    n_u64(06f067aa72176fba), n_u64(0a637dc5a2c898a6),
+    n_u64(113f9804bef90dae), n_u64(1b710b35131c471b),
+    n_u64(28db77f523047d84), n_u64(32caab7b40c72493),
+    n_u64(3c9ebe0a15c9bebc), n_u64(431d67c49c100d4c),
+    n_u64(4cc5d4becb3e42b6), n_u64(597f299cfc657e2a),
+    n_u64(5fcb6fab3ad6faec), n_u64(6c44198c4a475817)
+};
+
+/* Compile 64 bytes of hash data into SHA384/SHA512 digest value  */
+
+static void sha512_compile(sha512_ctx ctx[1])
+{   sha_64t    v[8];
+    sha_32t    j;
+
+    memcpy(v, ctx->hash, 64);
+
+    for(j = 0; j < 80; j += 16)
+    {
+        h5_cycle( 0, j); h5_cycle( 1, j); h5_cycle( 2, j); h5_cycle( 3, j);
+        h5_cycle( 4, j); h5_cycle( 5, j); h5_cycle( 6, j); h5_cycle( 7, j);
+        h5_cycle( 8, j); h5_cycle( 9, j); h5_cycle(10, j); h5_cycle(11, j);
+        h5_cycle(12, j); h5_cycle(13, j); h5_cycle(14, j); h5_cycle(15, j);
+    }
+
+    ctx->hash[0] += v[0]; ctx->hash[1] += v[1]; ctx->hash[2] += v[2]; ctx->hash[3] += v[3];
+    ctx->hash[4] += v[4]; ctx->hash[5] += v[5]; ctx->hash[6] += v[6]; ctx->hash[7] += v[7];
+}
+
+/* SHA512 hash data in an array of bytes into hash buffer and call the      */
+/* hash_compile function as required.                                       */
+
+/* If FAST_COPY is defined the data to be hashed is processed as an array   */
+/* bytes and compiled into the buffer ctx->wdat[] of 32-bit words in the    */
+/* native byte order.  On little endian machines a 32-bit word byte swap    */
+/* is then performed before this data is compiled into the hash. But when   */
+/* FAST_COPY is not defined the bytes are compiled into the buffer in the   */
+/* big-endian format directly so no later byte order changes are needed.    */
+
+#if defined(FAST_COPY)
+
+void sha512_hash(const unsigned char data[], const unsigned long len, sha512_ctx ctx[1])
+{   sha_32t            free = 128 - (sha_32t)(ctx->count[0] & 127), rlen = len, j;
+    const unsigned char *sp = data;
+    unsigned char       *p = ((unsigned char*)ctx->wdat) + (ctx->count[0] & 127);
+
+    while(rlen >= free)     /* tranfer whole blocks while possible  */
+    {
+        memcpy(p, sp, free);
+        if((ctx->count[0] += free) < free)
+            ++(ctx->count[1]);
+        sp += free; rlen -= free; free = 128; 
+        p = (unsigned char*)ctx->wdat;
+#if defined(SWAP_BYTES)
+        for(j = 0; j < 16; ++j)
+            ctx->wdat[j] = bswap_64(ctx->wdat[j]);
+#endif
+        sha512_compile(ctx);
+    }
+
+    memcpy(p, sp, rlen);    /* transfer partial block               */
+    if((ctx->count[0] += rlen) < rlen)
+        ++(ctx->count[1]);
+    p = (unsigned char*)ctx->wdat;
+    rlen = (sha_32t)(ctx->count[0] & 127);
+    while(rlen & 7)         /* ensure rest of 32-bit word is zero   */
+        *(p + rlen++) = 0;
+}
+
+#elif defined(WORD_COPY)    /* alternative implementations          */
+
+void sha512_hash(const unsigned char data[], unsigned long len, sha512_ctx ctx[1])
+{   sha_32t    i = 0, cnt, j;
+    sha_64t    *ptr, val;
+
+    ptr = ctx->wdat + ((ctx->count[0] >> 3) & 15);
+    cnt = (ctx->count[0] << 3) & 56;
+    val = (cnt ? *ptr : 0);
+    while(i < len)
+    {   /* assemble values in big-endian format */
+        val |= ((sha_64t)data[i++]) << 56 - cnt;
+        if(!++(ctx->count[0])) ++(ctx->count[1]);
+        if(!(cnt = (cnt + 8) & 56))
+        {   *ptr++ = val; val = 0;
+            if(ptr - ctx->wdat == 16) 
+            {
+                sha512_compile(ctx); 
+                ptr = ctx->wdat;
+            }
+        }
+    }
+    *ptr = val;
+}
+
+#else
+
+void sha512_hash(const unsigned char data[], unsigned long len, sha512_ctx ctx[1])
+{   sha_32t i = 0, cnt = ctx->count[0], j;
+
+    while(i < len)
+    {   /* assemble values in big-endian format */
+        if((cnt & 7) == 0) ctx->wdat[(cnt >> 3) & 15] = 0;
+        ctx->wdat[(cnt >> 3) & 15] |= (sha_64t)data[i++] << (56 - (8 * (cnt & 7)));
+        if(!++(ctx->count[0])) ++(ctx->count[1]);
+        if((++cnt & 127) == 0) 
+        {
+            sha512_compile(ctx);
+        }
+    }
+}
+
+#endif
+
+/* SHA384/512 Final padding and digest calculation  */
+
+static void sha_end(unsigned char hval[], sha512_ctx ctx[1], const unsigned int hlen)
+{   sha_32t    i, j, cnt = (sha_32t)(ctx->count[0] & 127);
+
+#if defined(SWAP_BYTES)
+        for(i = 0, j = (cnt + 7) >> 3; i < j; ++i)
+            ctx->wdat[i] = bswap_64(ctx->wdat[i]);
+#endif
+
+    /* we are now in big-endian order within the ctx-wdat[] buffer  */
+
+    if(cnt & 7)
+        ctx->wdat[(cnt >> 3) & 15] 
+            |= n_u64(0000000000000080) << (56  - (8 * (cnt & 7)));
+    else
+        ctx->wdat[(cnt >> 3) & 15] = n_u64(8000000000000000);
+
+    if((cnt & 127) > 111)
+    {
+        if((cnt & 127) == 111) ctx->wdat[14] = 0;
+        if((cnt & 127) <= 119) ctx->wdat[15] = 0;
+        sha512_compile(ctx);
+        cnt = 0;
+    }
+    else
+        cnt = (cnt >> 3) + 1;
+
+    while(cnt < 14)
+        ctx->wdat[cnt++] = 0;
+    
+    /* the following 32-bit length fields are assembled in the wrong	*/
+	/* byte	order on little endian machines but this is corrected later	*/
+	/* since they are only picked up as 32-bit word values.				*/
+
+    ctx->wdat[14] = (ctx->count[1] << 3) | (ctx->count[0] >> 29);
+    ctx->wdat[15] = ctx->count[0] << 3;
+
+    sha512_compile(ctx);
+
+    for(i = 0; i < hlen; ++i)
+        hval[i] = (unsigned char)(ctx->hash[i >> 3] >> (56 - 8 * (i & 7)));
+}
+
+#endif
+
+#if defined(SHA_2) || defined(SHA_384)
+
+/* SHA384 initialisation data   */
+
+const sha_64t  i384[80] = 
+{
+    n_u64(cbbb9d5dc1059ed8), n_u64(629a292a367cd507),
+    n_u64(9159015a3070dd17), n_u64(152fecd8f70e5939),
+    n_u64(67332667ffc00b31), n_u64(8eb44a8768581511),
+    n_u64(db0c2e0d64f98fa7), n_u64(47b5481dbefa4fa4)
+};
+
+void sha384_begin(sha384_ctx ctx[1])
+{
+    ctx->count[0] = ctx->count[1] = 0;
+    memcpy(ctx->hash, i384, 64);
+}
+
+void sha384_end(unsigned char hval[], sha384_ctx ctx[1])
+{
+    sha_end(hval, ctx, SHA384_DIGEST_LENGTH);
+}
+
+#endif
+
+#if defined(SHA_2) || defined(SHA_512)
+
+/* SHA512 initialisation data   */
+
+const sha_64t  i512[80] = 
+{
+    n_u64(6a09e667f3bcc908), n_u64(bb67ae8584caa73b),
+    n_u64(3c6ef372fe94f82b), n_u64(a54ff53a5f1d36f1),
+    n_u64(510e527fade682d1), n_u64(9b05688c2b3e6c1f),
+    n_u64(1f83d9abfb41bd6b), n_u64(5be0cd19137e2179)
+};
+
+void sha512_begin(sha512_ctx ctx[1])
+{
+    ctx->count[0] = ctx->count[1] = 0;
+    memcpy(ctx->hash, i512, 64);
+}
+
+void sha512_end(unsigned char hval[], sha512_ctx ctx[1])
+{
+    sha_end(hval, ctx, SHA512_DIGEST_LENGTH);
+}
+
+#endif
+
+#if defined(SHA_2)
+
+#define CTX_256(x)  ((x)->uu->ctx256)
+#define CTX_384(x)  ((x)->uu->ctx512)
+#define CTX_512(x)  ((x)->uu->ctx512)
+
+/* SHA2 initialisation */
+
+int sha2_begin(const unsigned long len, sha2_ctx ctx[1])
+{   unsigned long   l = len;
+    switch(len)
+    {
+        case 256:   l = len >> 3;
+        case  32:   CTX_256(ctx)->count[0] = CTX_256(ctx)->count[1] = 0;
+                    memcpy(CTX_256(ctx)->hash, i256, 32); break;
+        case 384:   l = len >> 3;
+        case  48:   CTX_384(ctx)->count[0] = CTX_384(ctx)->count[1] = 0;
+                    memcpy(CTX_384(ctx)->hash, i384, 64); break;
+        case 512:   l = len >> 3;
+        case  64:   CTX_512(ctx)->count[0] = CTX_512(ctx)->count[1] = 0;
+                    memcpy(CTX_512(ctx)->hash, i512, 64); break;
+        default:    return SHA2_BAD;
+    }
+    
+    ctx->sha2_len = l; return SHA2_GOOD;
+}
+
+void sha2_hash(const unsigned char data[], const unsigned long len, sha2_ctx ctx[1])
+{
+    switch(ctx->sha2_len)
+    {
+        case 32: sha256_hash(data, len, CTX_256(ctx)); return;
+        case 48: sha384_hash(data, len, CTX_384(ctx)); return;
+        case 64: sha512_hash(data, len, CTX_512(ctx)); return;
+    }
+}
+
+void sha2_end(unsigned char hval[], sha2_ctx ctx[1])
+{
+    switch(ctx->sha2_len)
+    {
+        case 32: sha256_end(hval, CTX_256(ctx)); return;
+        case 48: sha_end(hval, CTX_384(ctx), SHA384_DIGEST_LENGTH); return;
+        case 64: sha_end(hval, CTX_512(ctx), SHA512_DIGEST_LENGTH); return;
+    }
+}
+
+#endif
+
diff --git a/src/libm/sha2.h b/src/libm/sha2.h
new file mode 100644
index 000000000000..3fa627f98d7c
--- /dev/null
+++ b/src/libm/sha2.h
@@ -0,0 +1,128 @@
+/*
+ -------------------------------------------------------------------------
+ Copyright (c) 2001, Dr Brian Gladman <brg-5Ifv9E4uLVAJ3nxcUk3PyQ@public.gmane.org>, Worcester, UK.
+ All rights reserved.
+
+ LICENSE TERMS
+
+ The free distribution and use of this software in both source and binary 
+ form is allowed (with or without changes) provided that:
+
+   1. distributions of this source code include the above copyright 
+      notice, this list of conditions and the following disclaimer;
+
+   2. distributions in binary form include the above copyright
+      notice, this list of conditions and the following disclaimer
+      in the documentation and/or other associated materials;
+
+   3. the copyright holder's name is not used to endorse products 
+      built using this software without specific written permission. 
+
+ DISCLAIMER
+
+ This software is provided 'as is' with no explicit or implied warranties
+ in respect of its properties, including, but not limited to, correctness 
+ and fitness for purpose.
+ -------------------------------------------------------------------------
+Issue Date: 9/10/2002
+*/
+
+#ifndef _SHA2_H
+#define _SHA2_H
+
+#include <limits.h>
+
+/*  Defines for suffixes to 32 and 64 bit unsigned numeric values	*/
+
+#define sfx_lo(x,y) x##y
+#define sfx_hi(x,y) sfx_lo(x,y)
+#define n_u32(p)    sfx_hi(0x##p,s_u32)
+#define n_u64(p)    sfx_hi(0x##p,s_u64)
+
+/* define an unsigned 32-bit type */
+
+#if UINT_MAX == 0xffffffff
+  typedef   unsigned int     sha_32t;
+  #define s_u32    u
+#elif ULONG_MAX == 0xffffffff
+  typedef   unsigned long    sha_32t;
+  #define s_u32   ul
+#else
+#error Please define sha_32t as an unsigned 32 bit type in sha2.h
+#endif
+
+/* define an unsigned 64-bit type */
+
+#if defined( _MSC_VER )
+  typedef unsigned __int64   sha_64t;
+  #define s_u64 ui64
+#elif ULONG_MAX == 0xffffffffffffffff
+  typedef unsigned long      sha_64t;
+  #define s_u64   ul
+#elif ULONG_MAX == 0xffffffff
+  typedef unsigned long long sha_64t;	/* a somewhat dangerous guess */
+  #define s_u64  ull
+#else
+#error Please define sha_64t as an unsigned 64 bit type in sha2.h
+#endif
+
+#if defined(__cplusplus)
+extern "C"
+{
+#endif
+
+#define SHA256_DIGEST_LENGTH    32
+#define SHA384_DIGEST_LENGTH    48
+#define SHA512_DIGEST_LENGTH    64
+
+#define SHA2_DIGEST_LENGTH      SHA256_DIGEST_LENGTH
+#define SHA2_MAX_DIGEST_LENGTH  SHA512_DIGEST_LENGTH
+
+#define SHA2_GOOD   0
+#define SHA2_BAD    1
+
+/* type to hold the SHA256 context  */
+
+typedef struct
+{   sha_32t count[2];
+    sha_32t hash[8];
+    sha_32t wdat[16];
+} sha256_ctx;
+
+typedef struct
+{   sha_64t count[2];
+    sha_64t hash[8];
+    sha_64t wdat[16];
+} sha512_ctx;
+
+typedef sha512_ctx  sha384_ctx;
+
+typedef struct
+{   union
+    {   sha256_ctx  ctx256[1];
+        sha512_ctx  ctx512[1];
+    } uu[1];
+    sha_32t    sha2_len;
+} sha2_ctx;
+
+void sha256_begin(sha256_ctx ctx[1]);
+void sha256_hash(const unsigned char data[], const unsigned long len, sha256_ctx ctx[1]);
+void sha256_end(unsigned char hval[], sha256_ctx ctx[1]);
+
+void sha384_begin(sha384_ctx ctx[1]);
+#define sha384_hash sha512_hash
+void sha384_end(unsigned char hval[], sha384_ctx ctx[1]);
+
+void sha512_begin(sha512_ctx ctx[1]);
+void sha512_hash(const unsigned char data[], const unsigned long len, sha512_ctx ctx[1]);
+void sha512_end(unsigned char hval[], sha512_ctx ctx[1]);
+
+int sha2_begin(const unsigned long len, sha2_ctx ctx[1]);
+void sha2_hash(const unsigned char data[], const unsigned long len, sha2_ctx ctx[1]);
+void sha2_end(unsigned char hval[], sha2_ctx ctx[1]);
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif
diff --git a/src/libm/spDivide.c b/src/libm/spDivide.c
new file mode 100644
index 000000000000..11a8242eb13b
--- /dev/null
+++ b/src/libm/spDivide.c
@@ -0,0 +1,175 @@
+/* spDivide.c */
+
+#include "bigdigits.h"
+#define B (MAX_HALF_DIGIT + 1)
+
+static void spMultSub(DIGIT_T uu[2], DIGIT_T qhat, 
+					  DIGIT_T v1, DIGIT_T v0);
+
+
+DIGIT_T spDivide(DIGIT_T *q, DIGIT_T *r, DIGIT_T u[2], DIGIT_T v)
+{	
+#if MCRYPTO_USE_ASM==1	
+	/* use inline assembly for this routine */
+	#ifdef __GNUC__
+	/* gnu c uses AT&T syntax */
+	#else
+	/* for compiler uses Intel syntax, say Intel C++ */
+	#endif	
+#else
+	/*	Computes quotient q = u / v, remainder r = u mod v
+		where u is a double digit
+		and q, v, r are single precision digits.
+		Returns high digit of quotient (max value is 1)
+		Assumes normalised such that v1 >= b/2
+		where b is size of HALF_DIGIT
+		i.e. the most significant bit of v should be one
+
+		In terms of half-digits in Knuth notation:
+		(q2q1q0) = (u4u3u2u1u0) / (v1v0)
+		(r1r0) = (u4u3u2u1u0) mod (v1v0)
+		for m = 2, n = 2 where u4 = 0
+		q2 is either 0 or 1.
+		We set q = (q1q0) and return q2 as "overflow'
+	*/
+	DIGIT_T qhat, rhat, t, v0, v1, u0, u1, u2, u3;
+	DIGIT_T uu[2], q2;
+
+	/* Check for normalisation */
+	if (!(v & HIBITMASK))
+	{
+		*q = *r = 0;
+		return MAX_DIGIT;
+	}
+	
+	/* Split up into half-digits */
+	v0 = LOHALF(v);
+	v1 = HIHALF(v);
+	u0 = LOHALF(u[0]);
+	u1 = HIHALF(u[0]);
+	u2 = LOHALF(u[1]);
+	u3 = HIHALF(u[1]);
+
+	/* Do three rounds of Knuth Algorithm D Vol 2 p272 */
+
+	/*	ROUND 1. Set j = 2 and calculate q2 */
+	/*	Estimate qhat = (u4u3)/v1  = 0 or 1 
+		then set (u4u3u2) -= qhat(v1v0)
+		where u4 = 0.
+	*/
+	qhat = u3 / v1;
+	if (qhat > 0)
+	{
+		rhat = u3 - qhat * v1;
+		t = TOHIGH(rhat) | u2;
+		if (qhat * v0 > t)
+			qhat--;
+	}
+	uu[1] = 0;		/* (u4) */
+	uu[0] = u[1];	/* (u3u2) */
+	if (qhat > 0)
+	{
+		/* (u4u3u2) -= qhat(v1v0) where u4 = 0 */
+		spMultSub(uu, qhat, v1, v0);
+		if (HIHALF(uu[1]) != 0)
+		{	/* Add back */
+			qhat--;
+			uu[0] += v;
+			uu[1] = 0;
+		}
+	}
+	q2 = qhat;
+
+	/*	ROUND 2. Set j = 1 and calculate q1 */
+	/*	Estimate qhat = (u3u2) / v1 
+		then set (u3u2u1) -= qhat(v1v0)
+	*/
+	t = uu[0];
+	qhat = t / v1;
+	rhat = t - qhat * v1;
+	/* Test on v0 */
+	t = TOHIGH(rhat) | u1;
+	if ((qhat == B) || (qhat * v0 > t))
+	{
+		qhat--;
+		rhat += v1;
+		t = TOHIGH(rhat) | u1;
+		if ((rhat < B) && (qhat * v0 > t))
+			qhat--;
+	}
+
+	/*	Multiply and subtract 
+		(u3u2u1)' = (u3u2u1) - qhat(v1v0)	
+	*/
+	uu[1] = HIHALF(uu[0]);	/* (0u3) */
+	uu[0] = TOHIGH(LOHALF(uu[0])) | u1;	/* (u2u1) */
+	spMultSub(uu, qhat, v1, v0);
+	if (HIHALF(uu[1]) != 0)
+	{	/* Add back */
+		qhat--;
+		uu[0] += v;
+		uu[1] = 0;
+	}
+
+	/* q1 = qhat */
+	*q = TOHIGH(qhat);
+
+	/* ROUND 3. Set j = 0 and calculate q0 */
+	/*	Estimate qhat = (u2u1) / v1
+		then set (u2u1u0) -= qhat(v1v0)
+	*/
+	t = uu[0];
+	qhat = t / v1;
+	rhat = t - qhat * v1;
+	/* Test on v0 */
+	t = TOHIGH(rhat) | u0;
+	if ((qhat == B) || (qhat * v0 > t))
+	{
+		qhat--;
+		rhat += v1;
+		t = TOHIGH(rhat) | u0;
+		if ((rhat < B) && (qhat * v0 > t))
+			qhat--;
+	}
+
+	/*	Multiply and subtract 
+		(u2u1u0)" = (u2u1u0)' - qhat(v1v0)
+	*/
+	uu[1] = HIHALF(uu[0]);	/* (0u2) */
+	uu[0] = TOHIGH(LOHALF(uu[0])) | u0;	/* (u1u0) */
+	spMultSub(uu, qhat, v1, v0);
+	if (HIHALF(uu[1]) != 0)
+	{	/* Add back */
+		qhat--;
+		uu[0] += v;
+		uu[1] = 0;
+	}
+
+	/* q0 = qhat */
+	*q |= LOHALF(qhat);
+
+	/* Remainder is in (u1u0) i.e. uu[0] */
+	*r = uu[0];
+	
+	return q2;
+#endif
+}
+
+static void spMultSub(DIGIT_T uu[2], DIGIT_T qhat, 
+					  DIGIT_T v1, DIGIT_T v0)
+{
+	/*	Compute uu = uu - q(v1v0) 
+		where uu = u3u2u1u0, u3 = 0
+		and u_n, v_n are all half-digits
+		even though v1, v2 are passed as full digits.
+	*/
+	DIGIT_T p0, p1, t;
+
+	p0 = qhat * v0;
+	p1 = qhat * v1;
+	t = p0 + TOHIGH(LOHALF(p1));
+	uu[0] -= t;
+	if (uu[0] > MAX_DIGIT - t)
+		uu[1]--;	/* Borrow */
+	uu[1] -= HIHALF(p1);
+}
diff --git a/src/libm/spGcd.c b/src/libm/spGcd.c
new file mode 100644
index 000000000000..0e8c1a4ef40b
--- /dev/null
+++ b/src/libm/spGcd.c
@@ -0,0 +1,24 @@
+/* spGcd.c */
+
+#include "bigdigits.h"
+
+DIGIT_T spGcd(DIGIT_T x, DIGIT_T y)
+{	/*	Returns gcd(x, y) */
+
+	/* Ref: Schneier 2nd ed, p245 */
+	
+	DIGIT_T g;
+
+	if (x + y == 0)
+		return 0;	/* Error */
+
+	g = y;
+	while (x > 0)
+	{
+		g = x;
+		x = y % x;
+		y = g;
+	}
+	
+	return g;
+}
diff --git a/src/libm/spIsPrime.c b/src/libm/spIsPrime.c
new file mode 100644
index 000000000000..3e85592869c4
--- /dev/null
+++ b/src/libm/spIsPrime.c
@@ -0,0 +1,89 @@
+/* spIsPrime.c */
+
+#include <assert.h>
+#include "bigdigits.h"
+
+static DIGIT_T SMALL_PRIMES[] = { 2, 3, 5, 7, 11, 13, 17, 19 };
+#define N_SMALL_PRIMES sizeof(SMALL_PRIMES)/sizeof(DIGIT_T)
+
+int spIsPrime(DIGIT_T w, UINT t)
+{	/*	Returns true if w is a probable prime 
+		Carries out t iterations
+		(Use t = 50 for DSS Standard) 
+	*/
+	/*	Uses Rabin-Miller Probabilistic Primality Test,
+		Ref: FIPS-186-2 Appendix 2.
+		Also Schneier 2nd ed p 260 & Knuth Vol 2, p 379.
+	*/
+	/*	Rabin-Miller Probabilistic Primality Test,
+		from FIPS-186-2 Appendix 2.
+		Also Schneier 2nd ed p 260 & Knuth Vol 2, p 379.
+	*/
+
+	UINT i, j;
+	DIGIT_T m, a, b, z;
+	int failed;
+
+	/*	First check for small primes */
+	for (i = 0; i < N_SMALL_PRIMES; i++)
+	{
+		if (w % SMALL_PRIMES[i] == 0)
+			return 0;	/* Failed */
+	}
+
+	/*	Now do Rabin-Miller  */
+	/*	Step 2. Find a and m where w = 1 + (2^a)m
+		m is odd and 2^a is largest power of 2 dividing w - 1 */
+	m = w - 1;
+	for (a = 0; ISEVEN(m); a++)
+		m >>= 1;	/* Divide by 2 until m is odd */
+
+	/*
+	assert((1 << a) * m + 1 == w);
+	*/
+
+	for (i = 0; i < t; i++)
+	{
+		failed = 1;	/* Assume fail unless passed in loop */
+		/* Step 3. Generate a random integer 1 < b < w */
+		b = spPseudoRand(2, w - 1);
+
+		/*
+		assert(1 < b && b < w);
+		*/
+
+		/* Step 4. Set j = 0 and z = b^m mod w */
+		j = 0;
+		spModExp(&z, b, m, w);
+		do
+		{
+			/* Step 5. If j = 0 and z = 1, or if z = w - 1 */
+			if ((j == 0 && z == 1) || (z == w - 1))
+			{	/* Passes on this loop  - go to Step 9 */
+				failed = 0;
+				break;
+			}
+
+			/* Step 6. If j > 0 and z = 1 */
+			if (j > 0 && z == 1)
+			{	/* Fails - go to Step 8 */
+				failed = 1;
+				break;
+			}
+
+			/* Step 7. j = j + 1. If j < a set z = z^2 mod w */
+			j++;
+			if (j < a)
+				spModMult(&z, z, z, w);
+			/* Loop: if j < a go to Step 5 */
+		} while (j < a);
+
+		if (failed)
+		{	/* Step 8. Not a prime - stop */
+			return 0;
+		}
+	}	/* Step 9. Go to Step 3 until i >= n */
+	/* If got here, probably prime => success */
+	
+	return 1;
+}
diff --git a/src/libm/spModExp.c b/src/libm/spModExp.c
new file mode 100644
index 000000000000..07683304f798
--- /dev/null
+++ b/src/libm/spModExp.c
@@ -0,0 +1,64 @@
+/* spModExp.c */
+
+#include "bigdigits.h"
+
+static int spModExpK(DIGIT_T *exp, DIGIT_T x, 
+			DIGIT_T n, DIGIT_T d);
+static int spModExpB(DIGIT_T *exp, DIGIT_T x, 
+			DIGIT_T n, DIGIT_T d);
+
+int spModExp(DIGIT_T *exp, DIGIT_T x, 
+			DIGIT_T n, DIGIT_T d)
+{
+	return spModExpB(exp, x, n, d);
+}
+
+static int spModExpK(DIGIT_T *exp, DIGIT_T x, 
+			DIGIT_T n, DIGIT_T d)
+{	/*	Computes exp = x^n mod d */
+	/*	Ref: Knuth Vol 2 Ch 4.6.3 p 462 Algorithm A
+	*/
+	DIGIT_T y = 1;		/* Step A1. Initialise */
+
+	while (n > 0)
+	{							/* Step A2. Halve N */
+		if (n & 0x1)			/* If odd */
+			spModMult(&y, y, x, d);	/*   Step A3. Multiply Y by Z */	
+		
+		n >>= 1;					/* Halve N */
+		if (n > 0)				/* Step A4. N = 0? Y is answer */
+			spModMult(&x, x, x, d);	/* Step A5. Square Z */
+	}
+
+	*exp = y;
+	return 0;
+}
+
+static int spModExpB(DIGIT_T *exp, DIGIT_T x, 
+			DIGIT_T e, DIGIT_T m)
+{	/*	Computes exp = x^e mod m */
+	/*	Binary left-to-right method
+	*/
+	DIGIT_T mask;
+	DIGIT_T y;	/* Temp variable */
+
+	/* Find most significant bit in e */
+	for (mask = HIBITMASK; mask > 0; mask >>= 1)
+	{
+		if (e & mask)
+			break;
+	}
+
+	y = x;
+	/* For j = k-2 downto 0 step -1 */
+	for (mask >>= 1; mask > 0; mask >>= 1)
+	{
+		spModMult(&y, y, y, m);		/* Square */
+		if (e & mask)
+			spModMult(&y, y, x, m);	/* Multiply */
+	}
+
+	*exp = y;
+	
+	return 0;
+}
diff --git a/src/libm/spModInv.c b/src/libm/spModInv.c
new file mode 100644
index 000000000000..0a03a8434176
--- /dev/null
+++ b/src/libm/spModInv.c
@@ -0,0 +1,41 @@
+/* spModInv.c */
+
+#include "bigdigits.h"
+
+int spModInv(DIGIT_T *inv, DIGIT_T u, DIGIT_T v)
+{	/*	Computes inv = u^(-1) mod v */
+	/*	Ref: Knuth Algorithm X Vol 2 p 342 
+		ignoring u2, v2, t2
+		and avoiding negative numbers
+	*/
+	DIGIT_T u1, u3, v1, v3, t1, t3, q, w;
+	int bIterations = 1;
+	
+	/* Step X1. Initialise */
+	u1 = 1;
+	u3 = u;
+	v1 = 0;
+	v3 = v;
+
+	while (v3 != 0)	/* Step X2. */
+	{	/* Step X3. */
+		q = u3 / v3;	/* Divide and */
+		t3 = u3 % v3;
+		w = q * v1;		/* "Subtract" */
+		t1 = u1 + w;
+		/* Swap */
+		u1 = v1;
+		v1 = t1;
+		u3 = v3;
+		v3 = t3;
+		bIterations = -bIterations;
+	}
+
+	if (bIterations < 0)
+		*inv = v - u1;
+	else
+		*inv = u1;
+
+	return 0;
+}
+
diff --git a/src/libm/spModMult.c b/src/libm/spModMult.c
new file mode 100644
index 000000000000..16d583a7b092
--- /dev/null
+++ b/src/libm/spModMult.c
@@ -0,0 +1,17 @@
+/* spModMult.c */
+
+#include "bigdigits.h"
+
+int spModMult(DIGIT_T *a, DIGIT_T x, DIGIT_T y, DIGIT_T m)
+{	/*	Computes a = (x * y) mod m */
+	
+	/* Calc p[2] = x * y */
+	DIGIT_T p[2];
+	spMultiply(p, x, y);
+
+	/* Then modulo */
+	*a = mpShortMod(p, m, 2);
+	
+	return 0;
+}
+
diff --git a/src/libm/spMultiply.c b/src/libm/spMultiply.c
new file mode 100644
index 000000000000..51d5e3ebd82a
--- /dev/null
+++ b/src/libm/spMultiply.c
@@ -0,0 +1,76 @@
+/* spMultiply.c */
+
+#include "bigdigits.h"
+
+int spMultiply(DIGIT_T p[2], DIGIT_T x, DIGIT_T y)
+{	
+#if MCRYPTO_USE_ASM==1
+	/* use inline assembly for this routine */
+	#ifdef __GNUC__
+	/* gnu c uses AT&T syntax */
+	#else
+	/* for compiler uses Intel syntax, say Intel C++ */
+	#endif	
+
+#else	
+	/*	Computes p = x * y */
+	/*	Ref: Arbitrary Precision Computation
+	http://numbers.computation.free.fr/Constants/constants.html
+
+         high    p1                p0     low
+        +--------+--------+--------+--------+
+        |      x1*y1      |      x0*y0      |
+        +--------+--------+--------+--------+
+               +-+--------+--------+
+               |1| (x0*y1 + x1*y1) |
+               +-+--------+--------+
+                ^carry from adding (x0*y1+x1*y1) together
+                        +-+
+                        |1|< carry from adding LOHALF t
+                        +-+  to high half of p0
+	*/
+	DIGIT_T x0, y0, x1, y1;
+	DIGIT_T t, u, carry;
+
+	/*	Split each x,y into two halves
+		x = x0 + B*x1
+		y = y0 + B*y1
+		where B = 2^16, half the digit size
+		Product is
+		xy = x0y0 + B(x0y1 + x1y0) + B^2(x1y1)
+	*/
+
+	x0 = LOHALF(x);
+	x1 = HIHALF(x);
+	y0 = LOHALF(y);
+	y1 = HIHALF(y);
+
+	/* Calc low part - no carry */
+	p[0] = x0 * y0;
+
+	/* Calc middle part */
+	t = x0 * y1;
+	u = x1 * y0;
+	t += u;
+	if (t < u)
+		carry = 1;
+	else
+		carry = 0;
+
+	/*	This carry will go to high half of p[1]
+		+ high half of t into low half of p[1] */
+	carry = TOHIGH(carry) + HIHALF(t);
+
+	/* Add low half of t to high half of p[0] */
+	t = TOHIGH(t);
+	p[0] += t;
+	if (p[0] < t)
+		carry++;
+
+	p[1] = x1 * y1;
+	p[1] += carry;
+#endif
+
+	return 0;
+}
+
diff --git a/src/libm/spPseudoRand.c b/src/libm/spPseudoRand.c
new file mode 100644
index 000000000000..6c72b11f515d
--- /dev/null
+++ b/src/libm/spPseudoRand.c
@@ -0,0 +1,30 @@
+/* spPseudoRand */
+
+#include <stdlib.h>
+#include <time.h>
+#include "bigdigits.h"
+
+DIGIT_T spPseudoRand(DIGIT_T lower, DIGIT_T upper)
+{	
+	/*	Returns a pseudo-random digit.
+		Handles own seeding using time
+		NOT for cryptographically-secure random numbers.
+	*/
+	static unsigned seeded = 0;
+	UINT i;
+	double f;
+
+	if (!seeded)
+	{
+		/* seed with system time */
+		srand((unsigned)time(NULL));
+		/* Throw away a random few to avoid similar starts */
+		i = rand() & 0xFF;
+		while (i--)
+			rand();
+		seeded = 1;
+	}
+	f = (double)rand() / RAND_MAX * upper;
+	
+	return (lower + (DIGIT_T)f);
+}
-- 
1.8.1.5
