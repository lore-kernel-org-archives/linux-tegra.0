From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 18/30] pinctrl: da850-pupd: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:28 +0800
Message-ID: <20191017122640.22976-19-yuehaibing@huawei.com>
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
 drivers/pinctrl/pinctrl-da850-pupd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-da850-pupd.c b/drivers/pinctrl/pinctrl-da850-pupd.c
index d06f13a..5a0a1f2 100644
--- a/drivers/pinctrl/pinctrl-da850-pupd.c
+++ b/drivers/pinctrl/pinctrl-da850-pupd.c
@@ -146,14 +146,12 @@ static int da850_pupd_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct da850_pupd_data *data;
-	struct resource *res;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	data->base = devm_ioremap_resource(dev, res);
+	data->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->base)) {
 		dev_err(dev, "Could not map resource\n");
 		return PTR_ERR(data->base);
-- 
2.7.4
