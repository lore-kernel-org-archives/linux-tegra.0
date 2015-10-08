From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v3 3/5] Add support to dump rsa related fields for t210
Date: Thu, 8 Oct 2015 12:38:26 -0700
Message-ID: <1444333109-3671-4-git-send-email-jimmzhang@nvidia.com>
References: <1444333109-3671-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444333109-3671-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support to dump rsa pubkey, bct's rsa-pss signature and
bootloader's rsa-pss signature.

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/bct_dump.c           | 38 ++++++++++++++++++++++++++++++++++++++
 src/t210/nvbctlib_t210.c | 16 ++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/src/bct_dump.c b/src/bct_dump.c
index be7b85dc72d6..fb1134b1b679 100644
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
@@ -54,6 +57,9 @@ static value_data const values[] = {
 	{ token_odm_data,            "OdmData       = ", format_u32_hex8 },
 	{ token_secure_jtag_control, "JtagCtrl      = ", format_u32_hex8 },
 	{ token_secure_debug_control, "DebugCtrl     = ", format_u32_hex8 },
+	{ token_crypto_hash, 	     "BCT AES Hash  = ", format_hex_16_bytes },
+	{ token_rsa_key_modulus,     "RsaKeyModulus = ", format_rsa_param },
+	{ token_rsa_pss_sig_bct,     "RsaPssSigBct = ", format_rsa_param },
 	{ token_unique_chip_id,      "ChipUid       = ", format_chipuid },
 	{ token_bootloader_used,     "# Bootloader used       = ", format_u32 },
 	{ token_bootloaders_max,     "# Bootloaders max       = ", format_u32 },
@@ -72,6 +78,8 @@ static value_data const bl_values[] = {
 	{ token_bl_load_addr,   "Load address = ", format_u32_hex8 },
 	{ token_bl_entry_point, "Entry point  = ", format_u32_hex8 },
 	{ token_bl_attribute,   "Attributes   = ", format_u32_hex8 },
+	{ token_bl_crypto_hash, "Bl AES Hash  = ", format_hex_16_bytes },
+	{ token_rsa_pss_sig_bl,	"RsaPssSigBl  = ", format_rsa_param },
 };
 
 static value_data const mts_values[] = {
@@ -108,6 +116,36 @@ static void format_chipuid(char const * message, void * data)
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
+		if ((byte_index + 1) % 64 == 0)
+			printf(";\n");
+	}
+
+	if (byte_index % 64 != 0)
+		printf(";\n");
+}
+
 /*****************************************************************************/
 static void usage(void)
 {
diff --git a/src/t210/nvbctlib_t210.c b/src/t210/nvbctlib_t210.c
index 91a42ec8367f..10e2a4756e1a 100644
--- a/src/t210/nvbctlib_t210.c
+++ b/src/t210/nvbctlib_t210.c
@@ -109,6 +109,8 @@ parse_token t210_root_token_list[] = {
 	token_bootloaders_max,
 	token_bct_size,
 	token_hash_size,
+	token_crypto_hash,
+	token_bl_crypto_hash,
 	token_crypto_offset,
 	token_crypto_length,
 	token_max_bct_search_blks,
@@ -2034,6 +2036,11 @@ t210_getbl_param(u_int32_t set,
 		sizeof(nvboot_hash));
 		break;
 
+	case token_rsa_pss_sig_bl:
+		memcpy(data, &bct_ptr->bootloader[set].signature.rsa_pss_sig,
+			sizeof(nvboot_rsa_pss_sig));
+		break;
+
 	default:
 		return -ENODATA;
 	}
@@ -2130,6 +2137,15 @@ t210_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 		memcpy(data, &(bct_ptr->unique_chip_id), sizeof(nvboot_ecid));
 		break;
 
+	case token_rsa_key_modulus:
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
