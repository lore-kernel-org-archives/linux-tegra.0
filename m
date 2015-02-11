From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux PATCH 1/2] Don't set .owner field in kernel pinctrl driver any more
Date: Wed, 11 Feb 2015 14:04:42 -0700
Message-ID: <1423688683-13249-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This aligns the output with what's checked into the kernel.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 soc-to-kernel-pinctrl-driver.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/soc-to-kernel-pinctrl-driver.py b/soc-to-kernel-pinctrl-driver.py
index 3dd1a989439c..a6cb59eebd4e 100755
--- a/soc-to-kernel-pinctrl-driver.py
+++ b/soc-to-kernel-pinctrl-driver.py
@@ -394,7 +394,6 @@ MODULE_DEVICE_TABLE(of, %(soc)s_pinctrl_of_match);
 static struct platform_driver %(soc)s_pinctrl_driver = {
 	.driver = {
 		.name = "%(soc)s-pinctrl",
-		.owner = THIS_MODULE,
 		.of_match_table = %(soc)s_pinctrl_of_match,
 	},
 	.probe = %(soc)s_pinctrl_probe,
-- 
1.9.1
