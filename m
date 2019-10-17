From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 05/30] pinctrl: nsp-gpio: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:15 +0800
Message-ID: <20191017122640.22976-6-yuehaibing@huawei.com>
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
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index e67ae52..8db87e5 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -613,7 +613,6 @@ static const struct of_device_id nsp_gpio_of_match[] = {
 static int nsp_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct nsp_gpio *chip;
 	struct gpio_chip *gc;
 	u32 val, count;
@@ -631,15 +630,13 @@ static int nsp_gpio_probe(struct platform_device *pdev)
 	chip->dev = dev;
 	platform_set_drvdata(pdev, chip);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	chip->base = devm_ioremap_resource(dev, res);
+	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base)) {
 		dev_err(dev, "unable to map I/O memory\n");
 		return PTR_ERR(chip->base);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	chip->io_ctrl = devm_ioremap_resource(dev, res);
+	chip->io_ctrl = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(chip->io_ctrl)) {
 		dev_err(dev, "unable to map I/O memory\n");
 		return PTR_ERR(chip->io_ctrl);
-- 
2.7.4
