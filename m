From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 09/11] tegrarcm: Add support for odmdata command
Date: Mon, 9 Sep 2013 13:15:59 -0700
Message-ID: <1378757761-20939-10-git-send-email-amartin@nvidia.com>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378757761-20939-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add command "--odmdata" to pass odmdata down to the miniloader.  This
is used by the miniloader for things such as UART init and RAM sizing.
It is normally not needed and is really only useful for miniloader
debugging.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c        | 34 +++++++++++++++++++++++++++++++++-
 src/nv3p.c        | 16 ++++++++++++++++
 src/nv3p.h        |  8 ++++++++
 src/tegrarcm.1.in |  4 ++++
 4 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/src/main.c b/src/main.c
index 57bbefb..b3f3ef0 100644
--- a/src/main.c
+++ b/src/main.c
@@ -70,6 +70,7 @@ static int download_bct(nv3p_handle_t h3p, char *filename);
 static int download_bootloader(nv3p_handle_t h3p, char *filename,
 			       uint32_t entry, uint32_t loadaddr);
 static int rip_bct(nv3p_handle_t h3p, char *filename);
+static int send_odmdata(nv3p_handle_t h3p, uint32_t odmdata);
 
 enum cmdline_opts {
 	OPT_BCT,
@@ -79,6 +80,7 @@ enum cmdline_opts {
 	OPT_HELP,
 	OPT_VERSION,
 	OPT_RIPBCT,
+	OPT_ODMDATA,
 	OPT_END,
 };
 
@@ -121,7 +123,7 @@ int main(int argc, char **argv)
 	uint32_t entryaddr = 0;
 	uint16_t devid;
 	int do_rip = 0;
-	int msg_len;
+	uint32_t odmdata = 0;
 
 	static struct option long_options[] = {
 		[OPT_BCT]        = {"bct", 1, 0, 0},
@@ -131,6 +133,7 @@ int main(int argc, char **argv)
 		[OPT_HELP]       = {"help", 0, 0, 0},
 		[OPT_VERSION]    = {"version", 0, 0, 0},
 		[OPT_RIPBCT]     = {"ripbct", 0, 0, 0},
+		[OPT_ODMDATA]    = {"odmdata", 1, 0, 0},
 		[OPT_END]        = {0, 0, 0, 0}
 	};
 
@@ -162,6 +165,9 @@ int main(int argc, char **argv)
 			case OPT_RIPBCT:
 				do_rip = 1;
 				break;
+			case OPT_ODMDATA:
+				odmdata = strtoul(optarg, NULL, 0);
+				break;
 			case OPT_HELP:
 			default:
 				usage(argv[0]);
@@ -238,6 +244,12 @@ int main(int argc, char **argv)
 		exit(0);
 	}
 
+	if (odmdata) {
+		ret = send_odmdata(h3p, odmdata);
+		if (ret)
+			error(1, ret, "error sending ODM data");
+	}
+
 	// get platform info and dump it
 	ret = nv3p_cmd_send(h3p, NV3P_CMD_GET_PLATFORM_INFO, (uint8_t *)&info);
 	if (ret)
@@ -656,6 +668,26 @@ static int rip_bct(nv3p_handle_t h3p, char *filename)
 	return 0;
 }
 
+static int send_odmdata(nv3p_handle_t h3p, uint32_t odmdata)
+{
+	int ret;
+	nv3p_cmd_send_odmdata_t odm_info;
+
+	odm_info.odmdata = odmdata;
+	ret = nv3p_cmd_send(h3p, NV3P_CMD_SEND_ODMDATA, (uint8_t *)&odm_info);
+	if (ret) {
+		dprintf("error sending send odmdata command\n");
+		return ret;
+	}
+	ret = wait_status(h3p);
+	if (ret) {
+		dprintf("error waiting for status after get bct\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int download_bootloader(nv3p_handle_t h3p, char *filename,
 			       uint32_t entry, uint32_t loadaddr)
 {
diff --git a/src/nv3p.c b/src/nv3p.c
index b2dff42..e1d1d39 100644
--- a/src/nv3p.c
+++ b/src/nv3p.c
@@ -346,6 +346,15 @@ static void nv3p_write_cmd(nv3p_handle_t h3p, uint32_t command, void *args,
 		WRITE32(tmp, a->entry);
 		break;
 	}
+	case NV3P_CMD_SEND_ODMDATA:
+	{
+		nv3p_cmd_send_odmdata_t *a = (nv3p_cmd_send_odmdata_t *)args;
+	        *length = (1 * 4);
+		WRITE32(tmp, *length);
+		WRITE32(tmp, command);
+		WRITE32(tmp, a->odmdata);
+	        break;
+	}
 	default:
 		dprintf("bad command: 0x%x\n", command);
 		break;
@@ -423,6 +432,7 @@ static int nv3p_get_cmd_return(nv3p_handle_t h3p, uint32_t command, void *args)
 		break;
 	case NV3P_CMD_DL_BCT:
 	case NV3P_CMD_DL_BL:
+	case NV3P_CMD_SEND_ODMDATA:
 		break;
 	default:
 		dprintf("unknown command: 0x%x\n", command);
@@ -659,6 +669,12 @@ static int nv3p_get_args(nv3p_handle_t h3p, uint32_t command, void **args,
 		READ32(tmp, a->entry);
 		break;
 	}
+	case NV3P_CMD_SEND_ODMDATA:
+	{
+		nv3p_cmd_send_odmdata_t *a = (nv3p_cmd_send_odmdata_t *)buf;
+		READ32(tmp, a->odmdata);
+		break;
+	}
 	default:
 		dprintf("unknown command: 0x%x\n", command);
 		return EINVAL;
diff --git a/src/nv3p.h b/src/nv3p.h
index 5ceba78..6597fd2 100644
--- a/src/nv3p.h
+++ b/src/nv3p.h
@@ -42,6 +42,7 @@
 #define NV3P_CMD_GET_BCT                 0x02
 #define NV3P_CMD_DL_BCT                  0x04
 #define NV3P_CMD_DL_BL                   0x06
+#define NV3P_CMD_SEND_ODMDATA            0x07
 #define NV3P_CMD_STATUS                  0x0a
 
 // nack codes
@@ -182,6 +183,13 @@ typedef struct {
 	uint32_t entry; // Execution entry point
 } nv3p_cmd_dl_bl_t;
 
+/*
+ * nv3p_cmd_send_odmdata_t: send ODMDATA to the device
+ */
+typedef struct {
+	uint32_t odmdata;
+} nv3p_cmd_send_odmdata_t;
+
 int nv3p_open(nv3p_handle_t *h3p, usb_device_t *usb);
 void nv3p_close(nv3p_handle_t h3p);
 int nv3p_cmd_send(nv3p_handle_t h3p, uint32_t command, void *args);
diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in
index 1f72c65..b972e95 100644
--- a/src/tegrarcm.1.in
+++ b/src/tegrarcm.1.in
@@ -72,6 +72,10 @@ Print help text and exit.
 Read the BCT from the target device and write it to \fIbctfile\fP.  If
 this option is specified, the --bootloader, --loadaddr, and
 --entryaddr options are ignored.
+.TP
+.B \-\-odmdata
+Pass odmdata down to the miniloader.  This is really only useful for
+miniloader debugging.
 
 .SH EXAMPLE
 To download u-boot firmware to a Tegra20 seaboard:
-- 
1.8.1.5
