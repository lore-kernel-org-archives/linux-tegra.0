From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] video: fbmon: fix hdmi VSDB detection
Date: Mon, 16 May 2011 14:09:36 -0600
Message-ID: <1305576576-32673-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The IEEE OUI begins at the byte after the type/length byte, not at
that byte.

This code first appeared at:
http://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=commitdiff;h=cef13d98eb134defcfc125debf38cc6749e153c8

At that time, block[] (now edid[]) pointed at the first byte after the
type/length byte. Now that it points at the type/length byte, the offsets
need adjustment.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
This patch to non-Tegra code fixes an issue in code that's only present
in non-upstream patches in various of the Android/Tegra branches.

This particular patch is against the ChromeOS kernel, so you may need
slight fuzz when applying it to the various Android/Tegra branches.

 drivers/video/fbmon.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbmon.c b/drivers/video/fbmon.c
index 499ce8d..7f6fbf2 100644
--- a/drivers/video/fbmon.c
+++ b/drivers/video/fbmon.c
@@ -1010,8 +1010,9 @@ void fb_edid_add_monspecs(unsigned char *edid, struct fb_monspecs *specs)
 			}
 		else if (type == 0x3) {
 			if (len >= 3) {
-				u32 ieee_reg = edid[pos] | (edid[pos+1] << 8) |
-					(edid[pos+2] << 16);
+				u32 ieee_reg = edid[pos+1] |
+					(edid[pos+2] << 8) |
+					(edid[pos+3] << 16);
 				if (ieee_reg == 0x000c03)
 					specs->misc |= FB_MISC_HDMI;
 			}
-- 
1.7.0.4
