From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH 1/1] tegrarcm: Add odm production secure mode support
Date: Wed, 2 Apr 2014 09:57:48 +0800
Message-ID: <1396403868-14479-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

tegrarcm should work if the operating mode is ODM production
secure mode. Add the operating mode definition and description.

Signed-off-by: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c | 4 +++-
 src/rcm.h  | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/main.c b/src/main.c
index fe29df0..50adc14 100644
--- a/src/main.c
+++ b/src/main.c
@@ -290,8 +290,9 @@ int main(int argc, char **argv)
 
 	if (info.op_mode != RCM_OP_MODE_DEVEL &&
 	    info.op_mode != RCM_OP_MODE_ODM_OPEN &&
+	    info.op_mode != RCM_OP_MODE_ODM_SECURE &&
 	    info.op_mode != RCM_OP_MODE_PRE_PRODUCTION)
-		error(1, ENODEV, "device is not in developer, open, "
+		error(1, ENODEV, "device is not in developer, open, secure, "
 		      "or pre-production mode, cannot flash");
 
 	// download the BCT
@@ -654,6 +655,7 @@ static void dump_platform_info(nv3p_platform_info_t *info)
 	case RCM_OP_MODE_PRE_PRODUCTION:    op_mode = "pre-production mode"; break;
 	case RCM_OP_MODE_DEVEL:             op_mode = "developer mode"; break;
 	case RCM_OP_MODE_ODM_OPEN:          op_mode = "odm open mode"; break;
+	case RCM_OP_MODE_ODM_SECURE:        op_mode = "odm secure mode"; break;
 	default:                            op_mode = "unknown"; break;
 	}
 	printf(" (%s)\n", op_mode);
diff --git a/src/rcm.h b/src/rcm.h
index 505547c..ab4bea2 100644
--- a/src/rcm.h
+++ b/src/rcm.h
@@ -107,6 +107,7 @@ typedef struct {
 // security operating modes
 #define RCM_OP_MODE_PRE_PRODUCTION  0x1
 #define RCM_OP_MODE_DEVEL           0x3
+#define RCM_OP_MODE_ODM_SECURE      0x4
 #define RCM_OP_MODE_ODM_OPEN        0x5
 
 int rcm_init(uint32_t version);
-- 
1.9.1
