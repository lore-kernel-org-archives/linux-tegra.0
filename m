From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] memory: tegra{20,30}-mc: Remove empty *_remove()
Date: Mon, 14 May 2012 19:20:03 +0300
Message-ID: <1337012410-19067-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Remove unnecessary empty functions.

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/memory/tegra20-mc.c |    6 ------
 drivers/memory/tegra30-mc.c |    6 ------
 2 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/drivers/memory/tegra20-mc.c b/drivers/memory/tegra20-mc.c
index a38d9d3..3ed49c1 100644
--- a/drivers/memory/tegra20-mc.c
+++ b/drivers/memory/tegra20-mc.c
@@ -241,14 +241,8 @@ static int __devinit tegra20_mc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __devexit tegra20_mc_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver tegra20_mc_driver = {
 	.probe = tegra20_mc_probe,
-	.remove = __devexit_p(tegra20_mc_remove),
 	.driver = {
 		.name = DRV_NAME,
 		.owner = THIS_MODULE,
diff --git a/drivers/memory/tegra30-mc.c b/drivers/memory/tegra30-mc.c
index cb639b1..e56ff04 100644
--- a/drivers/memory/tegra30-mc.c
+++ b/drivers/memory/tegra30-mc.c
@@ -365,14 +365,8 @@ static int __devinit tegra30_mc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __devexit tegra30_mc_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver tegra30_mc_driver = {
 	.probe = tegra30_mc_probe,
-	.remove = __devexit_p(tegra30_mc_remove),
 	.driver = {
 		.name = DRV_NAME,
 		.owner = THIS_MODULE,
-- 
1.7.5.4
