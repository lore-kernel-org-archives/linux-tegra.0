From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 008/102] bus: tegra-gmi: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:25:12 +0200
Message-ID: <20170719152646.25903-9-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/bus/tegra-gmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/tegra-gmi.c b/drivers/bus/tegra-gmi.c
index a6570789f7afe..36b1a17014425 100644
--- a/drivers/bus/tegra-gmi.c
+++ b/drivers/bus/tegra-gmi.c
@@ -226,7 +226,7 @@ static int tegra_gmi_probe(struct platform_device *pdev)
 		return PTR_ERR(gmi->clk);
 	}
 
-	gmi->rst = devm_reset_control_get(dev, "gmi");
+	gmi->rst = devm_reset_control_get_exclusive(dev, "gmi");
 	if (IS_ERR(gmi->rst)) {
 		dev_err(dev, "can not get reset\n");
 		return PTR_ERR(gmi->rst);
-- 
2.11.0
