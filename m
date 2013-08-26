From: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] pinctrl: tz1090: Convert to devm_ioremap_resource
Date: Mon, 26 Aug 2013 10:21:44 +0800
Message-ID: <1377483704.15374.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/pinctrl-tz1090.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tz1090.c b/drivers/pinctrl/pinctrl-tz1090.c
index 4edae08..72d9552 100644
--- a/drivers/pinctrl/pinctrl-tz1090.c
+++ b/drivers/pinctrl/pinctrl-tz1090.c
@@ -1996,25 +1996,9 @@ static int tz1090_pinctrl_probe(struct platform_device *pdev)
 	tz1090_pinctrl_desc.npins = ARRAY_SIZE(tz1090_pins);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Missing MEM resource\n");
-		return -ENODEV;
-	}
-
-	if (!devm_request_mem_region(&pdev->dev, res->start,
-				     resource_size(res),
-				     dev_name(&pdev->dev))) {
-		dev_err(&pdev->dev,
-			"Couldn't request MEM resource\n");
-		return -ENODEV;
-	}
-
-	pmx->regs = devm_ioremap(&pdev->dev, res->start,
-				 resource_size(res));
-	if (!pmx->regs) {
-		dev_err(&pdev->dev, "Couldn't ioremap regs\n");
-		return -ENODEV;
-	}
+	pmx->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(pmx->regs))
+		return PTR_ERR(pmx->regs);
 
 	pmx->pctl = pinctrl_register(&tz1090_pinctrl_desc, &pdev->dev, pmx);
 	if (!pmx->pctl) {
-- 
1.8.1.2
