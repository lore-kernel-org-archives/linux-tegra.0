From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 018/102] dmaengine: tegra-apb: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:25:22 +0200
Message-ID: <20170719152646.25903-19-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Vinod Koul <vinod.koul@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/dma/tegra20-apb-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index b9d75a54c896a..3d4d0241aefed 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1330,7 +1330,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(tdma->dma_clk);
 	}
 
-	tdma->rst = devm_reset_control_get(&pdev->dev, "dma");
+	tdma->rst = devm_reset_control_get_exclusive(&pdev->dev, "dma");
 	if (IS_ERR(tdma->rst)) {
 		dev_err(&pdev->dev, "Error: Missing reset\n");
 		return PTR_ERR(tdma->rst);
-- 
2.11.0
