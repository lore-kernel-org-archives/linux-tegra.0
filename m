From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 11/30] pinctrl: msm: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:21 +0800
Message-ID: <20191017122640.22976-12-yuehaibing@huawei.com>
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
 drivers/pinctrl/qcom/pinctrl-msm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 763da0b..62fcae9 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1150,8 +1150,7 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 				return PTR_ERR(pctrl->regs[i]);
 		}
 	} else {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		pctrl->regs[0] = devm_ioremap_resource(&pdev->dev, res);
+		pctrl->regs[0] = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(pctrl->regs[0]))
 			return PTR_ERR(pctrl->regs[0]);
 	}
-- 
2.7.4
