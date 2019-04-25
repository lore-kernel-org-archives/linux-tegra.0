From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/3] phy: tegra: xusb: Add Tegra124 PLL power supplies
Date: Thu, 25 Apr 2019 17:34:43 +0200
Message-ID: <20190425153444.6281-2-thierry.reding@gmail.com>
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

The Tegra124 SoC has four inputs that consume power in order to supply
the PLLs that drive the various USB, PCI and SATA pads.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra124.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/tegra/xusb-tegra124.c b/drivers/phy/tegra/xusb-tegra124.c
index c45cbedc6634..254592c47b00 100644
--- a/drivers/phy/tegra/xusb-tegra124.c
+++ b/drivers/phy/tegra/xusb-tegra124.c
@@ -1721,6 +1721,13 @@ static const struct tegra_xusb_padctl_ops tegra124_xusb_padctl_ops = {
 	.hsic_set_idle = tegra124_hsic_set_idle,
 };
 
+static const char * const tegra124_xusb_padctl_supply_names[] = {
+	"avdd-pll-utmip",
+	"avdd-pll-erefe",
+	"avdd-pex-pll",
+	"hvdd-pex-pll-e",
+};
+
 const struct tegra_xusb_padctl_soc tegra124_xusb_padctl_soc = {
 	.num_pads = ARRAY_SIZE(tegra124_pads),
 	.pads = tegra124_pads,
@@ -1743,6 +1750,8 @@ const struct tegra_xusb_padctl_soc tegra124_xusb_padctl_soc = {
 		},
 	},
 	.ops = &tegra124_xusb_padctl_ops,
+	.supply_names = tegra124_xusb_padctl_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra124_xusb_padctl_supply_names),
 };
 EXPORT_SYMBOL_GPL(tegra124_xusb_padctl_soc);
 
-- 
2.21.0
