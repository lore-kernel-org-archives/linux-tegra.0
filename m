From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH] PCI: tegra: Fix reporting GPIO error value
Date: Tue, 14 Apr 2020 12:25:12 +0200
Message-ID: <20200414102512.27506-1-pali@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Error code is stored in rp->reset_gpio and not in err variable.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 drivers/pci/controller/pci-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 0e03cef72840..378d5a8773c7 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2314,8 +2314,8 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
 			if (PTR_ERR(rp->reset_gpio) == -ENOENT) {
 				rp->reset_gpio = NULL;
 			} else {
-				dev_err(dev, "failed to get reset GPIO: %d\n",
-					err);
+				dev_err(dev, "failed to get reset GPIO: %ld\n",
+					PTR_ERR(rp->reset_gpio));
 				return PTR_ERR(rp->reset_gpio);
 			}
 		}
-- 
2.20.1
