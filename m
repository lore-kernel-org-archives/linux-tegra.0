From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 19/30] pinctrl: tb10x: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:29 +0800
Message-ID: <20191017122640.22976-20-yuehaibing@huawei.com>
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
 drivers/pinctrl/pinctrl-tb10x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 1f64e2e..ab49bd7 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -747,7 +747,6 @@ static struct pinctrl_desc tb10x_pindesc = {
 static int tb10x_pinctrl_probe(struct platform_device *pdev)
 {
 	int ret = -EINVAL;
-	struct resource *mem;
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = dev->of_node;
 	struct device_node *child;
@@ -768,8 +767,7 @@ static int tb10x_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, state);
 	mutex_init(&state->mutex);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	state->base = devm_ioremap_resource(dev, mem);
+	state->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(state->base)) {
 		ret = PTR_ERR(state->base);
 		goto fail;
-- 
2.7.4
