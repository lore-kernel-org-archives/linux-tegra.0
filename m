From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 20/30] pinctrl: u300: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:30 +0800
Message-ID: <20191017122640.22976-21-yuehaibing@huawei.com>
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
 drivers/pinctrl/pinctrl-u300.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-u300.c b/drivers/pinctrl/pinctrl-u300.c
index 348423b..cc30644 100644
--- a/drivers/pinctrl/pinctrl-u300.c
+++ b/drivers/pinctrl/pinctrl-u300.c
@@ -1055,7 +1055,6 @@ static struct pinctrl_desc u300_pmx_desc = {
 static int u300_pmx_probe(struct platform_device *pdev)
 {
 	struct u300_pmx *upmx;
-	struct resource *res;
 
 	/* Create state holders etc for this driver */
 	upmx = devm_kzalloc(&pdev->dev, sizeof(*upmx), GFP_KERNEL);
@@ -1064,8 +1063,7 @@ static int u300_pmx_probe(struct platform_device *pdev)
 
 	upmx->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	upmx->virtbase = devm_ioremap_resource(&pdev->dev, res);
+	upmx->virtbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(upmx->virtbase))
 		return PTR_ERR(upmx->virtbase);
 
-- 
2.7.4
