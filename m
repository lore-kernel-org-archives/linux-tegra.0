From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 24/30] pinctrl: digicolor: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:34 +0800
Message-ID: <20191017122640.22976-25-yuehaibing@huawei.com>
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
 drivers/pinctrl/pinctrl-digicolor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinctrl-digicolor.c
index 7e1ceee..ff702cf 100644
--- a/drivers/pinctrl/pinctrl-digicolor.c
+++ b/drivers/pinctrl/pinctrl-digicolor.c
@@ -270,7 +270,6 @@ static int dc_gpiochip_add(struct dc_pinmap *pmap, struct device_node *np)
 static int dc_pinctrl_probe(struct platform_device *pdev)
 {
 	struct dc_pinmap *pmap;
-	struct resource *r;
 	struct pinctrl_pin_desc *pins;
 	struct pinctrl_desc *pctl_desc;
 	char *pin_names;
@@ -281,8 +280,7 @@ static int dc_pinctrl_probe(struct platform_device *pdev)
 	if (!pmap)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pmap->regs = devm_ioremap_resource(&pdev->dev, r);
+	pmap->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pmap->regs))
 		return PTR_ERR(pmap->regs);
 
-- 
2.7.4
