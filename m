From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] Dump MTS information by bct_dump utility.
Date: Thu, 10 Jul 2014 18:21:50 +0800
Message-ID: <1404987710-26375-3-git-send-email-vinceh@nvidia.com>
References: <1404987710-26375-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404987710-26375-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The MTS is only for Tegra132 now.

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/bct_dump.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/src/bct_dump.c b/src/bct_dump.c
index 6735c355761a..4e8cb42b1dce 100644
--- a/src/bct_dump.c
+++ b/src/bct_dump.c
@@ -73,6 +73,16 @@ static value_data const bl_values[] = {
 	{ token_bl_attribute,   "Attributes   = ", format_u32_hex8 },
 };
 
+static value_data const mts_values[] = {
+	{ token_mts_info_version,      "Version      = ", format_u32_hex8 },
+	{ token_mts_info_start_block,  "Start block  = ", format_u32 },
+	{ token_mts_info_start_page,   "Start page   = ", format_u32 },
+	{ token_mts_info_length,       "Length       = ", format_u32 },
+	{ token_mts_info_load_address, "Load address = ", format_u32_hex8 },
+	{ token_mts_info_entry_point,  "Entry point  = ", format_u32_hex8 },
+	{ token_mts_info_attribute,    "Attributes   = ", format_u32_hex8 },
+};
+
 /*****************************************************************************/
 static void format_u32_hex8(char const * message, void * data)
 {
@@ -177,6 +187,7 @@ int main(int argc, char *argv[])
 	u_int32_t bootloaders_used;
 	u_int32_t parameters_used;
 	u_int32_t sdram_used;
+	u_int32_t mts_used;
 	nvboot_dev_type type;
 	param_types data;
 	int i;
@@ -234,6 +245,35 @@ int main(int argc, char *argv[])
 		}
 	}
 
+	/* Display mts values */
+	e = g_soc_config->get_value(token_mts_used,
+				     &mts_used,
+				     context.bct);
+
+	if ((e == 0) && (mts_used> 0)) {
+		int mts_count = sizeof(mts_values) / sizeof(mts_values[0]);
+
+		printf("#\n"
+		       "# These values are set by cbootimage using the\n"
+		       "# mts provided by the Mts=... or MtsPreboot=...\n"
+		       "# configuration option.\n"
+		       "#\n");
+
+		for (i = 0; i < mts_used; ++i) {
+			for (j = 0; j < mts_count; ++j) {
+				e = g_soc_config->get_mts_info(&context,
+								   i,
+							       mts_values[j].id,
+							       &(data.val));
+				printf("# Mts[%d].", i);
+
+				if (e)
+					data.val = -1;
+
+				mts_values[j].format(mts_values[j].message, &data);
+			}
+		}
+	}
 	/* Display flash device parameters */
 	e = g_soc_config->get_value(token_num_param_sets,
 				     &parameters_used,
-- 
1.8.3.2
