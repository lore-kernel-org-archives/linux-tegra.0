From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] PCI: tegra: Fix license string
Date: Fri, 11 Jul 2014 08:58:58 +0200
Message-ID: <1405061938-2191-2-git-send-email-thierry.reding@gmail.com>
References: <1405061938-2191-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1405061938-2191-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Stephen Warren <swarren@wwwdotorg.org>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The proper MODULE_LICENSE() string for the GPL v2 is "GPL v2", not
"GPLv2".

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pci/host/pci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 7df5aaf58921..14ec5b2c69e0 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -1742,4 +1742,4 @@ module_platform_driver(tegra_pcie_driver);
 
 MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra PCIe driver");
-MODULE_LICENSE("GPLv2");
+MODULE_LICENSE("GPL v2");
-- 
2.0.1
