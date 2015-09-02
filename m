From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v1 2/8] Add bct_dump support for t210
Date: Wed, 2 Sep 2015 14:19:14 -0700
Message-ID: <1441228760-26042-3-git-send-email-jimmzhang@nvidia.com>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441228760-26042-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Added support to dump additional fields such as rsa pubkey, rsa pss
signatures for bct and bootloader.

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/bct_dump.c           | 39 ++++++++++++++++++++++++++++++++++++++-
 src/t210/nvbctlib_t210.c | 23 +++++++++++++++++++----
 2 files changed, 57 insertions(+), 5 deletions(-)

diff --git a/src/bct_dump.c b/src/bct_dump.c
index be7b85dc72d6..3981033aaf6e 100644
--- a/src/bct_dump.c
+++ b/src/bct_dump.c
@@ -30,6 +30,8 @@ cbootimage_soc_config * g_soc_config;
 static void format_u32_hex8(char const * message, void * data);
 static void format_u32(char const * message, void * data);
 static void format_chipuid(char const * message, void * data);
+static void format_hex_16_bytes(char const * message, void * data);
+static void format_rsa_param(char const * message, void * data);
 
 typedef void (*format_function)(char const * message, void * data);
 
@@ -42,6 +44,7 @@ typedef struct {
 typedef union {
 	u_int32_t val;
 	u_int8_t uid[16];
+	u_int8_t rsa_param[256];
 } param_types;
 
 #define MAX_PARAM_SIZE sizeof(param_types)
@@ -54,11 +57,13 @@ static value_data const values[] = {
 	{ token_odm_data,            "OdmData       = ", format_u32_hex8 },
 	{ token_secure_jtag_control, "JtagCtrl      = ", format_u32_hex8 },
 	{ token_secure_debug_control, "DebugCtrl     = ", format_u32_hex8 },
+	{ token_crypto_hash, 	     "BCT AES Hash  = ", format_hex_16_bytes },
+	{ token_pub_key_modulus,     "PubKeyModulus = ", format_rsa_param },
+	{ token_rsa_pss_sig_bct,     "RsaPssSig_Bct = ", format_rsa_param },
 	{ token_unique_chip_id,      "ChipUid       = ", format_chipuid },
 	{ token_bootloader_used,     "# Bootloader used       = ", format_u32 },
 	{ token_bootloaders_max,     "# Bootloaders max       = ", format_u32 },
 	{ token_bct_size,            "# BCT size              = ", format_u32 },
-	{ token_hash_size,           "# Hash size             = ", format_u32 },
 	{ token_crypto_offset,       "# Crypto offset         = ", format_u32 },
 	{ token_crypto_length,       "# Crypto length         = ", format_u32 },
 	{ token_max_bct_search_blks, "# Max BCT search blocks = ", format_u32 },
@@ -72,6 +77,8 @@ static value_data const bl_values[] = {
 	{ token_bl_load_addr,   "Load address = ", format_u32_hex8 },
 	{ token_bl_entry_point, "Entry point  = ", format_u32_hex8 },
 	{ token_bl_attribute,   "Attributes   = ", format_u32_hex8 },
+	{ token_bl_crypto_hash, "Bl AES Hash  = ", format_hex_16_bytes },
+	{ token_rsa_pss_sig_bl,	"RsaPssSig_Bl  = ", format_rsa_param },
 };
 
 static value_data const mts_values[] = {
@@ -108,6 +115,36 @@ static void format_chipuid(char const * message, void * data)
 	printf("%s%s;\n", message, uid_str);
 }
 
+static void format_hex_16_bytes(char const * message, void * data)
+{
+	u_int8_t *p_byte = (u_int8_t *)data;
+	int byte_index;
+
+	printf("%s", message);
+	for (byte_index = 0; byte_index < 16; ++byte_index)
+		printf("%02x", *p_byte++);
+
+	printf(";\n");
+}
+
+static void format_rsa_param(char const * message, void * data)
+{
+	u_int8_t *rsa = (u_int8_t *)data;
+	int byte_index;
+
+	printf("%s", message);
+	for (byte_index = 0; byte_index < ARSE_RSA_PARAM_MAX_BYTES;
+					++byte_index) {
+		printf("%02x", *rsa++);
+
+		if (byte_index && ((byte_index + 1) % 64 == 0))
+			printf(";\n");
+	}
+
+	if (byte_index && (byte_index % 64 != 0))
+			printf(";\n");
+}
+
 /*****************************************************************************/
 static void usage(void)
 {
diff --git a/src/t210/nvbctlib_t210.c b/src/t210/nvbctlib_t210.c
index f48ff66d4c18..a5b9b2cb55c5 100644
--- a/src/t210/nvbctlib_t210.c
+++ b/src/t210/nvbctlib_t210.c
@@ -108,7 +108,8 @@ parse_token t210_root_token_list[] = {
 	token_bootloader_used,
 	token_bootloaders_max,
 	token_bct_size,
-	token_hash_size,
+	token_crypto_hash,
+	token_bl_crypto_hash,
 	token_crypto_offset,
 	token_crypto_length,
 	token_max_bct_search_blks,
@@ -2034,6 +2035,12 @@ t210_getbl_param(u_int32_t set,
 		sizeof(nvboot_hash));
 		break;
 
+	case token_rsa_pss_sig_bl:
+		/* ONLY support one bl */
+		memcpy(data, &bct_ptr->bootloader[set].signature.rsa_pss_sig,
+			sizeof(nvboot_rsa_pss_sig));
+		break;
+
 	default:
 		return -ENODATA;
 	}
@@ -2121,15 +2128,23 @@ t210_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 	CASE_GET_CONST(bootloaders_max,   NVBOOT_MAX_BOOTLOADERS);
 	CASE_GET_CONST(reserved_size,     NVBOOT_BCT_RESERVED_SIZE);
 	case token_crypto_hash:
-		memcpy(data,
-		&(bct_ptr->signature.crypto_hash),
-		sizeof(nvboot_hash));
+		memcpy(data, &(bct_ptr->signature.crypto_hash),
+			sizeof(nvboot_hash));
 		break;
 
 	case token_unique_chip_id:
 		memcpy(data, &(bct_ptr->unique_chip_id), sizeof(nvboot_ecid));
 		break;
 
+	case token_pub_key_modulus:
+		memcpy(data, &bct_ptr->key, sizeof(nvboot_rsa_key_modulus));
+		break;
+
+	case token_rsa_pss_sig_bct:
+		memcpy(data, &bct_ptr->signature.rsa_pss_sig,
+			sizeof(nvboot_rsa_pss_sig));
+		break;
+
 	case token_reserved_offset:
 		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.reserved)
 				- (u_int8_t *)&samplebct;
-- 
1.8.1.5
