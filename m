From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 9/9] ata: ahci_tegra: remove power sequence from driver
Date: Wed, 14 Jan 2015 14:19:32 +0800
Message-ID: <1421216372-8025-10-git-send-email-vinceh@nvidia.com>
References: <1421216372-8025-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421216372-8025-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

We have the generic PM domain support for Tegra SoCs now. So remove the
duplicated sequence here.

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/ata/ahci_tegra.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
index 032904402c95..8db4aebcda4e 100644
--- a/drivers/ata/ahci_tegra.c
+++ b/drivers/ata/ahci_tegra.c
@@ -118,12 +118,6 @@ static int tegra_ahci_power_on(struct ahci_host_priv *hpriv)
 	if (ret)
 		return ret;
 
-	ret = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_SATA,
-						tegra->sata_clk,
-						tegra->sata_rst);
-	if (ret)
-		goto disable_regulators;
-
 	reset_control_assert(tegra->sata_oob_rst);
 	reset_control_assert(tegra->sata_cold_rst);
 
@@ -138,10 +132,6 @@ static int tegra_ahci_power_on(struct ahci_host_priv *hpriv)
 
 disable_power:
 	clk_disable_unprepare(tegra->sata_clk);
-
-	tegra_powergate_power_off(TEGRA_POWERGATE_SATA);
-
-disable_regulators:
 	regulator_bulk_disable(ARRAY_SIZE(tegra->supplies), tegra->supplies);
 
 	return ret;
@@ -158,7 +148,6 @@ static void tegra_ahci_power_off(struct ahci_host_priv *hpriv)
 	reset_control_assert(tegra->sata_cold_rst);
 
 	clk_disable_unprepare(tegra->sata_clk);
-	tegra_powergate_power_off(TEGRA_POWERGATE_SATA);
 
 	regulator_bulk_disable(ARRAY_SIZE(tegra->supplies), tegra->supplies);
 }
-- 
1.9.1
