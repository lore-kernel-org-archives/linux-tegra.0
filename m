From: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] pinctrl: tegra: Convert to devm_ioremap_resource
Date: Tue, 27 Aug 2013 09:07:23 +0800
Message-ID: <1377565643.17552.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Using the new devm_ioremap_resource() we can greatly simplify resource handling.

Signed-off-by: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
---
v2: add commit log.

 drivers/pinctrl/pinctrl-tegra.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c
index 637bcd3..be7e900 100644
--- a/drivers/pinctrl/pinctrl-tegra.c
+++ b/drivers/pinctrl/pinctrl-tegra.c
@@ -643,25 +643,9 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 
 	for (i = 0; i < pmx->nbanks; i++) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		if (!res) {
-			dev_err(&pdev->dev, "Missing MEM resource\n");
-			return -ENODEV;
-		}
-
-		if (!devm_request_mem_region(&pdev->dev, res->start,
-					    resource_size(res),
-					    dev_name(&pdev->dev))) {
-			dev_err(&pdev->dev,
-				"Couldn't request MEM resource %d\n", i);
-			return -ENODEV;
-		}
-
-		pmx->regs[i] = devm_ioremap(&pdev->dev, res->start,
-					    resource_size(res));
-		if (!pmx->regs[i]) {
-			dev_err(&pdev->dev, "Couldn't ioremap regs %d\n", i);
-			return -ENODEV;
-		}
+		pmx->regs[i] = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(pmx->regs[i]))
+			return PTR_ERR(pmx->regs[i]);
 	}
 
 	pmx->pctl = pinctrl_register(&tegra_pinctrl_desc, &pdev->dev, pmx);
-- 
1.8.1.2
