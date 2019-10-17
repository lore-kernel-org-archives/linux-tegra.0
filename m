From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 07/30] pinctrl: ns2: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:17 +0800
Message-ID: <20191017122640.22976-8-yuehaibing@huawei.com>
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
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 9fabc45..32f268f 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -1042,8 +1042,7 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pinctrl);
 	spin_lock_init(&pinctrl->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pinctrl->base0 = devm_ioremap_resource(&pdev->dev, res);
+	pinctrl->base0 = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pinctrl->base0))
 		return PTR_ERR(pinctrl->base0);
 
@@ -1057,8 +1056,7 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	pinctrl->pinconf_base = devm_ioremap_resource(&pdev->dev, res);
+	pinctrl->pinconf_base = devm_platform_ioremap_resource(pdev, 2);
 	if (IS_ERR(pinctrl->pinconf_base))
 		return PTR_ERR(pinctrl->pinconf_base);
 
-- 
2.7.4
