From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v6 2/5] Add support to dump rsa related fields for t210
Date: Mon, 19 Oct 2015 12:03:02 -0700
Message-ID: <1445281385-28020-3-git-send-email-jimmzhang@nvidia.com>
References: <1445281385-28020-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445281385-28020-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support to dump rsa pubkey, bct's rsa-pss signature and
bootloader's rsa-pss signature.

Changes in V6:
1) Add token id as input parameter for format_function()
2) Call get_value_size() to get paramter size in function
   format_rsa_param() instead of using a constant.

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/bct_dump.c           | 65 ++++++++++++++++++++++++++++++++++++++++--------
 src/t210/nvbctlib_t210.c | 17 +++++++++++++
 2 files changed, 72 insertions(+), 10 deletions(-)

diff --git a/src/bct_dump.c b/src/bct_dump.c
index be7b85dc72d6..4f50fa261e6e 100644
--- a/src/bct_dump.c
+++ b/src/bct_dump.c
@@ -27,11 +27,13 @@
 int enable_debug;
 cbootimage_soc_config * g_soc_config;
 
-static void format_u32_hex8(char const * message, void * data);
-static void format_u32(char const * message, void * data);
-static void format_chipuid(char const * message, void * data);
+static void format_u32_hex8(parse_token id, char const * message, void * data);
+static void format_u32(parse_token id, char const * message, void * data);
+static void format_chipuid(parse_token id, char const * message, void * data);
+static void format_hex_16_bytes(parse_token id, char const * message, void * data);
+static void format_rsa_param(parse_token id, char const * message, void * data);
 
-typedef void (*format_function)(char const * message, void * data);
+typedef void (*format_function)(parse_token id, char const * message, void * data);
 
 typedef struct {
 	parse_token id;
@@ -39,9 +41,11 @@ typedef struct {
 	format_function format;
 } value_data;
 
+#define PARAM_TYPE_BINARY_DATA_MAX_SIZE 256
 typedef union {
 	u_int32_t val;
 	u_int8_t uid[16];
+	u_int8_t binary[PARAM_TYPE_BINARY_DATA_MAX_SIZE];
 } param_types;
 
 #define MAX_PARAM_SIZE sizeof(param_types)
@@ -54,6 +58,9 @@ static value_data const values[] = {
 	{ token_odm_data,            "OdmData       = ", format_u32_hex8 },
 	{ token_secure_jtag_control, "JtagCtrl      = ", format_u32_hex8 },
 	{ token_secure_debug_control, "DebugCtrl     = ", format_u32_hex8 },
+	{ token_crypto_hash, 	     "BCT AES Hash  = ", format_hex_16_bytes },
+	{ token_rsa_key_modulus,     "RsaKeyModulus:\n", format_rsa_param },
+	{ token_rsa_pss_sig_bct,     "RsaPssSigBct:\n", format_rsa_param },
 	{ token_unique_chip_id,      "ChipUid       = ", format_chipuid },
 	{ token_bootloader_used,     "# Bootloader used       = ", format_u32 },
 	{ token_bootloaders_max,     "# Bootloaders max       = ", format_u32 },
@@ -72,6 +79,8 @@ static value_data const bl_values[] = {
 	{ token_bl_load_addr,   "Load address = ", format_u32_hex8 },
 	{ token_bl_entry_point, "Entry point  = ", format_u32_hex8 },
 	{ token_bl_attribute,   "Attributes   = ", format_u32_hex8 },
+	{ token_bl_crypto_hash, "Bl AES Hash  = ", format_hex_16_bytes },
+	{ token_rsa_pss_sig_bl,	"RsaPssSigBl:\n", format_rsa_param },
 };
 
 static value_data const mts_values[] = {
@@ -85,17 +94,17 @@ static value_data const mts_values[] = {
 };
 
 /*****************************************************************************/
-static void format_u32_hex8(char const * message, void * data)
+static void format_u32_hex8(parse_token id, char const * message, void * data)
 {
 	printf("%s0x%08x;\n", message, *((u_int32_t *) data));
 }
 
-static void format_u32(char const * message, void * data)
+static void format_u32(parse_token id, char const * message, void * data)
 {
 	printf("%s%d;\n", message, *((u_int32_t *) data));
 }
 
-static void format_chipuid(char const * message, void * data)
+static void format_chipuid(parse_token id, char const * message, void * data)
 {
 	u_int8_t *uid = (u_int8_t *)data;
 	int byte_index;
@@ -108,6 +117,38 @@ static void format_chipuid(char const * message, void * data)
 	printf("%s%s;\n", message, uid_str);
 }
 
+static void format_hex_16_bytes(parse_token id, char const * message, void * data)
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
+static void format_rsa_param(parse_token id, char const * message, void * data)
+{
+#define MAX_BYTE_NUMBER_PER_LINE	16
+	u_int8_t *rsa = (u_int8_t *)data;
+	int size = g_soc_config->get_value_size(id);
+	int byte_index;
+
+	printf("%s", message);
+	for (byte_index = 0; byte_index < size; ++byte_index) {
+		printf(" %02x", *rsa++);
+
+		if ((byte_index + 1) % MAX_BYTE_NUMBER_PER_LINE == 0)
+			printf("\n");
+	}
+
+	if (byte_index % MAX_BYTE_NUMBER_PER_LINE != 0)
+		printf("\n");
+#undef MAX_BYTE_NUMBER_PER_LINE
+}
+
 /*****************************************************************************/
 static void usage(void)
 {
@@ -213,7 +254,7 @@ int main(int argc, char *argv[])
 		if (e)
 			memset(&data, 0, MAX_PARAM_SIZE);
 
-		values[i].format(values[i].message, &data);
+		values[i].format(values[i].id, values[i].message, &data);
 	}
 
 	/* Display bootloader values */
@@ -241,7 +282,9 @@ int main(int argc, char *argv[])
 				if (e)
 					data.val = -1;
 
-				bl_values[j].format(bl_values[j].message, &data);
+				bl_values[j].format(bl_values[j].id,
+							bl_values[j].message,
+							&data);
 			}
 		}
 	}
@@ -271,7 +314,9 @@ int main(int argc, char *argv[])
 				if (e)
 					data.val = -1;
 
-				mts_values[j].format(mts_values[j].message, &data);
+				mts_values[j].format(mts_values[j].id,
+							mts_values[j].message,
+							&data);
 			}
 		}
 	}
diff --git a/src/t210/nvbctlib_t210.c b/src/t210/nvbctlib_t210.c
index c8e13486aaa3..4b63cadb5285 100644
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
@@ -2034,6 +2036,12 @@ t210_getbl_param(u_int32_t set,
 		sizeof(nvboot_hash));
 		break;
 
+	case token_rsa_pss_sig_bl:
+		reverse_byte_order(data,
+			&bct_ptr->bootloader[set].signature.rsa_pss_sig,
+			sizeof(nvboot_rsa_pss_sig));
+		break;
+
 	default:
 		return -ENODATA;
 	}
@@ -2130,6 +2138,15 @@ t210_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 		memcpy(data, &(bct_ptr->unique_chip_id), sizeof(nvboot_ecid));
 		break;
 
+	case token_rsa_key_modulus:
+		reverse_byte_order(data, &bct_ptr->key, sizeof(nvboot_rsa_key_modulus));
+		break;
+
+	case token_rsa_pss_sig_bct:
+		reverse_byte_order(data, &bct_ptr->signature.rsa_pss_sig,
+			sizeof(nvboot_rsa_pss_sig));
+		break;
+
 	case token_reserved_offset:
 		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.reserved)
 				- (u_int8_t *)&samplebct;
-- 
1.8.1.5
