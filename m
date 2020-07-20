From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V5 6/7] phy: tegra: xusb: Enable charger detect for Tegra186
Date: Mon, 20 Jul 2020 15:25:47 +0530
Message-ID: <1595238948-20531-7-git-send-email-nkristam@nvidia.com>
References: <1595238948-20531-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1595238948-20531-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, kishon@ti.com
Cc: thierry.reding@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra186 SoC supports charger detect, set corresponding soc flag.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V4-V5:
 - No changes
---
V3:
 - Used supports_charger_detect name instead of charger_detect.
 - Added Acked-by updates to commit message.
---
V2:
 - Patch re-based.
---
 drivers/phy/tegra/xusb-tegra186.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 59b78a7..da61721 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -1041,6 +1041,7 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
 	.ops = &tegra186_xusb_padctl_ops,
 	.supply_names = tegra186_xusb_padctl_supply_names,
 	.num_supplies = ARRAY_SIZE(tegra186_xusb_padctl_supply_names),
+	.supports_charger_detect = true,
 };
 EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
 #endif
-- 
2.7.4
