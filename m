From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v1 4/8] Add new configuration keyword "PkcKey"
Date: Wed, 2 Sep 2015 14:19:16 -0700
Message-ID: <1441228760-26042-5-git-send-email-jimmzhang@nvidia.com>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441228760-26042-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use "PkcKey" to specify rsa key filename and load in
rsa private keys from file.

When keyword "PkcKey" is present, rsa pss signatures are generated
for both bootloader and bct. rsa pubkey will also be filled into bct.

PkcKey syntax:

  PkcKey = <rsa_key_filename> [, --save];

Examples:

   PkcKey = rsa_priv.txt;
     Load in keys from file rsa_priv.txt

   PkcKey = rsa_priv.pem, --save;
     Load in keys from file rsa_priv.pem and save pubkey and pubkey hash
     value to file pubkey.mod and pubkey.sha respectively.

Sample Configuration file:

   Version    = 1;
   Redundancy = 1;
   Bctcopy    = 1;
   Bctfile    = a44-smaug-p5.bct;
   PkcKey     = rsa_priv.txt;
   BootLoader = bootblock.raw.bin,0x40029000,0x40029000,Complete;

Two key formats are supported.
   1. Polar SSL format
      P = ...
      Q = ...

   2. Open SSL format
       -----BEGIN RSA PRIVATE KEY-----
       ...
       -----END RSA PRIVATE KEY-----

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/Makefile.am     |  74 +++-
 src/cbootimage.h    |   8 +
 src/crypto.c        | 147 +++++++-
 src/crypto.h        |  67 ++++
 src/data_layout.c   |  18 +
 src/parse.c         |  35 ++
 src/parse.h         |   1 +
 src/rsa_key_parse.c | 973 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 src/rsa_key_parse.h | 107 ++++++
 src/set.c           |  37 +-
 src/set.h           |   5 +
 11 files changed, 1465 insertions(+), 7 deletions(-)
 create mode 100644 src/rsa_key_parse.c
 create mode 100644 src/rsa_key_parse.h

diff --git a/src/Makefile.am b/src/Makefile.am
index 64c4ea52b8e2..8e9f0d90ca52 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -1,6 +1,8 @@
 AUTOMAKE_OPTIONS = subdir-objects
 
-AM_CFLAGS = -Wall -std=c99
+AM_CFLAGS = -Wall -std=c99 -DMCRYPTO_USE_ASM=0
+# To enable libm debug, uncomment line below:
+#AM_CFLAGS += -DMCRYPTO_DEBUG
 
 bin_PROGRAMS = cbootimage bct_dump
 cbootimage_SOURCES = \
@@ -9,6 +11,40 @@ cbootimage_SOURCES = \
 	set.c \
 	crypto.c \
 	aes_ref.c \
+	rsa_key_parse.c \
+	libm/pkcs1-rsa.c \
+	libm/hash.c \
+	libm/md5.c \
+	libm/sha2.c \
+	libm/sha1.c \
+	libm/bigdUtils.c \
+	libm/mpShortAdd.c \
+	libm/mpIsPrime.c \
+	libm/mpSetZero.c \
+	libm/mpMultiply.c \
+	libm/mpSetEqual.c \
+	libm/mpShortSub.c \
+	libm/mpShortDiv.c \
+	libm/mpModInv.c \
+	libm/mpModMult.c \
+	libm/mpModulo.c \
+	libm/mpModExp.c \
+	libm/mpSizeof.c \
+	libm/mpShortCmp.c \
+	libm/mpShortMod.c \
+	libm/mpShiftRight.c \
+	libm/mpShiftLeft.c \
+	libm/mpCompare.c \
+	libm/mpIsZero.c \
+	libm/mpSetDigit.c \
+	libm/mpDivide.c \
+	libm/mpAdd.c \
+	libm/mpSubtract.c \
+	libm/spPseudoRand.c \
+	libm/spDivide.c \
+	libm/spMultiply.c \
+	libm/base64.c \
+	libm/common.c \
 	context.c \
 	parse.c \
 	t210/parse_t210.c \
@@ -30,6 +66,7 @@ cbootimage_SOURCES = \
 	nvaes_ref.h \
 	parse.h \
 	set.h \
+	rsa_key_parse.h \
 	t20/nvboot_bct_t20.h \
 	t20/nvboot_sdram_param_t20.h \
 	t30/nvboot_bct_t30.h \
@@ -51,6 +88,40 @@ bct_dump_SOURCES = \
 	set.c \
 	crypto.c \
 	aes_ref.c \
+	rsa_key_parse.c \
+	libm/pkcs1-rsa.c \
+	libm/hash.c \
+	libm/md5.c \
+	libm/sha2.c \
+	libm/sha1.c \
+	libm/bigdUtils.c \
+	libm/mpShortAdd.c \
+	libm/mpIsPrime.c \
+	libm/mpSetZero.c \
+	libm/mpMultiply.c \
+	libm/mpSetEqual.c \
+	libm/mpShortSub.c \
+	libm/mpShortDiv.c \
+	libm/mpModInv.c \
+	libm/mpModMult.c \
+	libm/mpModulo.c \
+	libm/mpModExp.c \
+	libm/mpSizeof.c \
+	libm/mpShortCmp.c \
+	libm/mpShortMod.c \
+	libm/mpShiftRight.c \
+	libm/mpShiftLeft.c \
+	libm/mpCompare.c \
+	libm/mpIsZero.c \
+	libm/mpSetDigit.c \
+	libm/mpDivide.c \
+	libm/mpAdd.c \
+	libm/mpSubtract.c \
+	libm/spPseudoRand.c \
+	libm/spDivide.c \
+	libm/spMultiply.c \
+	libm/base64.c \
+	libm/common.c \
 	context.c \
 	parse.c \
 	t210/parse_t210.c \
@@ -72,6 +143,7 @@ bct_dump_SOURCES = \
 	nvaes_ref.h \
 	parse.h \
 	set.h \
+	rsa_key_parse.h \
 	t20/nvboot_bct_t20.h \
 	t20/nvboot_sdram_param_t20.h \
 	t30/nvboot_bct_t30.h \
diff --git a/src/cbootimage.h b/src/cbootimage.h
index 2b609eda50f9..8b0faa1e327f 100644
--- a/src/cbootimage.h
+++ b/src/cbootimage.h
@@ -64,8 +64,15 @@ typedef enum
 	file_type_bct,
 	file_type_mts,
 	file_type_bin,
+	file_type_key,
 } file_type;
 
+typedef enum
+{
+	false = 0,
+	true = 1,
+} bool;
+
 /*
  * The main context data structure of cbootimage tool
  */
@@ -110,6 +117,7 @@ typedef struct build_image_context_rec
 
 	char *bct_filename;
 	char *rsa_filename;
+	void *pkckey;
 	u_int32_t last_blk;
 	u_int32_t bct_size; /* The BCT file size */
 	u_int32_t boot_data_version; /* The boot data version of BCT */
diff --git a/src/crypto.c b/src/crypto.c
index 99e9f085763c..cc123c79d4ad 100644
--- a/src/crypto.c
+++ b/src/crypto.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -25,6 +25,9 @@
 #include "nvaes_ref.h"
 #include <stdio.h>
 
+#include "libm/pkcs1-rsa.h"
+#include "libm/hash.h"
+
 /* Local function declarations */
 static void
 apply_cbc_chain_data(u_int8_t *cbc_chain_data,
@@ -255,6 +258,41 @@ sign_data_block(u_int8_t *source,
 				signature);
 }
 
+static u_int8_t *pkc_get_pubkey(void *key)
+{
+	NvTegraPkcKey *pPkcKey = (NvTegraPkcKey *)key;
+	return (u_int8_t *)pPkcKey->Modulus.Number;
+}
+
+int
+pkc_sign_buffer(void *key, u_int8_t *buffer, u_int32_t size, u_int8_t **pSign)
+{
+	int ret;
+	PKCS1_RSA_PRIVATE_KEY ssk;
+	static u_int8_t sign[RSA_KEY_BYTE_SIZE];
+
+	NvTegraPkcKey *pPkcKey = (NvTegraPkcKey *)key;
+
+	/* TODO: define constant for ssk.len */
+	ssk.len = (UINT)pPkcKey->Modulus.Digits; /* length in digits of modulus in term of 32 bits */
+	ssk.modulus = malloc(NBYTE(ssk.len));
+	memcpy (ssk.modulus, pPkcKey->Modulus.Number, NBYTE(ssk.len));
+	ssk.exponent = malloc(NBYTE(ssk.len));
+	memcpy (ssk.exponent, pPkcKey->PrivKey, NBYTE(ssk.len));
+
+	ret = PKCS1_RSASSA_PSS_SIGN(&ssk, HASH_SHA256,
+					buffer, size, NBYTE(ssk.len), sign);
+	if(ret == ERR_OK) {
+		*pSign = sign;
+		ret = 0;
+	}
+
+	free(ssk.modulus);
+	free(ssk.exponent);
+
+	return ret;
+}
+
 int
 sign_bct(build_image_context *context,
 		u_int8_t *bct)
@@ -283,17 +321,116 @@ sign_bct(build_image_context *context,
 	hash_buffer = calloc(1, hash_size);
 	if (hash_buffer == NULL)
 		return -ENOMEM;
-	e = sign_data_block(bct + Offset, length, hash_buffer);
-	if (e != 0)
+	if ((e = sign_data_block(bct + Offset, length, hash_buffer)) != 0)
 		goto fail;
-	e = g_soc_config->set_data(token_crypto_hash,
+	if ((e = g_soc_config->set_data(token_crypto_hash,
 						hash_buffer,
 						hash_size,
+						bct)) != 0)
+		goto fail;
+
+	/*  pkc signing? */
+	if (context->pkckey) {
+		u_int8_t *sign;
+		if ((e = pkc_sign_buffer(context->pkckey,
+				(u_int8_t *)(bct + Offset),
+				length,
+				&sign)) != 0)
+			goto fail;
+
+		if ((e = g_soc_config->set_value(token_rsa_pss_sig_bct,
+						sign,
+						bct)) != 0)
+			goto fail;
+
+		/* save bct sig to file bct.sig */
+		pkc_savefile(BCT_FILENAME, (u_int8_t *)sign, RSA_KEY_BYTE_SIZE,
+				EXT_SIGNATURE);
+
+		e = g_soc_config->set_value(token_rsa_pss_sig_bct,
+						sign,
 						bct);
-	if (e != 0)
+		/* store pubkey to bct */
+		g_soc_config->set_value(token_pub_key_modulus,
+					pkc_get_pubkey(context->pkckey),
+					bct);
+	}
+
+ fail:
+	free(hash_buffer);
+	return e;
+}
+
 		goto fail;
 
  fail:
 	free(hash_buffer);
 	return e;
 }
+void
+SwapEndianness(
+	const void *pInData,
+	const unsigned int DataSize,
+	void *pOutData)
+{
+	unsigned int i;
+
+	for (i = 0; i < DataSize / 2; i++) {
+		BYTE b1 = ((BYTE *)pInData)[i];
+		BYTE b2 = ((BYTE *)pInData)[DataSize - 1 - i];
+		((BYTE *)pOutData)[i] = b2;
+		((BYTE *)pOutData)[DataSize - 1 - i] = b1;
+	}
+}
+
+int
+pkc_savefile(const char *pFilename,
+		u_int8_t *buffer, size_t bytes, const char* ext)
+{
+	int ret = 0;
+	char *fn = malloc(sizeof(pFilename) + sizeof(ext) + 1);
+	FILE *output_file;
+
+	sprintf(fn, "%s%s", pFilename, ext);
+
+	printf("Saving file %s\n", fn);
+	output_file = fopen(fn, "w+");
+	if (output_file == NULL) {
+		printf("Error opening raw file %s.\n", fn);
+		ret = -1;
+		goto fail;
+        }
+
+	if (fwrite(buffer, 1, bytes, output_file) != bytes) {
+		ret = -1;
+		printf("Error writing raw file %s.\n", fn);
+	}
+
+	fclose(output_file);
+fail:
+	free (fn);
+	return ret;
+}
+
+int
+pkc_save_pubkey(
+	void *pKey,
+	const char *pFileName)
+{
+	int ret = 0;
+	u_int8_t  hash_buffer[RSA_KEY_HASH_SIZE];
+
+	NvTegraPkcKey *pPkcKey = (NvTegraPkcKey *)pKey;
+
+	pkc_savefile(pFileName, (u_int8_t *)pPkcKey->Modulus.Number,
+		sizeof(pPkcKey->Modulus.Number), PUBKEY_MODULUS);
+
+	/* Generate Hash */
+	Hash(HASH_SHA256, pPkcKey->Modulus.Number, RSA_KEY_BYTE_SIZE,
+			hash_buffer);
+
+	pkc_savefile(pFileName, hash_buffer, RSA_KEY_HASH_SIZE,
+			PUBKEY_MODULUS_HASH);
+
+	return ret;
+}
diff --git a/src/crypto.h b/src/crypto.h
index d7151e0cd191..75f961ad63b4 100644
--- a/src/crypto.h
+++ b/src/crypto.h
@@ -33,6 +33,45 @@
 
 #define AES_CMAC_CONST_RB 0x87  // from RFC 4493, Figure 2.2
 
+#define PUBKEY_FILENAME		"pubkey."
+#define PUBKEY_MODULUS		"mod"
+#define PUBKEY_MODULUS_HASH	"sha"
+
+#define BCT_FILENAME	"bct."
+#define BL_FILENAME	"bl."
+#define EXT_SIGNATURE	"sig"
+
+#define RSA_KEY_BIT_SIZE	2048
+#define RSA_KEY_BYTE_SIZE	(RSA_KEY_BIT_SIZE >> 3)
+#define RSA_KEY_HASH_SIZE	32
+#define RSA_PUBLIC_EXPONENT_VAL 0x10001
+
+#define NV_BIGINT_MAX_DW 64
+
+typedef struct NvBigIntModulusRec
+{
+    u_int32_t Digits;
+    u_int32_t InvDigits;
+    u_int32_t Number[NV_BIGINT_MAX_DW];
+    u_int32_t Residue[NV_BIGINT_MAX_DW];
+} NvBigIntModulus;
+
+typedef enum
+{
+    NvTegraPkcsV1_5 = 1,
+    NvTegraPkcsV2_1,
+}NvTegraPkcsVersion;
+
+typedef struct NvTegraPkcKeyRec
+{
+    NvTegraPkcsVersion PkcsVersion;
+    u_int8_t PubKey[RSA_KEY_BYTE_SIZE + 1];
+    u_int8_t PrivKey[RSA_KEY_BYTE_SIZE + 1];
+    u_int8_t P[RSA_KEY_BYTE_SIZE];
+    u_int8_t Q[RSA_KEY_BYTE_SIZE];
+    NvBigIntModulus Modulus;
+}NvTegraPkcKey;
+
 /* Function prototypes */
 
 int
@@ -44,4 +83,32 @@ sign_data_block(u_int8_t *source,
 		u_int32_t length,
 		u_int8_t *signature);
 
+void
+SwapEndianness(
+    const void *pInData,
+    const unsigned int DataSize,
+    void *pOutData);
+
+int pkckey_set(u_int8_t *key_buffer,
+		u_int32_t buffer_size,
+		void **pkckey,
+		int save);
+
+int
+pkc_sign_buffer(void *key,
+		u_int8_t *buffer,
+		u_int32_t size,
+		u_int8_t **pSign);
+
+int
+pkc_savefile(const char *pFilename,
+		u_int8_t *buffer,
+		size_t bytes,
+		const char* ext);
+
+int
+pkc_save_pubkey(
+    void *pPkcKey,
+    const char *pFileName);
+
 #endif /* #ifndef INCLUDED_CRYPTO_H */
diff --git a/src/data_layout.c b/src/data_layout.c
index 082609236724..21d03c2f507e 100644
--- a/src/data_layout.c
+++ b/src/data_layout.c
@@ -620,6 +620,24 @@ write_image(build_image_context *context, file_type image_type)
 					token_bl_crypto_hash,
 					(u_int32_t*)hash_buffer,
 					context->bct);
+
+			/* pkc signing? */
+			if (context->pkckey) {
+				u_int8_t *sign;
+				pkc_sign_buffer(context->pkckey,
+						buffer,
+						image_actual_size,
+						&sign);
+
+				/* save bl sig to file bl.sig */
+				pkc_savefile(BL_FILENAME, (u_int8_t *)sign,
+						RSA_KEY_BYTE_SIZE, EXT_SIGNATURE);
+
+				g_soc_config->set_value(token_rsa_pss_sig_bl,
+							sign,
+							context->bct);
+			}
+
 		}
 
 		GET_FIELD(is_bl, image_instance, start_blk, &current_blk);
diff --git a/src/parse.c b/src/parse.c
index 974eec7844ff..218ac27d3b33 100644
--- a/src/parse.c
+++ b/src/parse.c
@@ -74,6 +74,8 @@ parse_value_chipuid(build_image_context *context,
 			char *rest);
 static int
 parse_bct_file(build_image_context *context, parse_token token, char *rest);
+static int
+parse_pkckey_file(build_image_context *context, parse_token token, char *rest);
 static char
 *parse_end_state(char *str, char *uname, int chars_remaining);
 static int
@@ -91,6 +93,7 @@ static parse_item parse_simple_items[] =
 	{ "BootLoader=",    token_bootloader,		parse_bootloader },
 	{ "Redundancy=",    token_redundancy,		parse_value_u32 },
 	{ "Bctcopy=",       token_bct_copy,		parse_value_u32 },
+	{ "PkcKey=",        token_pkckey_file,		parse_pkckey_file},
 	{ "MtsPreboot=",    token_mts_preboot,		parse_mts_image},
 	{ "Mts=",           token_mts,			parse_mts_image},
 	{ "Version=",       token_version,		parse_value_u32 },
@@ -111,6 +114,7 @@ static parse_item s_top_level_items[] = {
 	{ "BootLoader=",    token_bootloader,		parse_bootloader },
 	{ "Redundancy=",    token_redundancy,		parse_value_u32 },
 	{ "Bctcopy=",       token_bct_copy,		parse_value_u32 },
+	{ "PkcKey=",        token_pkckey_file,		parse_pkckey_file},
 	{ "MtsPreboot=",    token_mts_preboot,		parse_mts_image},
 	{ "Mts=",           token_mts,			parse_mts_image},
 	{ "Version=",       token_version,		parse_value_u32 },
@@ -689,6 +693,37 @@ parse_bct_file(build_image_context *context, parse_token token, char *rest)
 	return 0;
 }
 
+static int
+parse_pkckey_file(build_image_context *context, parse_token token, char *rest)
+{
+	char filename[MAX_BUFFER];
+	int save_key = 0;	/* save pubkey, default no */
+	#define OPTION_SAVE	"--save"
+
+	assert(context != NULL);
+	assert(rest != NULL);
+
+	/* Parse the file name. */
+	rest = parse_filename(rest, filename, MAX_BUFFER);
+	if (rest == NULL)
+		return 1;
+
+	/* check save option */
+	if (*rest == ',') {
+		++rest;
+
+		/* Parse option. */
+		if (strstr(rest, OPTION_SAVE) != NULL)
+			save_key = 1;
+	}
+
+	/*
+	 * read file, parse and store key to key buffer
+	 * and update context->pkckey
+	 */
+	return set_rsa_key(context, filename, save_key);
+}
+
 static char *
 parse_end_state(char *str, char *uname, int chars_remaining)
 {
diff --git a/src/parse.h b/src/parse.h
index c7035d590ed2..15dcadfc3814 100644
--- a/src/parse.h
+++ b/src/parse.h
@@ -41,6 +41,7 @@ typedef enum
 	token_none = 0,
 	token_attribute,
 	token_bootloader,
+	token_pkckey_file,
 	token_mts_preboot,
 	token_mts,
 	token_block_size,
diff --git a/src/rsa_key_parse.c b/src/rsa_key_parse.c
new file mode 100644
index 000000000000..3919281be5ab
--- /dev/null
+++ b/src/rsa_key_parse.c
@@ -0,0 +1,973 @@
+/*
+ * Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ * See file CREDITS for list of people who contributed to this
+ * project.
+ */
+#include <stdio.h>
+#include <string.h>
+#include "crypto.h"
+#include "libm/pkcs1-rsa.h"
+#include "libm/hash.h"
+#include "rsa_key_parse.h"
+
+static void pkc_string_to_prime(u_int8_t *pBuffer, u_int8_t *pPrimeNum)
+{
+	u_int32_t i = 0;
+
+	while (i < (RSA_KEY_BYTE_SIZE * 2)) {
+		*pPrimeNum = HEX_TO_DEC(pBuffer[i]) * 16 +
+			HEX_TO_DEC(pBuffer[i + 1]);
+		i += 2;
+		pPrimeNum++;
+	}
+}
+
+static bool
+pkc_extract_polar_ssl_primes(
+	u_int8_t *pBuffer,
+	u_int32_t BufSize,
+	u_int8_t *pP,
+	u_int8_t *pQ)
+{
+	u_int8_t *pTokenP = NULL;
+	u_int8_t *pTokenQ = NULL;
+
+	/* Parse POLARSSL format */
+	pTokenP = (u_int8_t *)strstr((char *)pBuffer, PRIME_PATTERN_P);
+	pTokenQ = (u_int8_t *)strstr((char *)pBuffer, PRIME_PATTERN_Q);
+
+	if (pTokenP != NULL && pTokenQ != NULL) {
+		pTokenP += strlen(PRIME_PATTERN_P);
+		pTokenQ += strlen(PRIME_PATTERN_Q);
+
+		if ((pTokenQ - pTokenP) < RSA_KEY_BYTE_SIZE) {  // 256 hex -> 128B
+			printf("Error: Key should be 2048 bit long\n");
+			return false;
+		}
+
+		pkc_string_to_prime(pTokenP, pP);
+		pkc_string_to_prime(pTokenQ, pQ);
+
+		printf("PKC key in PolarSSL format\n");
+		return true;
+	}
+	return false;
+}
+
+/* Extracts the prime numbers
+ *
+ * @param pBuf Decoded(plain) data
+ * @param BufSize Size of the input data buffer
+ * @param pP First prime number
+ * @param pQ Second prime number
+ *
+ * @return NvSuccess if successful else NvError
+ */
+static int
+NvTegraPkcAsnParser(
+    NvU8 *pBuf,
+    NvU32 BufSize,
+    NvU8 *pP,
+    NvU8 *pQ)
+{
+    NvS32 i = 0;
+    NvS32 LocalSize = 0;
+    NvU32 Index = 0;
+    NvU32 SequenceNum = 0;
+    NvU32 IntegerNum = 0;
+    NvU32 Expo = 0;
+    NvU8 Type = 0;
+
+    if ((pBuf == NULL) || (pP == NULL) || pQ == NULL)
+        return NvError_BadParameter;
+
+    while (Index <= BufSize)
+    {
+        Type = pBuf[Index++] & 0x1F;
+
+        LocalSize = 0;
+        if ((pBuf[Index] & 0x80) == 0x80)
+        {
+            for (i = (pBuf[Index++] & 0x7F) - 1; i >= 0 ; i--)
+                LocalSize |= pBuf[Index++] << (8 * i);
+        }
+        else
+        {
+            LocalSize = (NvU32)pBuf[Index++];
+        }
+
+        switch (Type)
+        {
+            case SEQUENCE:
+                if (SequenceNum == 0)
+                {
+                    if(LocalSize + Index != BufSize)
+                    {
+                        return NvError_BadParameter;
+                    }
+
+                }
+                else if (SequenceNum == 1)
+                {
+                    Index += LocalSize;
+                }
+
+                SequenceNum++;
+                break;
+
+            case INTEGER:                       /*  INTEGER */
+                switch(IntegerNum)
+                {
+                    case 0:     /*  PrivateKeyInfo version  */
+                    case 1:     /*  PrivateKey version  */
+                    case 3:     /*  Modulus */
+                        Index += LocalSize;
+                        IntegerNum++;
+                        break;
+
+                    case 2:     /*  Public Exponent */
+                        for (i = LocalSize - 1; i >= 0; i--)
+                        {
+                            Expo |= pBuf[Index++] << (8 * i);
+                        }
+                        if (Expo != RSA_PUBLIC_EXPONENT_VAL)
+                        {
+                            return NvError_BadParameter;
+                        }
+                        IntegerNum++;
+                        break;
+
+                    case 4:     /*  P */
+                        if (LocalSize != (RSA_KEY_BYTE_SIZE / 2))
+                        {
+                            if ((LocalSize - 1) != (RSA_KEY_BYTE_SIZE / 2))
+                            {
+                                return NvError_BadParameter;
+                            }
+                            else
+                            {
+                                LocalSize -= 1;
+                            }
+                        }
+
+                        for (i = 0, Index++; i < LocalSize; i++)
+                        {
+                            *(pP++) = pBuf[Index++];
+                        }
+                        IntegerNum++;
+                        break;
+
+                    case 5:     /*  Q */
+                        if (LocalSize != (RSA_KEY_BYTE_SIZE / 2))
+                        {
+                            if ((LocalSize - 1) != (RSA_KEY_BYTE_SIZE / 2))
+                            {
+                                return NvError_BadParameter;
+                            }
+                            else
+                            {
+                                LocalSize -= 1;
+                            }
+                        }
+
+                        for(i = 0, Index++; i < LocalSize; i++)
+                        {
+                            *(pQ++) = pBuf[Index++];
+                        }
+                        IntegerNum++;
+                        return NvSuccess;
+                }
+                break;
+
+            case OCTET_STRING:                       /*  OCTET_STRING */
+                continue;
+            case EOC:
+                return NvSuccess;
+            default:
+                /*  Ideally control should not come here for a .pk8 file */
+                return NvError_BadParameter;
+        }
+    }
+
+    return NvSuccess;
+}
+
+static bool
+pkc_extract_open_ssl_primes(
+    u_int8_t *pBuffer,
+    u_int32_t BufSize,
+    u_int8_t *pP,
+    u_int8_t *pQ)
+{
+    u_int8_t DerFormat[] = {0x30, 0x82};
+    u_int32_t Base64Size = 0;
+    u_int8_t *pBase64Buf = NULL;
+    u_int8_t *pPemStart = NULL;
+    u_int32_t DerKeySize = 0;
+    int e = NvSuccess;
+
+    if ((memcmp(pBuffer, DerFormat, sizeof(DerFormat)) != 0) &&
+        (memcmp(pBuffer, PEMFORMAT_START, sizeof(PEMFORMAT_START) - 1) != 0))
+    {
+        return false;
+    }
+
+    DerKeySize = BufSize - sizeof(PEMFORMAT_END);
+    pPemStart = pBuffer + sizeof(PEMFORMAT_START);
+
+    if (memcmp(pBuffer + DerKeySize, PEMFORMAT_END,
+        sizeof(PEMFORMAT_END) - 1) != 0)
+    {
+        return false;
+    }
+
+    printf("PKC key in Open SSL format\n");
+
+    if (memcmp(pBuffer, DerFormat, sizeof(DerFormat)) != 0)
+    {
+        DerKeySize = DerKeySize - sizeof(PEMFORMAT_START);
+
+        e = NvBase64Decode(pPemStart, DerKeySize, NULL, &Base64Size);
+	if (e != NvSuccess) {
+		printf("Base 64 decoding size failed\n");
+		goto fail;
+	}
+
+
+        pBase64Buf = malloc(Base64Size);
+        if (pBase64Buf == NULL) {
+		e = NvError_InsufficientMemory;
+		goto fail;
+	}
+
+        e = NvBase64Decode(pPemStart, DerKeySize, pBase64Buf, &Base64Size);
+	if (e != NvSuccess) {
+		printf("Base 64 decoding failed\n");
+		goto fail;
+	}
+
+        pPemStart = pBase64Buf;
+        BufSize = Base64Size;
+    }
+
+    e = NvTegraPkcAsnParser(pPemStart, BufSize, pP, pQ);
+    if (e != NvSuccess)
+	printf("Asn Parser failure\n");
+
+fail:
+
+    if (pBase64Buf != NULL)
+        free(pBase64Buf);
+
+    if (e != NvSuccess)
+        return false;
+
+    return true;
+}
+
+static bool
+pkc_extract_private_keys(
+	u_int8_t *pBuffer,
+	u_int32_t BufSize,
+	u_int8_t *pP,
+	u_int8_t *pQ)
+{
+	return
+	((pkc_extract_open_ssl_primes(pBuffer, BufSize, pP, pQ) == true) ||
+	(pkc_extract_polar_ssl_primes(pBuffer, BufSize, pP, pQ) == true));
+}
+
+static NvU32 NvInverseDigit(NvU32 x)
+{
+    NvU32 i = 1;
+    NvU32 j = 2;
+    do
+    {
+        i ^= (j ^ (j & (x * i)));
+        j += j;
+    }
+    while (j);
+    return i;
+}
+
+static NvU32
+NvBigIntIsZero(
+    const NvU32 *x,
+    const NvU32 Digits)
+{
+    NvU32 i;
+    for (i = 0; i < Digits; i++)
+    {
+        if (x[i] != 0)
+        {
+            return NV_FALSE;
+        }
+    }
+    return NV_TRUE;
+}
+
+static NvU32
+NvBigIntSubtract(
+    NvU32 *z,
+    const NvU32 *x,
+    const NvU32 *y,
+    const NvU32 Digits)
+{
+    NvU32 i, j, k;
+    for (i = k = 0; i < Digits; i ++)
+    {
+        j = x[i] - k;
+        k = (j > (~k)) ? 1 : 0;
+        j -= y[i];
+        k += (j > (~y[i])) ? 1 : 0;
+        z[i] = j;
+    }
+    return k;
+}
+
+/* Compares two numbers x and y.
+ *
+ * @return 1 if x > y
+ *        -1 if x < y
+ *         0 if x = y
+ */
+static NvS32
+NvBigIntCompare(
+    const NvU32 *x,
+    const NvU32 *y,
+    const NvU32 NumDigits)
+{
+    NvS32 i;
+    for (i = NumDigits - 1; i >= 0; i--)
+    {
+        if (x[i] > y[i])
+            return 1;
+        else if (x[i] < y[i])
+            return -1;
+    }
+    return 0;
+}
+
+static void
+NvBigIntSubtractMod(
+    NvU32 *z,
+    const NvU32 *x,
+    const NvU32 *y,
+    const NvBigIntModulus *p)
+{
+    if (NvBigIntSubtract(z, x, y, p->Digits))
+    {
+        NvBigIntAdd(z, z, p->Number, p->Digits);
+    }
+}
+
+static void
+NvBigIntHalveMod(
+    NvU32 *z,
+    const NvU32 *x,
+    const NvBigIntModulus *p)
+{
+    if (*x & 1)
+    {
+        NvU32 carry = NvBigIntAdd(z, x, p->Number, p->Digits);
+        NvBigIntHalve(z, z, carry, p->Digits);
+    }
+    else
+    {
+        NvBigIntHalve(z, z, 0, p->Digits);
+    }
+}
+
+static void
+NvBigIntDoubleMod(
+    NvU32 *z,
+    const NvU32 *x,
+    const NvBigIntModulus *p)
+{
+    NvU32 i, j, k;
+
+    for (i = k = 0; i < p->Digits; i++)
+    {
+        j = (x[i] >> 31);
+        z[i] = (x[i] << 1) | k;
+        k = j;
+    }
+
+    if (k || NvBigIntCompare(z, p->Number, p->Digits) >= 0)
+    {
+        NvBigIntSubtract(z, z, p->Number, p->Digits);
+    }
+}
+
+static void
+NvBigIntMontgomeryProduct(
+    NvU32 *z,
+    const NvU32 *x,
+    const NvU32 *y,
+    const NvBigIntModulus *p)
+{
+  const NvU32 *n = p->Number;
+  const NvU32 Digits   = p->Digits;
+  const NvU32 InvDigits = p->InvDigits;
+  NvU32 t[NV_BIGINT_MAX_DW], t0, m;
+  NvU32 i, j, t1, k[2];
+
+  memset(t, 0, Digits * sizeof(NvU32));
+
+  for (i = t0 = 0; i < Digits; i++)
+  {
+    NvU64 temp;
+    k[1] = 0;
+    for (j = 0; j < Digits; j++)
+    {
+        temp = (NvU64)y[j] * x[i] + t[j] + k[1];
+        k[0] = *((NvU32*)(&temp));
+        k[1] = *((NvU32*)(&temp) + 1);
+        t[j]         = k[0];
+    }
+    temp = (NvU64)t0 + k[1];
+    k[0] = *((NvU32*)(&temp));
+    k[1] = *((NvU32*)(&temp) + 1);
+    //*((NvU64*)k)  = (NvU64)t0 + k[1];
+    t0            = k[0];
+    t1            = k[1];
+    m             = (NvU32)(t[0] * InvDigits);
+    temp = (NvU64)m * n[0] + t[0];
+    k[0] = *((NvU32*)(&temp));
+    k[1] = *((NvU32*)(&temp) + 1);
+    //*((NvU64*)k)  = (NvU64)m * n[0] + t[0];
+    for (j = 1; j < Digits; j++)
+    {
+        temp = (NvU64)m * n[j] + t[j] + k[1];
+        k[0] = *((NvU32*)(&temp));
+        k[1] = *((NvU32*)(&temp) + 1);
+        //*((NvU64*)k) = (NvU64)m * n[j] + t[j] + k[1];
+        t[j-1]       = k[0];
+    }
+    temp = (NvU64)t0 + k[1];
+    k[0] = *((NvU32*)(&temp));
+    k[1] = *((NvU32*)(&temp) + 1);
+    //*((NvU64*)k)  = (NvU64)t0 + k[1];
+    t[Digits - 1] = k[0];
+    t0            = t1 + k[1];
+  }
+
+  if (t0 || NvBigIntCompare(t, n, Digits) >= 0)
+  {
+    NvBigIntSubtract(z, t, n, Digits);
+  }
+  else
+  {
+    memcpy(z, t, Digits * sizeof(NvU32));
+  }
+}
+
+static NvU32 NvBigIntGetBit(const NvU32 *x, NvU32 i)
+{
+  NvU32 b = 0;
+
+  return (((x[i >> 5] >> (i & 0x1f)) ^ b) & 1);
+}
+
+NvU32
+NvBigIntAdd(
+    NvU32 *z,
+    const NvU32 *x,
+    const NvU32 *y,
+    const NvU32 NumDigits)
+{
+    NvU32 i = 0;
+    NvU32 Temp = 0;
+    NvU32 Carry = 0;
+
+    for (i = 0; i < NumDigits; i ++)
+    {
+        Temp = x[i] + Carry;
+        Carry = (Temp < Carry) ? 1 : 0;
+        Temp += y[i];
+        Carry += (Temp < y[i]) ? 1 : 0;
+        z[i] = Temp;
+    }
+
+    return Carry;
+}
+
+void
+NvBigIntMultiply(
+    NvU32 *z,
+    const NvU32 *x,
+    const NvU32 *y,
+    const NvU32 NumDigits)
+{
+    NvU32 i;
+    NvU32 j;
+    NvU32 Temp[NV_BIGINT_MAX_DW * 2];
+    NvU32 Carry[2];
+
+    memset(Temp, 0,  sizeof(Temp));
+
+    for (i = 0; i < NumDigits; i++)
+    {
+        Carry[1] = 0;
+        for (j = 0; j < NumDigits; j++){
+            NvU64 Val = (NvU64)y[j] * x[i] + Temp[i + j] + Carry[1];
+            Carry[0] = *((NvU32*)(&Val));
+            Carry[1] = *((NvU32*)(&Val) + 1);
+            Temp[i + j] = Carry[0];
+        }
+        Temp[i + NumDigits] = Carry[1];
+    }
+
+    memcpy(z, Temp, NumDigits * 2 * sizeof(NvU32));
+}
+
+void NvBigIntHalve(
+    NvU32 *z,
+    const NvU32 *x,
+    const NvU32 Carry,
+    const NvU32 NumDigits)
+{
+    NvU32 i;
+
+    for (i = 0; i < NumDigits - 1; i++)
+    {
+        z[i] = (x[i+1] << 31) | (x[i] >> 1);
+    }
+    z[i] = (Carry << 31) | (x[i] >> 1);
+}
+
+void
+NvBigIntAddMod(
+    NvU32 *z,
+    const NvU32 *x,
+    const NvU32 *y,
+    const NvBigIntModulus *p)
+{
+    NvBigIntAdd(z, x, y, p->Digits);
+
+    if (NvBigIntCompare(z, p->Number, p->Digits) >= 0)
+    {
+        NvBigIntSubtract(z, z, p->Number, p->Digits);
+    }
+}
+
+void
+NvBigIntInverseMod(
+    NvU32 *z,
+    const NvU32 *x,
+    const NvBigIntModulus *p)
+{
+    NvU32 b[NV_BIGINT_MAX_DW];
+    NvU32 d[NV_BIGINT_MAX_DW];
+    NvU32 u[NV_BIGINT_MAX_DW];
+    NvU32 v[NV_BIGINT_MAX_DW];
+
+    memset(b, 0, sizeof(b));
+    memset(d, 0, sizeof(d));
+    d[0] = 1;
+
+    memcpy(u, p->Number, p->Digits * sizeof(NvU32));
+    memcpy(v, x, p->Digits * sizeof(NvU32));
+
+    while (!NvBigIntIsZero(u, p->Digits))
+    {
+        while (!(*u & 1))
+        {
+            NvBigIntHalveMod(u, u, p);
+            NvBigIntHalveMod(b, b, p);
+        }
+        while (!(*v & 1))
+        {
+            NvBigIntHalveMod(v, v, p);
+            NvBigIntHalveMod(d, d, p);
+        }
+        if (NvBigIntCompare(u, v, p->Digits) >= 0)
+        {
+            NvBigIntSubtractMod(u, u, v, p);
+            NvBigIntSubtractMod(b, b, d, p);
+        }
+        else
+        {
+            NvBigIntSubtractMod(v, v, u, p);
+            NvBigIntSubtractMod(d, d, b, p);
+        }
+    }
+
+    memcpy(z, d, p->Digits * sizeof(NvU32));
+}
+
+void
+NvBigIntPowerMod(
+    NvU32 *z,
+    const NvU32 *x,
+    const NvU32 *e,
+    const NvBigIntModulus* p,
+    const NvU32 eDigits)
+{
+  NvS32 i;
+  NvU32 One[NV_BIGINT_MAX_DW];
+  NvU32 ResidueX[NV_BIGINT_MAX_DW];
+
+  memset(One, 0, sizeof(NvU32)*NV_BIGINT_MAX_DW);
+  One[0] = 1;
+
+  for (i = eDigits * 32 - 1; !NvBigIntGetBit(e, i) && i >= 0; i--);
+
+  if (i < 0)
+  {
+    memcpy(z, One, p->Digits * sizeof(NvU32));
+    return;
+  }
+
+  NvBigIntMontgomeryProduct(ResidueX, x, p->Residue, p);
+  memcpy(z, ResidueX, p->Digits * sizeof(NvU32));
+
+  for (i--; i >= 0; i--)
+  {
+    NvBigIntMontgomeryProduct(z, z, z, p);
+    if (NvBigIntGetBit(e, i)) NvBigIntMontgomeryProduct(z, z, ResidueX, p);
+  }
+
+  NvBigIntMontgomeryProduct(z, z, One, p);
+}
+
+/**
+ * Translation table for base64
+ */
+static const NvU8 Base64TranslateBuff[] = "|$$$}rstuvwxyz{$$$$$$$>?@ABCDEFGHIJKLMNOPQRSTUVW$$$$$$XYZ[\\]^_`abcdefghijklmnopq";
+
+int
+NvBase64Decode(
+    const u_int8_t *pInBuf,
+    u_int32_t InBufSize,
+    u_int8_t *pOutBuf,
+    u_int32_t *pOutBufSize)
+{
+    NvU32 i = 0;
+
+    if ((pInBuf == NULL) || (pOutBufSize == NULL) || (InBufSize == 0))
+    {
+        return NvError_BadParameter;
+    }
+
+    if (pOutBuf == NULL)
+    {
+        /* Valid if the caller is requesting the size of the decoded
+         * binary buffer so they know how much to alloc.
+         */
+        *pOutBufSize = 0;
+    }
+    else
+    {
+        /* Validate the size of the passed input data buffer.
+         * In theory the input buffer size should be 3/4 the size of
+         * the decoded buffer. But if there were some white
+         * space chars in input buffer then it is possible that the
+         * input buffer is smaller.
+         * First validate against 2/3rds the size of the input buffer
+         * here. That allows for some slop.
+         * Below code makes sure output buffer size is big enough.
+         */
+        if (*pOutBufSize < (InBufSize * 2)/3)
+        {
+            return NvError_InsufficientMemory;
+        }
+    }
+
+    /* This loop is less efficient than it could be because
+     * it's designed to tolerate bad characters (like whitespace)
+     * in the input buffer.
+     */
+    while (i < InBufSize)
+    {
+        NvU8 CurrVal;
+        NvU32 ValidLen = 0;
+        NvU8 ValidBuf[4];
+
+        // gather 4 good chars from the pInBufput stream
+        while ((i < InBufSize) && (ValidLen < 4))
+        {
+            CurrVal = 0;
+            while ((i < InBufSize) && (CurrVal == 0))
+            {
+                // This loop skips bad chars
+                CurrVal = pInBuf[i++];
+                CurrVal = ((CurrVal < 43 || CurrVal > 122) ?
+                          0 : Base64TranslateBuff[CurrVal - 43]);
+                if (CurrVal != 0)
+                {
+                    CurrVal = (unsigned char) ((CurrVal == '$') ? 0 : CurrVal - 61);
+                }
+            }
+            if (CurrVal != 0)
+            {
+                ValidBuf[ValidLen++] = CurrVal - 1;
+            }
+        }
+
+        if (pOutBuf == NULL)
+        {
+            // just measurpInBufg the size of the destpInBufation buffer
+            if ((ValidLen > 1) && (ValidLen <= 4))   // only valid values
+            {
+                *pOutBufSize += ValidLen - 1;
+            }
+            continue;
+        }
+
+        if ((pOutBuf + ValidLen - 1) > (pOutBuf + *pOutBufSize))
+        {
+            return NvError_InsufficientMemory;
+        }
+
+        switch (ValidLen)
+        {
+            case 4:
+                // 4 pInBufput chars equals 3 pOutBufput chars
+                pOutBuf[2] = (unsigned char ) (((ValidBuf[2] << 6) & 0xc0) | ValidBuf[3]);
+                // fall through
+            case 3:
+                // 3 pInBufput chars equals 2 pOutBufput chars
+                pOutBuf[1] = (unsigned char ) (ValidBuf[1] << 4 | ValidBuf[2] >> 2);
+                // fall through
+            case 2:
+                // 2 pInBufput chars equals 1 pOutBufput char
+                pOutBuf[0] = (unsigned char ) (ValidBuf[0] << 2 | ValidBuf[1] >> 4);
+                pOutBuf += ValidLen - 1;
+                break;
+            case 1:
+                // Unexpected
+                break;
+            case 0:
+                // conceivable if white space follows the end of valid data
+                break;
+            default:
+                // Unexpected
+                break;
+        }
+    }
+    return NvSuccess;
+}
+
+static int
+NvInitBigIntModulus(
+	NvBigIntModulus *p,
+	const NvU8 *pNumber,
+	const NvU32 NumSize)
+{
+	NvU32 i;
+	NvU32 j;
+
+	if (p == NULL || pNumber == NULL)
+		return -1;
+
+	memset(p, 0, sizeof(NvBigIntModulus));
+
+	// pInBufitialize Digits
+	p->Digits = (NumSize + sizeof(NvU32) - 1) / sizeof(NvU32);
+
+	if (p->Digits > NV_BIGINT_MAX_DW)
+		return -1;
+
+	memcpy(p->Number, pNumber, NumSize);
+
+	// calculate p->InvDigits
+	p->InvDigits = NvInverseDigit(p->Number[0]);
+
+	// calculate p->Residue
+	NvBigIntSubtract(p->Residue, p->Residue, p->Number, p->Digits);
+
+	for (i = p->Digits * 32, j = 0; j < 32; j++) {
+		if (i & ~((unsigned)~0 >> j)) {
+			NvBigIntMontgomeryProduct(p->Residue, p->Residue,
+						p->Residue, p);
+		}
+		if (i & (1 << (31 - j))) {
+			NvBigIntDoubleMod(p->Residue, p->Residue, p);
+		}
+	}
+
+	return 0;
+}
+
+/*
+* (1) keep halving (p-1) * (q-1) until you get an odd number,
+*    to obtain the following factorization:
+*
+*            (p-1) * (q-1) = n' * 2a
+*
+* here n' is odd, and a is a positive integer.
+*
+* In RSA, usually a is very small such as 2 (in that case, (p-1) * (q-1) = n' * 4).
+*
+* (2) use bigIntInverseMod to calculate d' = e-1 mod n'
+*
+* (3) calculate d" = d' mod 2^a  , and n" = n' mod 2^a, e" = e mod 2^a
+*
+* this is trivial, just bitwise-AND the lowest word with (2a - 1)
+*
+* (4) find a value b in [0, ..., 2a - 1] so that (d" + b * n")*e" mod 2^a  = 1
+*
+* for small values of a, you can just use a for loop to do an exhausive search.
+* No need to use modular inverse which is even slower
+*
+* (5) the final value is d = d' + b * n'
+*
+**/
+
+void rsa_gen_priv_key(
+    NvU32 *pOutput,
+    NvU32 *pE,
+    NvU8 *pP,
+    NvU8 *pQ,
+    NvU32 NumDigits)
+{
+    NvU32 pPrime[NV_BIGINT_MAX_DW];
+    NvU32 qPrime[NV_BIGINT_MAX_DW];
+    NvU32 dPrime[NV_BIGINT_MAX_DW];
+    NvU32 nPrime[NV_BIGINT_MAX_DW];
+    NvU32 dDoublePrime[NV_BIGINT_MAX_DW];
+    NvU32 nDoublePrime[NV_BIGINT_MAX_DW];
+    NvU32 Phi[NV_BIGINT_MAX_DW];
+    NvU32 a = 1;
+    NvU32 b[NV_BIGINT_MAX_DW];
+    NvU32 eDoublePrime;
+    NvS32 i = 0;
+    NvU32 Terminate = NV_FALSE;
+    NvBigIntModulus nPrimeMod;
+
+    memset(&nPrimeMod, 0, sizeof(nPrimeMod));
+    memcpy(pPrime, pP, NumDigits * sizeof(NvU32));
+    memcpy(qPrime, pQ, NumDigits * sizeof(NvU32));
+
+    pPrime[0]--;
+    qPrime[0]--;
+
+    NvBigIntMultiply(Phi, pPrime, qPrime, NumDigits/2);
+
+    memcpy(nPrime, Phi, NumDigits*sizeof(NvU32));
+
+    //(1) keep halving (p-1) * (q-1) until you get an odd number,
+    // to obtain the following factorization: (p-1) * (q-1) = n' * 2a
+    do {
+        NvBigIntHalve(nPrime, nPrime, 0, NumDigits);
+        a *= 2;
+
+        if(nPrime[0] & 1)
+          Terminate = NV_TRUE;
+
+    } while (!Terminate);
+
+    NvInitBigIntModulus(&nPrimeMod, (NvU8 *)nPrime,
+                        NumDigits * sizeof(NvU32));
+
+    //(2) use bigIntInverseMod to calculate d' = e^-1 mod n'
+    NvBigIntInverseMod(dPrime, pE, &nPrimeMod);
+
+    //(3) calculate d" = d' mod 2^a  , and n" = n' mod 2^a, e" = e mod 2^a
+    dDoublePrime[0] = dPrime[0] & (a-1);
+    nDoublePrime[0] = nPrime[0] & (a-1);
+    eDoublePrime = pE[0] & (a-1);
+
+      //(4) find a value b in [0, ..., 2a - 1] so that (d" + b * n")*e" mod 2^a  = 1
+    Terminate = NV_FALSE;
+    do {
+        if((((dDoublePrime[0] + i * nDoublePrime[0]) *
+                        eDoublePrime) & (a - 1)) == 1)
+        {
+          Terminate = NV_TRUE;
+        }
+        else
+        {
+          i++;
+        }
+    } while(!Terminate);
+
+    memset(b, 0, NumDigits * sizeof(NvU32));
+    b[0] = i;
+
+    //(5) the final value is d = d' + b * n'
+    memset(pOutput, 0, NumDigits * 4);
+    NvBigIntMultiply(pOutput, b, nPrime, NumDigits);
+    NvBigIntAdd(pOutput, dPrime, pOutput, NumDigits);
+}
+
+static void
+rsa_init_modulus(
+	NvBigIntModulus *pModulus,
+	u_int32_t *pP,
+	u_int32_t *pQ,
+	u_int32_t BitSize)
+{
+	u_int32_t TmpArray[NV_BIGINT_MAX_DW];
+
+	SwapEndianness((u_int8_t *)pP, BitSize / 8 / 2, (u_int8_t *)pP);
+	SwapEndianness((u_int8_t *)pQ, BitSize / 8 / 2, (u_int8_t *)pQ);
+
+	mpMultiply(TmpArray, pP, pQ, BitSize / 8 / 2 / sizeof(u_int32_t));
+	NvInitBigIntModulus(pModulus, (u_int8_t *)TmpArray, BitSize / 8);
+}
+
+bool
+pkc_extract_rsa_key(
+		u_int8_t *pBuffer,
+		u_int32_t BufSize,
+		NvTegraPkcKey *pPkcKey)
+{
+
+	bool b = true;;
+
+	memset(pPkcKey, 0x0, sizeof(*pPkcKey));
+
+	if (pkc_extract_private_keys(pBuffer, BufSize,
+					pPkcKey->P,
+					pPkcKey->Q) == false) {
+		printf("Error: Not a valid PKC key format\n");
+		b = false;
+		goto fail;
+	}
+
+	rsa_init_modulus(&pPkcKey->Modulus, (u_int32_t *)pPkcKey->P,
+			(u_int32_t *)pPkcKey->Q, RSA_KEY_BIT_SIZE);
+
+	*((u_int32_t *)&pPkcKey->PubKey[0]) = RSA_PUBLIC_EXPONENT_VAL;
+	rsa_gen_priv_key((u_int32_t *)pPkcKey->PrivKey,
+				(u_int32_t*)pPkcKey->PubKey,
+				pPkcKey->P, pPkcKey->Q, (RSA_KEY_BYTE_SIZE / 4));
+fail:
+    return b;
+}
+
+int pkckey_set(u_int8_t *key_buffer,
+		u_int32_t buffer_size,
+		void **pkckey,
+		int save)
+{
+	static NvTegraPkcKey nv_PkcKey;
+	bool b = pkc_extract_rsa_key(key_buffer, buffer_size, &nv_PkcKey);
+
+	if (b == true) {
+		*pkckey = (void *)&nv_PkcKey;
+
+		/* save pubkey to a file */
+		if (save)
+			pkc_save_pubkey(&nv_PkcKey, PUBKEY_FILENAME);
+		return 0;
+	}
+
+	printf("Error: %s: failed\n", __func__);
+	return -1;
+}
diff --git a/src/rsa_key_parse.h b/src/rsa_key_parse.h
new file mode 100644
index 000000000000..c25f11ad1ee5
--- /dev/null
+++ b/src/rsa_key_parse.h
@@ -0,0 +1,107 @@
+/*
+ * Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ * See file CREDITS for list of people who contributed to this
+ * project.
+ */
+
+#ifndef INCLUDED_RSA_KEY_PARSE_H_N
+#define INCLUDED_RSA_KEY_PARSE_H_N
+
+#define HEX_TO_DEC(c)                                   \
+    (((c) >= '0' && (c) <= '9') ? (c) - '0' :           \
+     ((c) >= 'a' && (c) <= 'f') ? (c) - 'a' + 10 :      \
+     ((c) >= 'A' && (c) <= 'F') ? (c) - 'A' + 10 : -1)
+
+#define PRIME_PATTERN_P "P = "
+#define PRIME_PATTERN_Q "Q = "
+#define PEMFORMAT_START "-----BEGIN RSA PRIVATE KEY-----"
+#define PEMFORMAT_END "-----END RSA PRIVATE KEY-----"
+
+/* Explicitly sized signed and unsigned ints. */
+typedef unsigned char      NvU8;  /**< 0 to 255 */
+typedef unsigned short     NvU16; /**< 0 to 65535 */
+typedef unsigned int       NvU32; /**< 0 to 4294967295 */
+typedef unsigned long long NvU64; /**< 0 to 18446744073709551615 */
+typedef signed char        NvS8;  /**< -128 to 127 */
+typedef signed short       NvS16; /**< -32768 to 32767 */
+typedef signed int         NvS32; /**< -2147483648 to 2147483647 */
+typedef signed long long   NvS64; /**< 2^-63 to 2^63-1 */
+
+#define NV_TRUE	1
+#define NV_FALSE 0
+
+#define NvSuccess			0
+#define NvError_BadParameter		-10
+#define NvError_InsufficientMemory	-11
+
+/**
+ * Universal Tags
+ */
+typedef enum{
+    EOC                 = 0x0,
+    BOOLEAN             = 0x1,
+    INTEGER             = 0x2,
+    BIT_STRING          = 0x3,
+    OCTET_STRING        = 0x4,
+    NULL_IDENTIFIER     = 0x5,
+    OBJECT_IDENTIFIER   = 0x6,
+    OBJECT_DESCRIPTOR   = 0x7,
+    EXTERNAL            = 0x8,
+    REAL                = 0x9,
+    ENUMERATED          = 0xA,
+    EMBEDDED_PDV        = 0xB,
+    UTF8STRING          = 0xC,
+    RELATIVE_OID        = 0xD,
+    SEQUENCE            = 0x10,
+    SET                 = 0x11,
+    NUMERIC_STRING      = 0x12,
+    PRINTABLE_STRING    = 0x13,
+    T61STRING           = 0x14,
+    VIDEOTEXSTRING      = 0x15,
+    IA5STRING           = 0x16,
+    UTCTIME             = 0x17,
+    GENERALIZED_TIME    = 0x18,
+    GRAPHICSTRING       = 0x19,
+    VISIBLESTRING       = 0x1A,
+    GENERALSTRING       = 0x1B,
+    UNIVERSALSTRING     = 0x1C,
+    CHARACTERSTRING     = 0x1D,
+    BMPSTRING           = 0x1E,
+
+    INVALID             = 0xFF
+}NvAsnUniversalTag;
+
+NvU32
+NvBigIntAdd(
+    NvU32 *z,
+    const NvU32 *x,
+    const NvU32 *y,
+    const NvU32 NumDigits);
+
+void NvBigIntHalve(
+    NvU32 *z,
+    const NvU32 *x,
+    const NvU32 Carry,
+    const NvU32 NumDigits);
+
+int
+NvBase64Decode(
+    const u_int8_t *pInBuf,
+    u_int32_t InBufSize,
+    u_int8_t *pOutBuf,
+    u_int32_t *pOutBufSize);
+
+#endif /* #ifndef INCLUDED_RSA_KEY_PARSE_H_N */
diff --git a/src/set.c b/src/set.c
index 474554b2ed58..f023c7e94f3b 100644
--- a/src/set.c
+++ b/src/set.c
@@ -53,7 +53,10 @@ read_from_image(char	*filename,
 	FILE *fp;
 	struct stat stats;
 
-	fp = fopen(filename, "rb");
+	if (f_type == file_type_key)
+		fp = fopen(filename, "r");
+	else
+		fp = fopen(filename, "rb");
 	if (fp == NULL) {
 		result = 1;
 		return result;
@@ -185,6 +188,38 @@ set_rsa_param(build_image_context *context, parse_token token,
 	return result;
 }
 
+int
+set_rsa_key(build_image_context *context, const char *filename, int save)
+{
+	int	result = 0;
+
+	u_int8_t *key_storage;	/* Holds rsa keys */
+	u_int32_t actual_size;	/* In bytes */
+
+        /* Read the image into memory. */
+	result = read_from_image(filename,
+				0,
+				0,	// read in entire file
+				&key_storage,
+				&actual_size,
+				file_type_key);
+
+	if (result) {
+		printf("Error reading file %s.\n", filename);
+		exit(1);
+        }
+
+	if (enable_debug) {
+		printf("Reading file %s with size %d\n", filename, (int)actual_size);
+	}
+
+	/* set up pkckey */
+	result = pkckey_set(key_storage, actual_size, &context->pkckey, save);
+
+	free(key_storage);
+	return result;
+}
+
 #define DEFAULT()                                                     \
 	default:                                                      \
 		printf("Unexpected token %d at line %d\n",            \
diff --git a/src/set.h b/src/set.h
index 5fc4061b7e4d..3a7e147ac414 100644
--- a/src/set.h
+++ b/src/set.h
@@ -47,6 +47,11 @@ set_rsa_param(build_image_context	*context,
 		const char	*filename);
 
 int
+set_rsa_key(build_image_context	*context,
+		const char	*filename,
+		int		 save);
+
+int
 context_set_value(build_image_context	*context,
 		parse_token	token,
 		void		*value);
-- 
1.8.1.5
