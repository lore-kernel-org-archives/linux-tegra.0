From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 03/30] pinctrl: cygnus-mux: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:13 +0800
Message-ID: <20191017122640.22976-4-yuehaibing@huawei.com>
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
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
index dcab220..4344c57 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
@@ -940,7 +940,6 @@ static int cygnus_mux_log_init(struct cygnus_pinctrl *pinctrl)
 static int cygnus_pinmux_probe(struct platform_device *pdev)
 {
 	struct cygnus_pinctrl *pinctrl;
-	struct resource *res;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
 	unsigned num_pins = ARRAY_SIZE(cygnus_pins);
@@ -953,15 +952,13 @@ static int cygnus_pinmux_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pinctrl);
 	spin_lock_init(&pinctrl->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pinctrl->base0 = devm_ioremap_resource(&pdev->dev, res);
+	pinctrl->base0 = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pinctrl->base0)) {
 		dev_err(&pdev->dev, "unable to map I/O space\n");
 		return PTR_ERR(pinctrl->base0);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	pinctrl->base1 = devm_ioremap_resource(&pdev->dev, res);
+	pinctrl->base1 = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(pinctrl->base1)) {
 		dev_err(&pdev->dev, "unable to map I/O space\n");
 		return PTR_ERR(pinctrl->base1);
-- 
2.7.4
