From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] phy: tegra: xusb: Uncomment register write
Date: Wed, 14 Mar 2018 11:02:18 +0100
Message-ID: <20180314100218.5957-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: JC Kuo <jckuo@nvidia.com>, Rohith Seelaboyina <rseelaboyina@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The reason why this was originally commented out is no longer clear. The
UPHY driver for SATA works fine with or without this change. The reset
value of the XDIGCLK_EN bit is 0, so unless programmed by the bootloader
this shouldn't make a difference anyway.

Define a macro for this bit and uncomment the code. This also fixes a
coverity issue brought to my attention by Rohith because not only is the
XDIGCLK_EN field modification commented out, but also the register write
which causes none of the earlier modifications of the register value to
be written to the register and the value being overwritten.

Reported-by: Rohith Seelaboyina <rseelaboyina@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra210.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 9d0689ebd28c..05bee32a3a4d 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -169,6 +169,7 @@
 #define XUSB_PADCTL_UPHY_PLL_CTL2_CAL_EN (1 << 0)
 
 #define XUSB_PADCTL_UPHY_PLL_P0_CTL4 0x36c
+#define XUSB_PADCTL_UPHY_PLL_CTL4_XDIGCLK_EN (1 << 19)
 #define XUSB_PADCTL_UPHY_PLL_CTL4_TXCLKREF_EN (1 << 15)
 #define XUSB_PADCTL_UPHY_PLL_CTL4_TXCLKREF_SEL_SHIFT 12
 #define XUSB_PADCTL_UPHY_PLL_CTL4_TXCLKREF_SEL_MASK 0x3
@@ -537,11 +538,8 @@ static int tegra210_sata_uphy_enable(struct tegra_xusb_padctl *padctl, bool usb)
 		value |= (XUSB_PADCTL_UPHY_PLL_CTL4_TXCLKREF_SEL_SATA_VAL <<
 			  XUSB_PADCTL_UPHY_PLL_CTL4_TXCLKREF_SEL_SHIFT);
 
-	/* XXX PLL0_XDIGCLK_EN */
-	/*
-	value &= ~(1 << 19);
+	value &= ~XUSB_PADCTL_UPHY_PLL_CTL4_XDIGCLK_EN;
 	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_PLL_S0_CTL4);
-	*/
 
 	value = padctl_readl(padctl, XUSB_PADCTL_UPHY_PLL_S0_CTL1);
 	value &= ~((XUSB_PADCTL_UPHY_PLL_CTL1_FREQ_MDIV_MASK <<
-- 
2.16.2
