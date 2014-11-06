From: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Subject: [PATCH] Move reset assertions
Date: Thu,  6 Nov 2014 13:27:24 +0200
Message-ID: <1415273244-9658-1-git-send-email-mikko.perttunen@kapsi.fi>
References: <f1451de182a0439f96abf8ed9dacd272@HQMAIL103.nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f1451de182a0439f96abf8ed9dacd272-wO81nVYWzR7YuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Please test if if this patch makes any difference.

Mikko

---
 drivers/ata/ahci_tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
index 0329044..227a148 100644
--- a/drivers/ata/ahci_tegra.c
+++ b/drivers/ata/ahci_tegra.c
@@ -118,15 +118,15 @@ static int tegra_ahci_power_on(struct ahci_host_priv *hpriv)
 	if (ret)
 		return ret;
 
+	reset_control_assert(tegra->sata_oob_rst);
+	reset_control_assert(tegra->sata_cold_rst);
+
 	ret = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_SATA,
 						tegra->sata_clk,
 						tegra->sata_rst);
 	if (ret)
 		goto disable_regulators;
 
-	reset_control_assert(tegra->sata_oob_rst);
-	reset_control_assert(tegra->sata_cold_rst);
-
 	ret = ahci_platform_enable_resources(hpriv);
 	if (ret)
 		goto disable_power;
-- 
2.1.0
