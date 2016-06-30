From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/4] soc/tegra: pmc: Enable XUSB partitions on boot
Date: Thu, 30 Jun 2016 11:56:26 +0100
Message-ID: <1467284187-13320-4-git-send-email-jonathanh@nvidia.com>
References: <1467284187-13320-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467284187-13320-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra XHCI driver does not currently manage the Tegra XUSB power
partitions and so it these partitions have not been enabled by the
bootloader then the system will crash when probing the XHCI device.

While proper support for managing the power partitions is being
developed to the XHCI driver for Tegra, for now power on all the XUSB
partitions for USB host and super-speed on boot if the XHCI driver is
enabled.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index dd36ad974c67..7d72eef92b9b 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -828,6 +828,18 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	if (!IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS))
 		goto power_on_cleanup;
 
+	/*
+	 * FIXME: If XHCI is enabled for Tegra, then power-up the XUSB
+	 * host and super-speed partitions. Once the XHCI driver
+	 * manages the partitions itself this code can be removed. Note
+	 * that we don't register these partitions with the genpd core
+	 * to avoid it from powering down the partitions as they appear
+	 * to be unused.
+	 */
+	if (IS_ENABLED(CONFIG_USB_XHCI_TEGRA) &&
+	    (id == TEGRA_POWERGATE_XUSBA || id == TEGRA_POWERGATE_XUSBC))
+		goto power_on_cleanup;
+
 	pm_genpd_init(&pg->genpd, NULL, off);
 
 	if (of_genpd_add_provider_simple(np, &pg->genpd)) {
-- 
2.1.4
