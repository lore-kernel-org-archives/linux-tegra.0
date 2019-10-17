From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 13/30] pinctrl: zte: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:23 +0800
Message-ID: <20191017122640.22976-14-yuehaibing@huawei.com>
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
 drivers/pinctrl/zte/pinctrl-zx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/zte/pinctrl-zx.c b/drivers/pinctrl/zte/pinctrl-zx.c
index 9512045..786bf89 100644
--- a/drivers/pinctrl/zte/pinctrl-zx.c
+++ b/drivers/pinctrl/zte/pinctrl-zx.c
@@ -387,7 +387,6 @@ int zx_pinctrl_init(struct platform_device *pdev,
 	struct pinctrl_desc *pctldesc;
 	struct zx_pinctrl *zpctl;
 	struct device_node *np;
-	struct resource *res;
 	int ret;
 
 	zpctl = devm_kzalloc(&pdev->dev, sizeof(*zpctl), GFP_KERNEL);
@@ -396,8 +395,7 @@ int zx_pinctrl_init(struct platform_device *pdev,
 
 	spin_lock_init(&zpctl->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	zpctl->base = devm_ioremap_resource(&pdev->dev, res);
+	zpctl->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(zpctl->base))
 		return PTR_ERR(zpctl->base);
 
-- 
2.7.4
