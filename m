From: Bhadram Varka <vbhadram@nvidia.com>
Subject: [PATCH v2 1/2] net: phy: broadcom: add support for BCM89610 PHY
Date: Wed, 2 May 2018 20:43:58 +0530
Message-ID: <1525274038-13217-1-git-send-email-vbhadram@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: andrew@lunn.ch, f.fainelli@gmail.com
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

It adds support for BCM89610 (Single-Port 10/100/1000BASE-T)
transceiver which is used in P3310 Tegra186 platform.

Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>
---
 drivers/net/phy/broadcom.c | 10 ++++++++++
 include/linux/brcmphy.h    |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
index 3bb6b66..f9c2591 100644
--- a/drivers/net/phy/broadcom.c
+++ b/drivers/net/phy/broadcom.c
@@ -720,6 +720,15 @@ static struct phy_driver broadcom_drivers[] = {
 	.get_strings	= bcm_phy_get_strings,
 	.get_stats	= bcm53xx_phy_get_stats,
 	.probe		= bcm53xx_phy_probe,
+}, {
+	.phy_id         = PHY_ID_BCM89610,
+	.phy_id_mask    = 0xfffffff0,
+	.name           = "Broadcom BCM89610",
+	.features       = PHY_GBIT_FEATURES,
+	.flags          = PHY_HAS_INTERRUPT,
+	.config_init    = bcm54xx_config_init,
+	.ack_interrupt  = bcm_phy_ack_intr,
+	.config_intr    = bcm_phy_config_intr,
 } };
 
 module_phy_driver(broadcom_drivers);
@@ -741,6 +750,7 @@ static struct mdio_device_id __maybe_unused broadcom_tbl[] = {
 	{ PHY_ID_BCMAC131, 0xfffffff0 },
 	{ PHY_ID_BCM5241, 0xfffffff0 },
 	{ PHY_ID_BCM5395, 0xfffffff0 },
+	{ PHY_ID_BCM89610, 0xfffffff0 },
 	{ }
 };
 
diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
index d3339dd..b324e01 100644
--- a/include/linux/brcmphy.h
+++ b/include/linux/brcmphy.h
@@ -25,6 +25,7 @@
 #define PHY_ID_BCM54612E		0x03625e60
 #define PHY_ID_BCM54616S		0x03625d10
 #define PHY_ID_BCM57780			0x03625d90
+#define PHY_ID_BCM89610			0x03625cd0
 
 #define PHY_ID_BCM7250			0xae025280
 #define PHY_ID_BCM7260			0xae025190
-- 
2.7.4
