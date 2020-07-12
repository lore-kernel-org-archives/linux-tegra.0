From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] memory: tegra: Fix KCONFIG variables for Tegra186 and Tegra194
Date: Sun, 12 Jul 2020 11:33:47 +0100
Message-ID: <20200712103347.25070-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit a127e690b051 ("memory: tegra: Add support for the Tegra194 memory
controller") and commit 4e04b88633ae ("memory: tegra: Only include
support for enabled SoCs") incorrectly added the KCONFIG variables
CONFIG_ARCH_TEGRA186_SOC and CONFIG_ARCH_TEGRA194_SOC to the Tegra EMC
driver. These KCONFIG variables do not exist and prevent the EMC driver
from being probed on Tegra186 and Tegra194. These KCONFIG variable
names are simply missing one underscore and so fix this by adding the
necessary underscore to the variable names.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/memory/tegra/tegra186-emc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 9333ebe4c918..1d0a12164fe7 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -268,10 +268,10 @@ static int tegra186_emc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra186_emc_of_match[] = {
-#if defined(CONFIG_ARCH_TEGRA186_SOC)
+#if defined(CONFIG_ARCH_TEGRA_186_SOC)
 	{ .compatible = "nvidia,tegra186-emc" },
 #endif
-#if defined(CONFIG_ARCH_TEGRA194_SOC)
+#if defined(CONFIG_ARCH_TEGRA_194_SOC)
 	{ .compatible = "nvidia,tegra194-emc" },
 #endif
 	{ /* sentinel */ }
-- 
2.17.1
