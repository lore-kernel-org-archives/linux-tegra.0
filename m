From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 03/11] tegrarcm: Add support for RCM protocol version 40
Date: Mon, 16 Sep 2013 15:24:50 -0700
Message-ID: <1379370298-20404-4-git-send-email-amartin@nvidia.com>
References: <1379370298-20404-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379370298-20404-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

RCM protocol 40 is required for Tegra124

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/rcm.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 src/rcm.h | 58 ++++++++++++++++++++++++++++++++-----------------
 2 files changed, 112 insertions(+), 20 deletions(-)

diff --git a/src/rcm.c b/src/rcm.c
index c5b3aac..cb53d8f 100644
--- a/src/rcm.c
+++ b/src/rcm.c
@@ -36,6 +36,7 @@
 static int rcm_sign_msg(uint8_t *buf);
 static int rcm1_sign_msg(uint8_t *buf);
 static int rcm35_sign_msg(uint8_t *buf);
+static int rcm40_sign_msg(uint8_t *buf);
 static void rcm_init_msg(
 	uint8_t *buf,
 	uint32_t msg_len,
@@ -57,6 +58,13 @@ static void rcm35_init_msg(
 	void *args,
 	uint32_t args_len,
 	uint32_t payload_len);
+static void rcm40_init_msg(
+	uint8_t *buf,
+	uint32_t msg_len,
+	uint32_t opcode,
+	void *args,
+	uint32_t args_len,
+	uint32_t payload_len);
 static uint8_t *rcm_get_msg_payload(uint8_t *buf);
 static void rcm_msg_pad(uint8_t *data, uint32_t len);
 static uint32_t rcm_get_pad_len(uint32_t payload_len);
@@ -79,6 +87,11 @@ int rcm_init(uint32_t version)
 		message_size = sizeof(rcm35_msg_t);
 		ret = 0;
 	}
+	else if (version == RCM_VERSION_40) {
+		rcm_version = version;
+		message_size = sizeof(rcm40_msg_t);
+		ret = 0;
+	}
 	return ret;
 }
 
@@ -88,6 +101,8 @@ uint32_t rcm_get_msg_len(uint8_t *msg)
 		return ((rcm1_msg_t*)msg)->len_insecure;
 	else if (rcm_version == RCM_VERSION_35)
 		return ((rcm35_msg_t*)msg)->len_insecure;
+	else if (rcm_version == RCM_VERSION_40)
+		return ((rcm40_msg_t*)msg)->len_insecure;
 	else
 		return 0;
 }
@@ -139,6 +154,8 @@ static int rcm_sign_msg(uint8_t *buf)
 {
 	if (rcm_version == RCM_VERSION_35)
 		return rcm35_sign_msg(buf);
+	else if (rcm_version == RCM_VERSION_40)
+		return rcm40_sign_msg(buf);
 	else if (rcm_version == RCM_VERSION_1)
 		return rcm1_sign_msg(buf);
 	else
@@ -184,6 +201,26 @@ static int rcm35_sign_msg(uint8_t *buf)
 	return 0;
 }
 
+static int rcm40_sign_msg(uint8_t *buf)
+{
+	rcm40_msg_t *msg;
+	uint32_t crypto_len;
+
+	msg = (rcm40_msg_t*)buf;
+
+	// signing does not include the len_insecure, modulus
+	// and object signature at the beginning of the message
+	crypto_len = msg->len_insecure - sizeof(msg->len_insecure) -
+		sizeof(msg->modulus) -
+		sizeof(msg->object_sig);
+	if (crypto_len % RCM_AES_BLOCK_SIZE) {
+		return -EMSGSIZE;
+	}
+
+	cmac_hash(msg->reserved, crypto_len, msg->object_sig.cmac_hash);
+	return 0;
+}
+
 static uint32_t rcm_get_msg_buf_len(uint32_t payload_len)
 {
 	return message_size + payload_len +
@@ -215,6 +252,9 @@ static void rcm_init_msg(
 	if (rcm_version == RCM_VERSION_35)
 		rcm35_init_msg(buf, msg_len, opcode, args,
 			       args_len, payload_len);
+	else if (rcm_version == RCM_VERSION_40)
+		rcm40_init_msg(buf, msg_len, opcode, args,
+			       args_len, payload_len);
 	else if (rcm_version == RCM_VERSION_1)
 		rcm1_init_msg(buf, msg_len, opcode, args,
 			      args_len, payload_len);
@@ -254,6 +294,40 @@ static void rcm35_init_msg(
 	rcm_msg_pad(buf + sizeof(rcm35_msg_t) + payload_len, padding_len);
 }
 
+static void rcm40_init_msg(
+	uint8_t *buf,
+	uint32_t msg_len,
+	uint32_t opcode,
+	void *args,
+	uint32_t args_len,
+	uint32_t payload_len)
+{
+	uint32_t padding_len;
+	rcm40_msg_t *msg;
+
+	msg = (rcm40_msg_t *)buf;
+
+	padding_len = rcm_get_pad_len(payload_len);
+
+	msg->len_insecure = sizeof(rcm40_msg_t) + payload_len +
+		padding_len;
+
+	memset(&msg->object_sig.cmac_hash, 0x0, sizeof(msg->object_sig.cmac_hash));
+	memset(&msg->reserved, 0x0, sizeof(msg->reserved));
+
+	msg->opcode         = opcode;
+	msg->len_secure     = msg->len_insecure;
+	msg->payload_len    = payload_len;
+	msg->rcm_version    = RCM_VERSION_40;
+
+	if (args_len)
+		memcpy(msg->args, args, args_len);
+	memset(msg->args + args_len, 0x0, sizeof(msg->args) - args_len);
+
+	rcm_msg_pad(msg->padding, sizeof(msg->padding));
+	rcm_msg_pad(buf + sizeof(rcm40_msg_t) + payload_len, padding_len);
+}
+
 static void rcm1_init_msg(
 	uint8_t *buf,
 	uint32_t msg_len,
diff --git a/src/rcm.h b/src/rcm.h
index 1aeca9f..505547c 100644
--- a/src/rcm.h
+++ b/src/rcm.h
@@ -36,6 +36,7 @@
 #define NVBOOT_VERSION(a,b) ((((a)&0xffff) << 16) | ((b)&0xffff))
 #define RCM_VERSION_1 (NVBOOT_VERSION(1, 0))
 #define RCM_VERSION_35 (NVBOOT_VERSION(0x35, 1))
+#define RCM_VERSION_40 (NVBOOT_VERSION(0x40, 1))
 #define RCM_VERSION_MAJOR(ver) ((ver) >> 16)
 #define RCM_VERSION_MINOR(ver) ((ver) & 0xffff)
 
@@ -58,34 +59,51 @@
  *     padding
  */
 typedef struct {
-	uint32_t len_insecure;
-	uint8_t cmac_hash[RCM_AES_BLOCK_SIZE];
-	uint8_t reserved[16];
-	uint32_t opcode;
-	uint32_t len_secure;
-	uint32_t payload_len;
-	uint32_t rcm_version;
-	uint8_t args[48];
-	uint8_t padding[16];
+	uint32_t len_insecure;		// 000-003
+	uint8_t cmac_hash[RCM_AES_BLOCK_SIZE];	// 004-013
+	uint8_t reserved[16];		// 014-023
+	uint32_t opcode;		// 024-027
+	uint32_t len_secure;		// 028-02b
+	uint32_t payload_len;		// 02c-02f
+	uint32_t rcm_version;		// 030-033
+	uint8_t args[48];		// 034-063
+	uint8_t padding[16];		// 064-073
 } rcm1_msg_t;
 
 typedef struct {
-	uint32_t len_insecure;
-	uint8_t modulus[2048 / 8];
+	uint32_t len_insecure;		// 000-003
+	uint8_t modulus[2048 / 8];	// 004-103
 	union {
 		uint8_t cmac_hash[RCM_AES_BLOCK_SIZE];
 		uint8_t rsa_pss_sig[2048 / 8];
-	} object_sig;
-	uint8_t reserved[16];
-	uint32_t ecid[4];
-	uint32_t opcode;
-	uint32_t len_secure;
-	uint32_t payload_len;
-	uint32_t rcm_version;
-	uint8_t args[48];
-	uint8_t padding[16];
+	} object_sig;			// 104-203
+	uint8_t reserved[16];		// 204-213
+	uint32_t ecid[4];		// 214-223
+	uint32_t opcode;		// 224-227
+	uint32_t len_secure;		// 228-22b
+	uint32_t payload_len;		// 22c-22f
+	uint32_t rcm_version;		// 230-233
+	uint8_t args[48];		// 234-263
+	uint8_t padding[16];		// 264-273
 } rcm35_msg_t;
 
+typedef struct {
+	uint32_t len_insecure;		// 000-003
+	uint8_t modulus[2048 / 8];	// 004-103
+	struct {
+		uint8_t cmac_hash[RCM_AES_BLOCK_SIZE];
+		uint8_t rsa_pss_sig[2048 / 8];
+	} object_sig;			// 104-213
+	uint8_t reserved[16];		// 214-223
+	uint32_t ecid[4];		// 224-233
+	uint32_t opcode;		// 234-237
+	uint32_t len_secure;		// 238-23b
+	uint32_t payload_len;		// 23c-23f
+	uint32_t rcm_version;		// 240-243
+	uint8_t args[48];		// 244-273
+	uint8_t padding[16];		// 274-283
+} rcm40_msg_t;
+
 // security operating modes
 #define RCM_OP_MODE_PRE_PRODUCTION  0x1
 #define RCM_OP_MODE_DEVEL           0x3
-- 
1.8.1.5
