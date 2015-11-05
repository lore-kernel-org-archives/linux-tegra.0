From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [cbootimage PATCH 3/3] Add support to read and write rsa related fields on t124
Date: Thu,  5 Nov 2015 17:03:22 +0100
Message-ID: <1446739402-14238-4-git-send-email-alban.bedel@avionic-design.de>
References: <1446739402-14238-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446739402-14238-1-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This allow creating and reading signed images for secure boot on t124.

Signed-off-by: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 src/t124/nvbctlib_t124.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/src/t124/nvbctlib_t124.c b/src/t124/nvbctlib_t124.c
index 5b760ad..ce0a34b 100644
--- a/src/t124/nvbctlib_t124.c
+++ b/src/t124/nvbctlib_t124.c
@@ -113,7 +113,10 @@ parse_token t124_root_token_list[] = {
 	token_crypto_length,
 	token_max_bct_search_blks,
 	token_unique_chip_id,
-	token_secure_jtag_control
+	token_secure_jtag_control,
+	token_rsa_key_modulus,
+	token_rsa_pss_sig_bl,
+	token_rsa_pss_sig_bct
 };
 
 int
@@ -876,6 +879,12 @@ t124_getbl_param(u_int32_t set,
 		sizeof(nvboot_hash));
 		break;
 
+	case token_rsa_pss_sig_bl:
+		reverse_byte_order((u_int8_t *)data,
+			(const u_int8_t *)&bct_ptr->bootloader[set].signature.rsa_pss_sig,
+			sizeof(nvboot_rsa_pss_sig));
+		break;
+
 	default:
 		return -ENODATA;
 	}
@@ -974,6 +983,17 @@ t124_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 		memcpy(data, &(bct_ptr->unique_chip_id), sizeof(nvboot_ecid));
 		break;
 
+	case token_rsa_key_modulus:
+		reverse_byte_order(data, (const u_int8_t *)&bct_ptr->key,
+				sizeof(nvboot_rsa_key_modulus));
+		break;
+
+	case token_rsa_pss_sig_bct:
+		reverse_byte_order(data,
+			(const u_int8_t *)&bct_ptr->signature.rsa_pss_sig,
+			sizeof(nvboot_rsa_pss_sig));
+		break;
+
 	case token_reserved_offset:
 		*((u_int32_t *)data) = (u_int8_t *)&(samplebct.reserved)
 				- (u_int8_t *)&samplebct;
@@ -1020,6 +1040,28 @@ t124_bct_get_value(parse_token id, void *data, u_int8_t *bct)
 }
 
 int
+t124_bct_get_value_size(parse_token id)
+{
+	switch (id) {
+	case token_rsa_key_modulus:
+		return sizeof(nvboot_rsa_key_modulus);
+
+	case token_rsa_pss_sig_bl:
+		return sizeof(nvboot_rsa_pss_sig);
+
+	case token_rsa_pss_sig_bct:
+		return sizeof(nvboot_rsa_pss_sig);
+
+	/*
+	 * Other bct fields can be added in when needed
+	 */
+	default:
+		return -ENODATA;
+	}
+	return 0;
+}
+
+int
 t124_bct_set_value(parse_token id, void *data, u_int8_t *bct)
 {
 	nvboot_config_table *bct_ptr = (nvboot_config_table *)bct;
@@ -1044,6 +1086,26 @@ t124_bct_set_value(parse_token id, void *data, u_int8_t *bct)
 		memcpy(&bct_ptr->unique_chip_id, data, sizeof(nvboot_ecid));
 		break;
 
+	case token_rsa_key_modulus:
+		reverse_byte_order((u_int8_t *)&bct_ptr->key, data,
+					sizeof(nvboot_rsa_key_modulus));
+		break;
+
+	case token_rsa_pss_sig_bl:
+		/*
+		 * Update bootloader 0 since there is only one copy
+		 * of bootloader being built in.
+		 */
+		reverse_byte_order(
+			(u_int8_t *)&bct_ptr->bootloader[0].signature.rsa_pss_sig,
+			data, sizeof(nvboot_rsa_pss_sig));
+		break;
+
+	case token_rsa_pss_sig_bct:
+		reverse_byte_order((u_int8_t *)&bct_ptr->signature.rsa_pss_sig,
+			data, sizeof(nvboot_rsa_pss_sig));
+		break;
+
 	default:
 		return -ENODATA;
 	}
@@ -1125,7 +1187,7 @@ cbootimage_soc_config tegra124_config = {
 	.getbl_param				= t124_getbl_param,
 	.set_value					= t124_bct_set_value,
 	.get_value					= t124_bct_get_value,
-	.get_value_size					= bct_get_unsupported,
+	.get_value_size					= t124_bct_get_value_size,
 	.set_data					= t124_bct_set_data,
 	.get_bct_size				= t124_get_bct_size,
 	.token_supported			= t124_bct_token_supported,
-- 
2.6.2
