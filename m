From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 063/102] phy: tegra: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:26:07 +0200
Message-ID: <20170719152646.25903-64-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Kishon Vijay Abraham I <kishon@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/phy/tegra/xusb-tegra210.c | 4 ++--
 drivers/phy/tegra/xusb.c          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 9d0689ebd28c6..9a9ea17218900 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -1557,7 +1557,7 @@ tegra210_pcie_pad_probe(struct tegra_xusb_padctl *padctl,
 		goto unregister;
 	}
 
-	pcie->rst = devm_reset_control_get(&pad->dev, "phy");
+	pcie->rst = devm_reset_control_get_exclusive(&pad->dev, "phy");
 	if (IS_ERR(pcie->rst)) {
 		err = PTR_ERR(pcie->rst);
 		dev_err(&pad->dev, "failed to get PCIe pad reset: %d\n", err);
@@ -1721,7 +1721,7 @@ tegra210_sata_pad_probe(struct tegra_xusb_padctl *padctl,
 		goto out;
 	}
 
-	sata->rst = devm_reset_control_get(&pad->dev, "phy");
+	sata->rst = devm_reset_control_get_exclusive(&pad->dev, "phy");
 	if (IS_ERR(sata->rst)) {
 		err = PTR_ERR(sata->rst);
 		dev_err(&pad->dev, "failed to get SATA pad reset: %d\n", err);
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 3cbcb25376576..3b729fa27cf35 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -881,7 +881,7 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	padctl->rst = devm_reset_control_get(&pdev->dev, NULL);
+	padctl->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(padctl->rst)) {
 		err = PTR_ERR(padctl->rst);
 		goto remove;
-- 
2.11.0
