From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 12/30] pinctrl: spear: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:22 +0800
Message-ID: <20191017122640.22976-13-yuehaibing@huawei.com>
References: <20191017122640.22976-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191017122640.22976-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, manivannan.sadhasivam@linaro.org, afaerber@suse.de, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, jesper.nilsson@axis.com, lars.persson@axis.com, ludovic.desroches@microchip.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, baruch@tkos.co.il
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, vz@mleia.com, narmstrong@baylibre.com, geert+renesas@glider.be, daniel@zonque.org, haojian.zhuang@gmail.com, wens@csie.org, thierry.reding@gmail.com, jonathanh@nvidia.com, agross@kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/spear/pinctrl-plgpio.c | 4 +---
 drivers/pinctrl/spear/pinctrl-spear.c  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index c4c9a29..1ebbc49 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -515,15 +515,13 @@ static int plgpio_probe_dt(struct platform_device *pdev, struct plgpio *plgpio)
 static int plgpio_probe(struct platform_device *pdev)
 {
 	struct plgpio *plgpio;
-	struct resource *res;
 	int ret, irq;
 
 	plgpio = devm_kzalloc(&pdev->dev, sizeof(*plgpio), GFP_KERNEL);
 	if (!plgpio)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	plgpio->base = devm_ioremap_resource(&pdev->dev, res);
+	plgpio->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(plgpio->base))
 		return PTR_ERR(plgpio->base);
 
diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
index 7ec19c7..948f56a 100644
--- a/drivers/pinctrl/spear/pinctrl-spear.c
+++ b/drivers/pinctrl/spear/pinctrl-spear.c
@@ -358,7 +358,6 @@ int spear_pinctrl_probe(struct platform_device *pdev,
 			struct spear_pinctrl_machdata *machdata)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct resource *res;
 	struct spear_pmx *pmx;
 
 	if (!machdata)
@@ -368,8 +367,7 @@ int spear_pinctrl_probe(struct platform_device *pdev,
 	if (!pmx)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pmx->vbase = devm_ioremap_resource(&pdev->dev, res);
+	pmx->vbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pmx->vbase))
 		return PTR_ERR(pmx->vbase);
 
-- 
2.7.4
