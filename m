From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH v1 3/8] tegrarcm: Get platform info
Date: Tue, 17 Mar 2015 17:38:56 -0700
Message-ID: <1426639141-12060-5-git-send-email-jimmzhang@nvidia.com>
References: <1426639141-12060-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426639141-12060-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add two newly added platform info fields for t132.

	uint32_t warranty_fuse;
	uint8_t skip_auto_detect;

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c | 30 +++++++++++++++++++++++-------
 src/nv3p.c |  6 +++++-
 src/nv3p.h |  9 +++++++++
 src/rcm.h  |  1 +
 4 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/src/main.c b/src/main.c
index 6e708761adf9..96caddcc820d 100644
--- a/src/main.c
+++ b/src/main.c
@@ -147,13 +147,25 @@ static void usage(char *progname)
 	fprintf(stderr, "\n");
 }
 
+static uint16_t _devid = 0;
+static void set_devid(uint16_t devid)
+{
+	_devid = devid;
+}
+
+uint16_t get_devid(void)
+{
+	return _devid;
+}
+
 int main(int argc, char **argv)
 {
 	// discover devices
 	uint64_t uid[2];
 	int actual_len;
 	usb_device_t *usb;
-	nv3p_platform_info_t info;
+	nv3p_platform_info_t132_t info_t132;
+	nv3p_platform_info_t *info = (nv3p_platform_info_t *)&info_t132;
 	nv3p_handle_t h3p;
 	int ret, ret2;
 	int c;
@@ -291,6 +303,7 @@ int main(int argc, char **argv)
 	if (!usb)
 		error(1, errno, "could not open USB device");
 	printf("device id: 0x%x\n", devid);
+	set_devid(devid);
 
 	ret = usb_read(usb, (uint8_t *)uid, sizeof(uid), &actual_len);
 	if (!ret) {
@@ -342,18 +355,21 @@ int main(int argc, char **argv)
 	}
 
 	// get platform info and dump it
-	ret = nv3p_cmd_send(h3p, NV3P_CMD_GET_PLATFORM_INFO, (uint8_t *)&info);
+	if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA132)
+		info_t132.skip_auto_detect = 1;
+
+	ret = nv3p_cmd_send(h3p, NV3P_CMD_GET_PLATFORM_INFO, (uint8_t *)info);
 	if (ret)
 		error(1, errno, "retreiving platform info");
 	ret = wait_status(h3p);
 	if (ret)
 		error(1, errno, "wait status after platform info");
-	dump_platform_info(&info);
+	dump_platform_info(info);
 
-	if (info.op_mode != RCM_OP_MODE_DEVEL &&
-	    info.op_mode != RCM_OP_MODE_ODM_OPEN &&
-	    info.op_mode != RCM_OP_MODE_ODM_SECURE &&
-	    info.op_mode != RCM_OP_MODE_PRE_PRODUCTION)
+	if (info->op_mode != RCM_OP_MODE_DEVEL &&
+	    info->op_mode != RCM_OP_MODE_ODM_OPEN &&
+	    info->op_mode != RCM_OP_MODE_ODM_SECURE &&
+	    info->op_mode != RCM_OP_MODE_PRE_PRODUCTION)
 		error(1, ENODEV, "device is not in developer, open, secure, "
 		      "or pre-production mode, cannot flash");
 
diff --git a/src/nv3p.c b/src/nv3p.c
index 616485f4ce30..89bb607d9d96 100644
--- a/src/nv3p.c
+++ b/src/nv3p.c
@@ -35,6 +35,7 @@
 #include "nv3p.h"
 #include "usb.h"
 #include "debug.h"
+#include "rcm.h"
 
 /* nv3p command packet format */
 /*|------------32 bits--------------|*/
@@ -427,7 +428,10 @@ static int nv3p_get_cmd_return(nv3p_handle_t h3p, uint32_t command, void *args)
 
 	switch (command) {
 	case NV3P_CMD_GET_PLATFORM_INFO:
-		length = sizeof(nv3p_platform_info_t);
+		if ((get_devid() & 0xff) == USB_DEVID_NVIDIA_TEGRA132)
+			length = sizeof(nv3p_platform_info_t132_t);
+		else
+			length = sizeof(nv3p_platform_info_t);
 		break;
 	case NV3P_CMD_GET_BCT:
 		length = sizeof(nv3p_bct_info_t);
diff --git a/src/nv3p.h b/src/nv3p.h
index fd63f2824cbf..66c06e7a0902 100644
--- a/src/nv3p.h
+++ b/src/nv3p.h
@@ -158,6 +158,15 @@ typedef struct {
 	nv3p_board_id_t board_id;
 } nv3p_platform_info_t;
 
+/*
+ * nv3p_platform_info_t132_t: retrieves t132 system information. All paramters
+ * are output parameters.
+ */
+typedef struct {
+	nv3p_platform_info_t base;
+	uint32_t warranty_fuse;
+	uint8_t skip_auto_detect;
+} nv3p_platform_info_t132_t;
 
 /*
  * nv3p_bct_info_t: holds information about BCT size
diff --git a/src/rcm.h b/src/rcm.h
index 7a66045e245d..fd2b48f36f9d 100644
--- a/src/rcm.h
+++ b/src/rcm.h
@@ -121,4 +121,5 @@ int rcm_create_msg(
 	uint32_t payload_len,
 	uint8_t **msg);
 
+uint16_t get_devid(void);
 #endif // _RCM_H
-- 
1.8.1.5
