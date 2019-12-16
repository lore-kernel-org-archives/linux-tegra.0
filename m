From: David Engraf <david.engraf@sysgo.com>
Subject: [PATCH] PCI: tegra: Correctly handle return code of pm_runtime_get_sync()
Date: Mon, 16 Dec 2019 10:34:15 +0100
Message-ID: <20191216093415.27320-1-david.engraf@sysgo.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, lorenzo.pieralisi@arm.com, andrew.murray@arm.com, bhelgaas@google.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, David Engraf <david.engraf@sysgo.com>
List-Id: linux-tegra@vger.kernel.org

pm_runtime_get_sync() returns the device's usage counter. This might
be >0 if the device is already powered up or CONFIG_PM is disabled.

Abort probe function on real error only.

Signed-off-by: David Engraf <david.engraf@sysgo.com>
---
 drivers/pci/controller/pci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 673a1725ef38..090b632965e2 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2798,7 +2798,7 @@ static int tegra_pcie_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(pcie->dev);
 	err = pm_runtime_get_sync(pcie->dev);
-	if (err) {
+	if (err < 0) {
 		dev_err(dev, "fail to enable pcie controller: %d\n", err);
 		goto teardown_msi;
 	}
-- 
2.17.1
