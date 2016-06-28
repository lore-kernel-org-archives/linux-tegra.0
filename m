From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/6] soc/tegra: pmc: Fix early initialisation of PMC
Date: Tue, 28 Jun 2016 11:38:24 +0100
Message-ID: <1467110308-22126-3-git-send-email-jonathanh@nvidia.com>
References: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467110308-22126-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

During early initialisation, the available power partitions for a given
device is configured as well as the polarity of the PMC interrupt. Both
of which should only be configured if there is a valid device node for
the PMC device. This is because the soc data used for configuring the
power partitions is only available if a device node for the PMC is found
and the code to configure the interrupt polarity uses the device node
pointer directly.

Some early device-tree images may not have this device node and so fix
this by ensuring the device node pointer is valid when configuring these
items.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 52a9e9703668..2e031c4ad547 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1550,27 +1550,29 @@ static int __init tegra_pmc_early_init(void)
 		return -ENXIO;
 	}
 
-	/* Create a bit-map of the available and valid partitions */
-	for (i = 0; i < pmc->soc->num_powergates; i++)
-		if (pmc->soc->powergates[i])
-			set_bit(i, pmc->powergates_available);
-
 	mutex_init(&pmc->powergates_lock);
 
-	/*
-	 * Invert the interrupt polarity if a PMC device tree node exists and
-	 * contains the nvidia,invert-interrupt property.
-	 */
-	invert = of_property_read_bool(np, "nvidia,invert-interrupt");
+	if (np) {
+		/* Create a bit-map of the available and valid partitions */
+		for (i = 0; i < pmc->soc->num_powergates; i++)
+			if (pmc->soc->powergates[i])
+				set_bit(i, pmc->powergates_available);
 
-	value = tegra_pmc_readl(PMC_CNTRL);
+		/*
+		 * Invert the interrupt polarity if a PMC device tree node
+		 * exists and contains the nvidia,invert-interrupt property.
+		 */
+		invert = of_property_read_bool(np, "nvidia,invert-interrupt");
 
-	if (invert)
-		value |= PMC_CNTRL_INTR_POLARITY;
-	else
-		value &= ~PMC_CNTRL_INTR_POLARITY;
+		value = tegra_pmc_readl(PMC_CNTRL);
 
-	tegra_pmc_writel(value, PMC_CNTRL);
+		if (invert)
+			value |= PMC_CNTRL_INTR_POLARITY;
+		else
+			value &= ~PMC_CNTRL_INTR_POLARITY;
+
+		tegra_pmc_writel(value, PMC_CNTRL);
+	}
 
 	return 0;
 }
-- 
2.1.4
