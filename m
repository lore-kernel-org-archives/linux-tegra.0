From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] phy: tegra: xusb: Remove set but not used variable 'priv'
Date: Thu, 6 Jun 2019 09:27:46 +0000
Message-ID: <20190606092746.80310-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/phy/tegra/xusb-tegra210.c: In function 'tegra210_hsic_phy_power_on':
drivers/phy/tegra/xusb-tegra210.c:1236:31: warning:
 variable 'priv' set but not used [-Wunused-but-set-variable]

It's never used, so can be removed

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/phy/tegra/xusb-tegra210.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index eb754baa8d71..4076b22c4087 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -1233,13 +1233,10 @@ static int tegra210_hsic_phy_power_on(struct phy *phy)
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
