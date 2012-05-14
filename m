From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] amba: tegra-ahb: Remove empty *_remove()
Date: Mon, 14 May 2012 19:21:18 +0300
Message-ID: <1337012479-19421-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Remove unnecessary empty function.

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/amba/tegra-ahb.c |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
index aa0b1f1..0b6f0b2 100644
--- a/drivers/amba/tegra-ahb.c
+++ b/drivers/amba/tegra-ahb.c
@@ -264,11 +264,6 @@ static int __devinit tegra_ahb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __devexit tegra_ahb_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static const struct of_device_id tegra_ahb_of_match[] __devinitconst = {
 	{ .compatible = "nvidia,tegra30-ahb", },
 	{ .compatible = "nvidia,tegra20-ahb", },
@@ -277,7 +272,6 @@ static const struct of_device_id tegra_ahb_of_match[] __devinitconst = {
 
 static struct platform_driver tegra_ahb_driver = {
 	.probe = tegra_ahb_probe,
-	.remove = __devexit_p(tegra_ahb_remove),
 	.driver = {
 		.name = DRV_NAME,
 		.owner = THIS_MODULE,
-- 
1.7.5.4
