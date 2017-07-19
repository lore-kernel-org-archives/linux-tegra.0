From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 068/102] pinctrl: tegra: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:26:12 +0200
Message-ID: <20170719152646.25903-69-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index ebedc2d324115..9d653c24219cb 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -901,7 +901,7 @@ int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev)
 	if (IS_ERR(padctl->regs))
 		return PTR_ERR(padctl->regs);
 
-	padctl->rst = devm_reset_control_get(&pdev->dev, NULL);
+	padctl->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(padctl->rst))
 		return PTR_ERR(padctl->rst);
 
-- 
2.11.0
