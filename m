From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 25/30] pinctrl: coh901: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:35 +0800
Message-ID: <20191017122640.22976-26-yuehaibing@huawei.com>
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
 drivers/pinctrl/pinctrl-coh901.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl-coh901.c
index 063a629..2905348 100644
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ b/drivers/pinctrl/pinctrl-coh901.c
@@ -615,7 +615,6 @@ static struct coh901_pinpair coh901_pintable[] = {
 static int __init u300_gpio_probe(struct platform_device *pdev)
 {
 	struct u300_gpio *gpio;
-	struct resource *memres;
 	struct gpio_irq_chip *girq;
 	int err = 0;
 	int portno;
@@ -633,8 +632,7 @@ static int __init u300_gpio_probe(struct platform_device *pdev)
 	gpio->chip.base = 0;
 	gpio->dev = &pdev->dev;
 
-	memres = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	gpio->base = devm_ioremap_resource(&pdev->dev, memres);
+	gpio->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
-- 
2.7.4
