From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH v1 4/8] tegrarcm: add support for odmdata command
Date: Tue, 17 Mar 2015 17:38:57 -0700
Message-ID: <1426639141-12060-6-git-send-email-jimmzhang@nvidia.com>
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

Add "--odmdata=[odmdata]" option in command line.

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c | 37 +++++++++++++++++++++++++++++++++++++
 src/nv3p.c | 16 ++++++++++++++++
 src/nv3p.h |  8 ++++++++
 3 files changed, 61 insertions(+)

diff --git a/src/main.c b/src/main.c
index 96caddcc820d..b61fc9ebf92e 100644
--- a/src/main.c
+++ b/src/main.c
@@ -84,6 +84,7 @@ static int download_bootloader(nv3p_handle_t h3p, char *filename,
 static int download_mts(nv3p_handle_t h3p, char *filename,
 			uint32_t loadaddr, uint16_t devid, char *mtsdir);
 static int read_bct(nv3p_handle_t h3p, char *filename);
+static int send_odmdata(nv3p_handle_t h3p, uint32_t odmdata);
 
 enum cmdline_opts {
 	OPT_BCT,
@@ -99,6 +100,7 @@ enum cmdline_opts {
 	OPT_MTS,
 	OPT_MTSENTRY,
 	OPT_MTSDIR,
+	OPT_ODMDATA,
 	OPT_END,
 };
 
@@ -132,6 +134,8 @@ static void usage(char *progname)
 	fprintf(stderr, "\t\tminiloader\n");
 	fprintf(stderr, "\t--miniloader_entry=<mlentry>\n");
 	fprintf(stderr, "\t\tSpecify the entry point for the miniloader\n");
+	fprintf(stderr, "\t--odmdata=<odmdata>\n");
+	fprintf(stderr, "\t\tOverride odmdata by odmdata given in command line\n");
 	fprintf(stderr, "\t--preboot=pbfile\n");
 	fprintf(stderr, "\t\tRead the preboot ucode from given file\n");
 	fprintf(stderr, "\t--preboot-entry=<pbentry>\n");
@@ -183,6 +187,7 @@ int main(int argc, char **argv)
 	char *mtsfile = NULL;
 	uint32_t mtsentry = 0;
 	char *mtsdir = NULL;
+	uint32_t odmdata = 0;
 
 	static struct option long_options[] = {
 		[OPT_BCT]        = {"bct", 1, 0, 0},
@@ -198,6 +203,7 @@ int main(int argc, char **argv)
 		[OPT_MTS]        = {"mts", 1, 0, 0},
 		[OPT_MTSENTRY]   = {"mts-entry", 1, 0, 0},
 		[OPT_MTSDIR]     = {"mts-dir", 1, 0, 0},
+		[OPT_ODMDATA]    = {"odmdata", 1, 0, 0},
 		[OPT_END]        = {0, 0, 0, 0}
 	};
 
@@ -248,6 +254,9 @@ int main(int argc, char **argv)
 			case OPT_MTSDIR:
 				mtsdir = optarg;
 				break;
+			case OPT_ODMDATA:
+				odmdata = strtoul(optarg, NULL, 0);
+				break;
 			case OPT_HELP:
 			default:
 				usage(argv[0]);
@@ -354,6 +363,14 @@ int main(int argc, char **argv)
 		exit(0);
 	}
 
+	if (odmdata) {
+		printf("sending odm data (0x%x) to target...\n", odmdata);
+		ret = send_odmdata(h3p, odmdata);
+		if (ret)
+			error(1, ret, "error sending ODM data");
+		printf("odm data sent successfully\n");
+	}
+
 	// get platform info and dump it
 	if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA132)
 		info_t132.skip_auto_detect = 1;
@@ -965,6 +982,26 @@ out:
 	return ret;
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
index 89bb607d9d96..7f8c72994396 100644
--- a/src/nv3p.c
+++ b/src/nv3p.c
@@ -358,6 +358,15 @@ static void nv3p_write_cmd(nv3p_handle_t h3p, uint32_t command, void *args,
 		WRITE32(tmp, a->address);
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
@@ -439,6 +448,7 @@ static int nv3p_get_cmd_return(nv3p_handle_t h3p, uint32_t command, void *args)
 	case NV3P_CMD_DL_BCT:
 	case NV3P_CMD_DL_BL:
 	case NV3P_CMD_DL_MTS:
+	case NV3P_CMD_SEND_ODMDATA:
 		break;
 	default:
 		dprintf("unknown command: 0x%x\n", command);
@@ -682,6 +692,12 @@ static int nv3p_get_args(nv3p_handle_t h3p, uint32_t command, void **args,
 		READ32(tmp, a->address);
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
index 66c06e7a0902..3143c192e979 100644
--- a/src/nv3p.h
+++ b/src/nv3p.h
@@ -42,6 +42,7 @@
 #define NV3P_CMD_GET_BCT                 0x02
 #define NV3P_CMD_DL_BCT                  0x04
 #define NV3P_CMD_DL_BL                   0x06
+#define NV3P_CMD_SEND_ODMDATA            0x07
 #define NV3P_CMD_STATUS                  0x0a
 #define NV3P_CMD_DL_MTS                  0x33
 
@@ -206,6 +207,13 @@ typedef struct {
 	uint32_t address; // Load address
 } nv3p_cmd_dl_mts_t;
 
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
-- 
1.8.1.5
