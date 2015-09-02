From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v1 5/8] Fix some issues found in libmcrypto
Date: Wed, 2 Sep 2015 14:19:17 -0700
Message-ID: <1441228760-26042-6-git-send-email-jimmzhang@nvidia.com>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441228760-26042-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Libmcrypto can't be used without these fixes.

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/libm/bigdigits.h  |   2 +-
 src/libm/common.c     |   4 +-
 src/libm/mpModulo.c   |   5 +-
 src/libm/mpMultiply.c |   7 ++-
 src/libm/pkcs1-rsa.c  | 145 +++++++++++++++++---------------------------------
 src/libm/pkcs1-rsa.h  |   3 +-
 6 files changed, 64 insertions(+), 102 deletions(-)

diff --git a/src/libm/bigdigits.h b/src/libm/bigdigits.h
index 7c9f563f3d54..0918a27005e6 100644
--- a/src/libm/bigdigits.h
+++ b/src/libm/bigdigits.h
@@ -20,7 +20,7 @@ extern "C" {
 #include "mcrypto.h"
 
 /* Define type of DIGIT here */
-typedef unsigned long DIGIT_T;
+typedef unsigned int DIGIT_T;
 typedef unsigned short HALF_DIGIT_T;
 
 /* Sizes to suit your machine - todo: move to mcrypto.h */
diff --git a/src/libm/common.c b/src/libm/common.c
index a28497592882..ae6e1eed2322 100644
--- a/src/libm/common.c
+++ b/src/libm/common.c
@@ -46,11 +46,11 @@ void mcrypto_dump(char *desc, BYTE *p, UINT len)
 #ifdef MCRYPTO_DEBUG
 	UINT i = 0;
 	
-	printf("[%s]\n", desc);
+	printf("[%s(%d)]\n", desc, len);
 	while (len--) {
 		if ((i % 20) == 0 && i)
 			printf("\n");
-		fprintf(stderr, "%02x ", p[len]);
+		fprintf(stderr, "%02x ", p[i]);
 		i++;
 	}
 	fprintf(stderr, "\n");
diff --git a/src/libm/mpModulo.c b/src/libm/mpModulo.c
index c929dd5a2c02..cff60d173e8b 100644
--- a/src/libm/mpModulo.c
+++ b/src/libm/mpModulo.c
@@ -2,6 +2,9 @@
 
 #include "bigdigits.h"
 
+/* TODO: add support for MCRYPTO_BARRET */
+#define MCRYPTO_TRIVIAL_DIVISION
+
 int mpModulo(DIGIT_T r[], const DIGIT_T u[], UINT udigits, const DIGIT_T v[], UINT vdigits)
 {
 #ifdef MCRYPTO_TRIVIAL_DIVISION	
@@ -31,4 +34,4 @@ int mpModulo(DIGIT_T r[], const DIGIT_T u[], UINT udigits, const DIGIT_T v[], UI
 #endif
 	return 0;
 }
-
+#undef MCRYPTO_TRIVIAL_DIVISION
diff --git a/src/libm/mpMultiply.c b/src/libm/mpMultiply.c
index faf4a75ccd7f..d52d8b40be96 100644
--- a/src/libm/mpMultiply.c
+++ b/src/libm/mpMultiply.c
@@ -2,9 +2,12 @@
 #include <assert.h>
 #include "bigdigits.h"
 
+/* TODO: add support for MCRYPTO_FFT_MUL */
+#define MCRYPTO_SCHOOL_BOOK
+
 int mpMultiply(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T v[], UINT ndigits)
 {
-#ifdef MCRYPTO_SCHOOL_BOOK	
+#ifdef MCRYPTO_SCHOOL_BOOK
 	/*	Computes product w = u * v
 		where u, v are multiprecision integers of ndigits each
 		and w is a multiprecision integer of 2*ndigits
@@ -52,4 +55,4 @@ int mpMultiply(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T v[], UINT ndigits)
 #endif
 	return 0;
 }
-
+#undef MCRYPTO_SCHOOL_BOOK
diff --git a/src/libm/pkcs1-rsa.c b/src/libm/pkcs1-rsa.c
index 1a3132e1fa75..da16fae377ff 100644
--- a/src/libm/pkcs1-rsa.c
+++ b/src/libm/pkcs1-rsa.c
@@ -17,6 +17,9 @@
 #include "hash.h"
 #include "bigdigits.h"
 
+/* cbootimage header */
+#include "crypto.h"
+
 /* Internal Functions - Forward Declaration */
 static void memxor(BYTE *c, BYTE *a, BYTE *b, UINT len); 
 	/* Perform c = a XOR b */
@@ -59,6 +62,15 @@ static int GenRsaPrime(DIGIT_T p[], UINT ndigits)
 	return 0;
 }
 
+static
+UINT SwapBytesInNvU32(const UINT Value)
+{
+    UINT Tmp = (Value << 16) | (Value >> 16); /* Swap halves */
+    /* Swap bytes pairwise */
+    Tmp = ((Tmp >> 8) & 0x00ff00ff) | ((Tmp & 0x00ff00ff) << 8);
+    return (Tmp);
+}
+
 static int MGF1(UINT hid, BYTE *seed, UINT seedlen, BYTE  *mask, UINT masklen)
 {
 	/* Mask Generation Function Using Hash Function */
@@ -91,8 +103,8 @@ static int MGF1(UINT hid, BYTE *seed, UINT seedlen, BYTE  *mask, UINT masklen)
 		 
 	for(i=0;i<n;i++) {
 		/* Constructing Hash Input */
-		memcpy(data+seedlen, &i, 4);
-		
+		*(UINT *)(data+seedlen) = SwapBytesInNvU32(i);
+
 		/* Computing Hash */
 		if((ret=Hash(hid, data, seedlen+4, hash))!=0) {
 			free(data);
@@ -113,7 +125,6 @@ static int MGF1(UINT hid, BYTE *seed, UINT seedlen, BYTE  *mask, UINT masklen)
 }
 
 /* Main Functions */
-
 int PKCS1_RSA_GenKey(PKCS1_RSA_PUBLIC_KEY *spk, PKCS1_RSA_PRIVATE_KEY *ssk, UINT mod_len)
 {
 	DIGIT_T *p, *q, *n, *e, *d;
@@ -511,14 +522,19 @@ int PKCS1_RSASSA_PSS_SIGN(PKCS1_RSA_PRIVATE_KEY *ssk, UINT hid, BYTE *m, UINT ml
 	em = (BYTE *)malloc(NBYTE(ssk->len));
 	
 	/* PSS Encoding */
-	if((ret=PKCS1_EMSA_PSS_ENCODE(hid, m, mlen, slen, em, NBYTE(ssk->len)))!=ERR_OK) {
+	if((ret = PKCS1_EMSA_PSS_ENCODE(hid, m, mlen, slen, em, NBYTE(ssk->len)))
+				!= ERR_OK) {
 		free(em);
+		printf("Error: encoding failed\n");
 		return ret;
 	}
 	
+	SwapEndianness(em, NBYTE(ssk->len), em);
+	mcrypto_dump("PSS_SIGN: Encoded Message", em, NBYTE(ssk->len));
+
 	/* Signing */
 	ret = PKCS1_RSASP1(ssk, (DIGIT_T*)em, (DIGIT_T*)s);
-	mcrypto_dump("Signature",(BYTE *)s, NBYTE(ssk->len));
+	mcrypto_dump("PSS_SIGN: Signature",(BYTE *)s, NBYTE(ssk->len));
 	
 	free(em);
 	
@@ -553,6 +569,14 @@ int PKCS1_RSASSA_PSS_VERIFY(PKCS1_RSA_PUBLIC_KEY *spk, UINT hid, BYTE *m, UINT m
 	return ERR_INVALID_SIGNATURE;
 }
 
+/*
+ * hid: hash id
+ * m:   message buffer
+ * mlen: message length
+ * slen: signature length
+ * em:   encoded message   (from hash)
+ * emlen: encoded message length -> 256
+ */
 int PKCS1_EMSA_PSS_ENCODE(UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *em, UINT emlen)
 {
 	/* PSS Encoding */
@@ -568,31 +592,34 @@ int PKCS1_EMSA_PSS_ENCODE(UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *em, UIN
 		return ERR_UNKNOWN_HASH;
 	
 	/* Computing Hash of m */
-	mcrypto_dump("PSS Encoding: Message", m, mlen);
 	H = (BYTE *)malloc(hlen);
 	if((ret = Hash(hid, m, mlen, H))!=0) {
 		free(H);
-		
 		return ret;
 	}
 
 	mcrypto_dump("PSS Encoding: Hashed Message", H, hlen);
 	
+	/* BUG FIX */
+	/* slen is 256 that causes the condition below failed */
+	/* FIX: set slen to hash length */
+	slen = hlen;
+
 	/* Length checking */
-	if(emlen<(hlen+slen+2)) {
+	if(emlen<(hlen+slen+2)) {  /* emlen: 256, hlen: 32, slen: 32 */
 		free(H);
 		return ERR_PSS_ENCODING;
 	}
-	
+
 	/* Generating salt and constructing M */
 	salt = (BYTE *)malloc(slen);
-	GenSeed(salt, slen);
-	mcrypto_dump("PSS Encoding: Salt", salt, slen);
+	/* GenSeed(salt, slen); */
+	memset(salt, 0xFF, slen);
 	
-	M = (BYTE *)malloc(8+hlen+slen);
-	memset(M, 0x00, 8+hlen+slen);
-	memcpy(M+8, H, hlen);
-	memcpy(M+8+hlen, salt, slen);
+	M = (BYTE *)malloc(8 + hlen + slen);
+	memset(M, 0x00, 8 + hlen + slen);
+	memcpy(M + 8, H, hlen);
+	memcpy(M + 8 + hlen, salt, slen);
 	mcrypto_dump("PSS Encoding: Message to be encoded", M, 8+hlen+slen);
 	
 	/* Constructing DB */
@@ -629,11 +656,18 @@ int PKCS1_EMSA_PSS_ENCODE(UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *em, UIN
 	mcrypto_dump("PSS Encoding: maskedDB", maskedDB, emlen-hlen-1);
 	
 	/* Constructing encoded message, em */
+	maskedDB[0] &= ~(0xFF << (8 - 1));
 	memcpy(em, maskedDB, emlen-hlen-1);
 	memcpy(em+emlen-hlen-1, H, hlen);
 	em[emlen-1] = 0xbc;
-	mcrypto_dump("PSS Encoding: Encoded Message", em, emlen);
 	
+	/* added: free memory H, M, DB, ... */
+	free(H);
+	free(M);
+	free(salt);
+	free(maskedDB);
+	free(DB);
+
 	return ERR_OK;
 }
 
@@ -752,82 +786,3 @@ void errmsg(int err)
 	default: 			printf("Unkown Error!!!\n"); break;
 	}
 }
-
-int LoadPublicKey(char *fname, PKCS1_RSA_PUBLIC_KEY *spk)
-{
-	/* Load keys from files */
-	char s[5][PKCS1_MAX_LINE_LEN];	
-	FILE *f;
-	UINT i;
-	UINT len;
-	
-	f = fopen(fname, "r");
-	if(f == NULL)
-		return -1;
-	
-	memset(s, 0x00, PKCS1_MAX_LINE_LEN*5);	
-	/* reading data */
-	for(i=0;i<5;i++)
-	{
-		if(feof(f))
-		{
-			fclose(f);
-			return -1;
-		}
-		fgets(s[i], PKCS1_MAX_LINE_LEN, f);
-		
-		/* ignore newline charater */		
-		s[i][strlen(s[i])-1] = '\0';
-	}
-	fclose(f);
-	
-	/* Decoding data */
-	spk->len = (UINT)atoi(s[1]);
-	
-	if((spk->modulus = mpBase64Decode(&len, s[2]))==NULL)
-		return -1; 
-	if((spk->exponent = mpBase64Decode(&len, s[3]))==NULL)
-		return -1; 
-	return 0;
-}
-
-int LoadPrivateKey(char *fname, PKCS1_RSA_PRIVATE_KEY *ssk)
-{
-	/* Load keys from files */
-	char s[6][PKCS1_MAX_LINE_LEN];
-	FILE *f;
-	UINT i;
-	UINT len;
-	
-	f = fopen(fname, "r");
-	if(f == NULL)
-		return -1;
-		
-	memset(s, 0x00, PKCS1_MAX_LINE_LEN*6);	
-	
-	/* reading data */
-	for(i=0;i<5;i++)
-	{
-		if(feof(f))
-		{
-			fclose(f);
-			return -1;
-		}
-		fgets(s[i], PKCS1_MAX_LINE_LEN, f);
-		s[i][strlen(s[i])-1] = '\0';
-	}
-	fclose(f);
-	
-	ssk->len = (UINT)atoi(s[1]);
-	
-	if((ssk->modulus = mpBase64Decode(&len, s[2]))==NULL)
-		return -1; 
-	if((ssk->PublicExponent = mpBase64Decode(&len, s[3]))==NULL)
-		return -1; 
-	if((ssk->exponent = mpBase64Decode(&len, s[4]))==NULL)
-		return -1; 	
-	
-	return 0;
-}
-
-
diff --git a/src/libm/pkcs1-rsa.h b/src/libm/pkcs1-rsa.h
index 9e2b58acd9da..f4158d69f506 100644
--- a/src/libm/pkcs1-rsa.h
+++ b/src/libm/pkcs1-rsa.h
@@ -9,7 +9,8 @@
 extern "C" {
 #endif
 
-#define PKCS1_MAX_LINE_LEN	346	/* for reading parameter file */
+#define PKCS1_MAX_NUM_KEYS	8	/* number of key components */
+#define PKCS1_MAX_LINE_LEN	512	/* for reading parameter file */
 
 #define PKCS1_VERSION_MAJOR 2
 #define PKCS1_VERSION_MINOR 1
-- 
1.8.1.5
