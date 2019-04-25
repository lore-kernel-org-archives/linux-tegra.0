From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/3] phy: tegra: xusb: Add Tegra210 PLL power supplies
Date: Thu, 25 Apr 2019 17:34:44 +0200
Message-ID: <20190425153444.6281-3-thierry.reding@gmail.com>
References: <20190425153444.6281-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425153444.6281-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra210 SoC has four inputs that consume power in order to supply
the PLLs that drive the various USB, PCI and SATA pads.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra210.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 05bee32a3a4d..eb754baa8d71 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -2017,6 +2017,13 @@ static const struct tegra_xusb_padctl_ops tegra210_xusb_padctl_ops = {
 	.hsic_set_idle = tegra210_hsic_set_idle,
 };
 
+static const char * const tegra210_xusb_padctl_supply_names[] = {
+	"avdd-pll-utmip",
+	"avdd-pll-uerefe",
+	"dvdd-pex-pll",
+	"hvdd-pex-pll-e",
+};
+
 const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc = {
 	.num_pads = ARRAY_SIZE(tegra210_pads),
 	.pads = tegra210_pads,
@@ -2035,6 +2042,8 @@ const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc = {
 		},
 	},
 	.ops = &tegra210_xusb_padctl_ops,
+	.supply_names = tegra210_xusb_padctl_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra210_xusb_padctl_supply_names),
 };
 EXPORT_SYMBOL_GPL(tegra210_xusb_padctl_soc);
 
-- 
2.21.0
