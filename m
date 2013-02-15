From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] pwm: tegra: assume CONFIG_OF
Date: Fri, 15 Feb 2013 15:02:22 -0700
Message-ID: <1360965742-19744-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra only supports, and always enables, device tree. Remove all ifdefs
for DT support from the driver.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pwm/pwm-tegra.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index 71900e8..af3ab48 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -233,7 +233,6 @@ static int tegra_pwm_remove(struct platform_device *pdev)
 	return pwmchip_remove(&pc->chip);
 }
 
-#ifdef CONFIG_OF
 static struct of_device_id tegra_pwm_of_match[] = {
 	{ .compatible = "nvidia,tegra20-pwm" },
 	{ .compatible = "nvidia,tegra30-pwm" },
@@ -241,12 +240,11 @@ static struct of_device_id tegra_pwm_of_match[] = {
 };
 
 MODULE_DEVICE_TABLE(of, tegra_pwm_of_match);
-#endif
 
 static struct platform_driver tegra_pwm_driver = {
 	.driver = {
 		.name = "tegra-pwm",
-		.of_match_table = of_match_ptr(tegra_pwm_of_match),
+		.of_match_table = tegra_pwm_of_match,
 	},
 	.probe = tegra_pwm_probe,
 	.remove = tegra_pwm_remove,
-- 
1.7.10.4
