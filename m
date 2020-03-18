From: Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] soc/tegra: pmc: should select GENERIC_PINCONF
Date: Wed, 18 Mar 2020 15:25:08 +0000
Message-ID: <1584545108-20111-1-git-send-email-clabbe@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: avienamo@nvidia.com, jonathanh@nvidia.com, thierry.reding@gmail.com, treding@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>, stable <stable@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

I have hit the following build error:
armv7a-hardfloat-linux-gnueabi-ld: drivers/soc/tegra/pmc.o: in function `pinconf_generic_dt_node_to_map_pin':
pmc.c:(.text+0x500): undefined reference to `pinconf_generic_dt_node_to_map'
armv7a-hardfloat-linux-gnueabi-ld: drivers/soc/tegra/pmc.o:(.rodata+0x1f88): undefined reference to `pinconf_generic_dt_free_map'

So SOC_TEGRA_PMC should select GENERIC_PINCONF

Fixes: 4a37f11c8f57 ("soc/tegra: pmc: Implement pad configuration via pinctrl")
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/soc/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 3693532949b8..6bc603d0b9d9 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -133,6 +133,7 @@ config SOC_TEGRA_FLOWCTRL
 
 config SOC_TEGRA_PMC
 	bool
+	select GENERIC_PINCONF
 
 config SOC_TEGRA_POWERGATE_BPMP
 	def_bool y
-- 
2.24.1
