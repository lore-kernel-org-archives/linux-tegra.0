From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [tegrarcm PATCH 1/2] Remove the operational mode check
Date: Mon,  9 Nov 2015 18:19:45 +0100
Message-ID: <1447089586-24826-2-git-send-email-alban.bedel@avionic-design.de>
References: <1447089586-24826-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447089586-24826-1-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This check isn't really needed, if communication isn't possible it
will just fails later on. Further it currently prevent communicating
with secured devices, so just remove it.

Signed-off-by: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 src/main.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/src/main.c b/src/main.c
index 3db0ed8..b024562 100644
--- a/src/main.c
+++ b/src/main.c
@@ -352,13 +352,6 @@ int main(int argc, char **argv)
 		error(1, errno, "wait status after platform info");
 	dump_platform_info(&info);
 
-	if (info.op_mode != RCM_OP_MODE_DEVEL &&
-	    info.op_mode != RCM_OP_MODE_ODM_OPEN &&
-	    info.op_mode != RCM_OP_MODE_ODM_SECURE &&
-	    info.op_mode != RCM_OP_MODE_PRE_PRODUCTION)
-		error(1, ENODEV, "device is not in developer, open, secure, "
-		      "or pre-production mode, cannot flash");
-
 	// download the BCT
 	ret = download_bct(h3p, bctfile);
 	if (ret) {
-- 
2.6.3
