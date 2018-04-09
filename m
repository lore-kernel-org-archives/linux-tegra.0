From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 06/15] memory: tegra: Setup interrupts mask before requesting IRQ
Date: Mon,  9 Apr 2018 22:28:28 +0300
Message-ID: <dd3f80ce5a74c04b170303bceb4e0682de145678.1523301400.git.digetx@gmail.com>
References: <cover.1523301400.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1523301400.git.digetx@gmail.com>
In-Reply-To: <cover.1523301400.git.digetx@gmail.com>
References: <cover.1523301400.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This avoids unwanted interrupt during MC driver probe.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/mc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index d2005b995821..e55b9733bd83 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -407,14 +407,6 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		return mc->irq;
 	}
 
-	err = devm_request_irq(&pdev->dev, mc->irq, tegra_mc_irq, IRQF_SHARED,
-			       dev_name(&pdev->dev), mc);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", mc->irq,
-			err);
-		return err;
-	}
-
 	WARN(!mc->soc->client_id_mask, "Missing client ID mask for this SoC\n");
 
 	value = MC_INT_DECERR_MTS | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
@@ -423,6 +415,14 @@ static int tegra_mc_probe(struct platform_device *pdev)
 
 	mc_writel(mc, value, MC_INTMASK);
 
+	err = devm_request_irq(&pdev->dev, mc->irq, tegra_mc_irq, IRQF_SHARED,
+			       dev_name(&pdev->dev), mc);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", mc->irq,
+			err);
+		return err;
+	}
+
 	return 0;
 }
 
-- 
2.16.3
