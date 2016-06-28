From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 2/3] soc/tegra: pmc: Enable XUSB partitions on boot
Date: Tue, 28 Jun 2016 12:20:43 +0100
Message-ID: <1467112844-26927-3-git-send-email-jonathanh@nvidia.com>
References: <1467112844-26927-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467112844-26927-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra XHCI driver does not currently manage the Tegra XUSB power
partitions and so it these partitions have not been enabled by the
bootloader then the system will crash when probing the XHCI device.

While proper support for managing the power partitions is being
developed to the XHCI driver for Tegra, for now power on all the XUSB
partitions for USB host and super-speed on boot if the XHCI driver is
enabled.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 64678ff2173e..afaa5891c8f5 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -822,6 +822,18 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
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
 
 	if (of_genpd_add_provider_simple(np, &pg->genpd))
-- 
2.1.4
