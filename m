From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 4/5] soc/tegra: pmc: Don't power-up XUSB power-domains
Date: Fri, 28 Sep 2018 15:11:49 +0100
Message-ID: <1538143910-24400-5-git-send-email-jonathanh@nvidia.com>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Now that the Tegra xHCI driver manages the XUSB power-domains itself,
remove the code to power-up the power-domains used by the xHCI device
from the PMC driver on boot.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index ab719fa90150..a68b4476b4ee 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -847,22 +847,6 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 		goto remove_resets;
 	}
 
-	/*
-	 * FIXME: If XHCI is enabled for Tegra, then power-up the XUSB
-	 * host and super-speed partitions. Once the XHCI driver
-	 * manages the partitions itself this code can be removed. Note
-	 * that we don't register these partitions with the genpd core
-	 * to avoid it from powering down the partitions as they appear
-	 * to be unused.
-	 */
-	if (IS_ENABLED(CONFIG_USB_XHCI_TEGRA) &&
-	    (id == TEGRA_POWERGATE_XUSBA || id == TEGRA_POWERGATE_XUSBC)) {
-		if (off)
-			WARN_ON(tegra_powergate_power_up(pg, true));
-
-		goto remove_resets;
-	}
-
 	err = pm_genpd_init(&pg->genpd, NULL, off);
 	if (err < 0) {
 		pr_err("failed to initialise PM domain %s: %d\n", np->name,
-- 
2.7.4
