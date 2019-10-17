From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 08/30] pinctrl: bcm281xx: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:18 +0800
Message-ID: <20191017122640.22976-9-yuehaibing@huawei.com>
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
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index bc3b232..f690fc5 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -1400,12 +1400,10 @@ static struct pinctrl_desc bcm281xx_pinctrl_desc = {
 static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 {
 	struct bcm281xx_pinctrl_data *pdata = &bcm281xx_pinctrl;
-	struct resource *res;
 	struct pinctrl_dev *pctl;
 
 	/* So far We can assume there is only 1 bank of registers */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pdata->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	pdata->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pdata->reg_base)) {
 		dev_err(&pdev->dev, "Failed to ioremap MEM resource\n");
 		return -ENODEV;
-- 
2.7.4
