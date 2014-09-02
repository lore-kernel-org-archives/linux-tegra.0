From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH] Make kernel driver of_device_id tables const
Date: Tue,  2 Sep 2014 14:12:59 -0600
Message-ID: <1409688779-23593-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This updates to output to match the kernel drivers as of 5dfe10b43a91
"pinctrl: Make of_device_id array const".

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 soc-to-kernel-pinctrl-driver.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/soc-to-kernel-pinctrl-driver.py b/soc-to-kernel-pinctrl-driver.py
index fd1930db0055..3dd1a989439c 100755
--- a/soc-to-kernel-pinctrl-driver.py
+++ b/soc-to-kernel-pinctrl-driver.py
@@ -385,7 +385,7 @@ static int %(soc)s_pinctrl_probe(struct platform_device *pdev)
 	return tegra_pinctrl_probe(pdev, &%(soc)s_pinctrl);
 }
 
-static struct of_device_id %(soc)s_pinctrl_of_match[] = {
+static const struct of_device_id %(soc)s_pinctrl_of_match[] = {
 	{ .compatible = "nvidia,%(soc)s-pinmux", },
 	{ },
 };
-- 
1.9.1
