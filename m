From: Yue Haibing <yuehaibing@huawei.com>
Subject: [PATCH -next] phy: tegra: xusb: Make two functions static
Date: Tue, 19 Mar 2019 23:32:19 +0800
Message-ID: <20190319153219.4196-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jckuo@nvidia.com, kishon@ti.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>

Fix sparse warning:

drivers/phy/tegra/xusb-tegra186.c:250:6: warning: symbol 'tegra_phy_xusb_utmi_pad_power_on' was not declared. Should it be static?
drivers/phy/tegra/xusb-tegra186.c:281:6: warning: symbol 'tegra_phy_xusb_utmi_pad_power_down' was not declared. Should it be static?

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/phy/tegra/xusb-tegra186.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 11ad6e4..7a308b4 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -247,7 +247,7 @@ static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
 	mutex_unlock(&padctl->lock);
 }
 
-void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy)
+static void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
@@ -278,7 +278,7 @@ void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy)
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
 }
 
-void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
+static void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
-- 
2.7.4
