From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 15/30] pinctrl: oxnas: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:25 +0800
Message-ID: <20191017122640.22976-16-yuehaibing@huawei.com>
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
 drivers/pinctrl/pinctrl-oxnas.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-oxnas.c b/drivers/pinctrl/pinctrl-oxnas.c
index 40dc125..674b7b5 100644
--- a/drivers/pinctrl/pinctrl-oxnas.c
+++ b/drivers/pinctrl/pinctrl-oxnas.c
@@ -1196,7 +1196,6 @@ static int oxnas_gpio_probe(struct platform_device *pdev)
 	struct oxnas_gpio_bank *bank;
 	unsigned int id, ngpios;
 	int irq, ret;
-	struct resource *res;
 	struct gpio_irq_chip *girq;
 
 	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges",
@@ -1220,8 +1219,7 @@ static int oxnas_gpio_probe(struct platform_device *pdev)
 
 	bank = &oxnas_gpio_banks[id];
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	bank->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bank->reg_base))
 		return PTR_ERR(bank->reg_base);
 
-- 
2.7.4
