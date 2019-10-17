From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 10/30] pinctrl: tegra: use devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 20:26:20 +0800
Message-ID: <20191017122640.22976-11-yuehaibing@huawei.com>
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
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 4 +---
 drivers/pinctrl/tegra/pinctrl-tegra.c      | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index f2fa1f7..6f7b376 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -873,7 +873,6 @@ int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev)
 {
 	struct tegra_xusb_padctl *padctl;
 	const struct of_device_id *match;
-	struct resource *res;
 	struct phy *phy;
 	int err;
 
@@ -894,8 +893,7 @@ int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev)
 	match = of_match_node(tegra_xusb_padctl_of_match, pdev->dev.of_node);
 	padctl->soc = match->data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	padctl->regs = devm_ioremap_resource(&pdev->dev, res);
+	padctl->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(padctl->regs))
 		return PTR_ERR(padctl->regs);
 
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index e9a7cbb..692d8b3 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -781,8 +781,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 
 	for (i = 0; i < pmx->nbanks; i++) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		pmx->regs[i] = devm_ioremap_resource(&pdev->dev, res);
+		pmx->regs[i] = devm_platform_ioremap_resource(pdev, i);
 		if (IS_ERR(pmx->regs[i]))
 			return PTR_ERR(pmx->regs[i]);
 	}
-- 
2.7.4
