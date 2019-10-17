From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 28/30] pinctrl: actions: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:38 +0800
Message-ID: <20191017122640.22976-29-yuehaibing@huawei.com>
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
 drivers/pinctrl/actions/pinctrl-owl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index 5dfe718..5a0c8e8 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -915,7 +915,6 @@ static int owl_gpio_init(struct owl_pinctrl *pctrl)
 int owl_pinctrl_probe(struct platform_device *pdev,
 				struct owl_pinctrl_soc_data *soc_data)
 {
-	struct resource *res;
 	struct owl_pinctrl *pctrl;
 	int ret, i;
 
@@ -923,8 +922,7 @@ int owl_pinctrl_probe(struct platform_device *pdev,
 	if (!pctrl)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pctrl->base = devm_ioremap_resource(&pdev->dev, res);
+	pctrl->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pctrl->base))
 		return PTR_ERR(pctrl->base);
 
-- 
2.7.4
