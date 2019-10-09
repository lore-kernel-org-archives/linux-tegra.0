From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2] phy: tegra: xusb: remove unused variable
Date: Wed, 9 Oct 2019 15:23:09 +0800
Message-ID: <1570605789-5352-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Thierry Reding <treding@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>
List-Id: linux-tegra@vger.kernel.org

The local variable @priv is set but not used, can be removed

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
v2: add Acked-by: Thierry
---
 drivers/phy/tegra/xusb-tegra210.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 0c0df6897a3b..bc71c897298a 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -1225,13 +1225,10 @@ static int tegra210_hsic_phy_power_on(struct phy *phy)
 	struct tegra_xusb_hsic_lane *hsic = to_hsic_lane(lane);
 	struct tegra_xusb_hsic_pad *pad = to_hsic_pad(lane->pad);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
-	struct tegra210_xusb_padctl *priv;
 	unsigned int index = lane->index;
 	u32 value;
 	int err;
 
-	priv = to_tegra210_xusb_padctl(padctl);
-
 	err = regulator_enable(pad->supply);
 	if (err)
 		return err;
-- 
2.23.0
