From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH V2 1/5] Add format functions to express BCT and bootloader data value
Date: Tue, 8 Apr 2014 22:30:18 +0800
Message-ID: <1396967422-6018-2-git-send-email-pchiu@nvidia.com>
References: <1396967422-6018-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396967422-6018-1-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a new field to the value_data table, which is the function to
use to format the data value.

Signed-off-by: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/bct_dump.c | 59 +++++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/src/bct_dump.c b/src/bct_dump.c
index dbef913..6d99214 100644
--- a/src/bct_dump.c
+++ b/src/bct_dump.c
@@ -27,37 +27,54 @@
 int enable_debug;
 cbootimage_soc_config * g_soc_config;
 
+static void format_u32_hex8(char const * message, void * data);
+static void format_u32(char const * message, void * data);
+
+typedef void (*format_function)(char const * message, void * data);
+
 typedef struct {
 	parse_token id;
 	char const * message;
+	format_function format;
 } value_data;
 
 static value_data const values[] = {
-	{ token_boot_data_version,   "Version       = 0x%08x;\n" },
-	{ token_block_size_log2,     "BlockSize     = 0x%08x;\n" },
-	{ token_page_size_log2,      "PageSize      = 0x%08x;\n" },
-	{ token_partition_size,      "PartitionSize = 0x%08x;\n" },
-	{ token_odm_data,            "OdmData       = 0x%08x;\n\n" },
-	{ token_bootloader_used,     "# Bootloader used       = %d;\n" },
-	{ token_bootloaders_max,     "# Bootloaders max       = %d;\n" },
-	{ token_bct_size,            "# BCT size              = %d;\n" },
-	{ token_hash_size,           "# Hash size             = %d;\n" },
-	{ token_crypto_offset,       "# Crypto offset         = %d;\n" },
-	{ token_crypto_length,       "# Crypto length         = %d;\n" },
-	{ token_max_bct_search_blks, "# Max BCT search blocks = %d;\n" },
+	{ token_boot_data_version,   "Version       = ", format_u32_hex8 },
+	{ token_block_size_log2,     "BlockSize     = ", format_u32_hex8 },
+	{ token_page_size_log2,      "PageSize      = ", format_u32_hex8 },
+	{ token_partition_size,      "PartitionSize = ", format_u32_hex8 },
+	{ token_odm_data,            "OdmData       = ", format_u32_hex8 },
+	{ token_bootloader_used,     "# Bootloader used       = ", format_u32 },
+	{ token_bootloaders_max,     "# Bootloaders max       = ", format_u32 },
+	{ token_bct_size,            "# BCT size              = ", format_u32 },
+	{ token_hash_size,           "# Hash size             = ", format_u32 },
+	{ token_crypto_offset,       "# Crypto offset         = ", format_u32 },
+	{ token_crypto_length,       "# Crypto length         = ", format_u32 },
+	{ token_max_bct_search_blks, "# Max BCT search blocks = ", format_u32 },
 };
 
 static value_data const bl_values[] = {
-	{ token_bl_version,     "Version      = 0x%08x;\n" },
-	{ token_bl_start_blk,   "Start block  = %d;\n" },
-	{ token_bl_start_page,  "Start page   = %d;\n" },
-	{ token_bl_length,      "Length       = %d;\n" },
-	{ token_bl_load_addr,   "Load address = 0x%08x;\n" },
-	{ token_bl_entry_point, "Entry point  = 0x%08x;\n" },
-	{ token_bl_attribute,   "Attributes   = 0x%08x;\n" },
+	{ token_bl_version,     "Version      = ", format_u32_hex8 },
+	{ token_bl_start_blk,   "Start block  = ", format_u32 },
+	{ token_bl_start_page,  "Start page   = ", format_u32 },
+	{ token_bl_length,      "Length       = ", format_u32 },
+	{ token_bl_load_addr,   "Load address = ", format_u32_hex8 },
+	{ token_bl_entry_point, "Entry point  = ", format_u32_hex8 },
+	{ token_bl_attribute,   "Attributes   = ", format_u32_hex8 },
 };
 
 /*****************************************************************************/
+static void format_u32_hex8(char const * message, void * data)
+{
+	printf("%s0x%08x;\n", message, *((u_int32_t *) data));
+}
+
+static void format_u32(char const * message, void * data)
+{
+	printf("%s%d;\n", message, *((u_int32_t *) data));
+}
+
+/*****************************************************************************/
 static void usage(void)
 {
 	printf("Usage: bct_dump bctfile\n");
@@ -164,7 +181,7 @@ int main(int argc, char *argv[])
 			 values[i].id == token_page_size_log2)
 			data = 1 << data;
 
-		printf(values[i].message, data);
+		values[i].format(values[i].message, &data);
 	}
 
 	/* Display bootloader values */
@@ -192,7 +209,7 @@ int main(int argc, char *argv[])
 				if (e != 0)
 					data = -1;
 
-				printf(bl_values[j].message, data);
+				bl_values[j].format(bl_values[j].message, &data);
 			}
 		}
 	}
-- 
1.9.1
