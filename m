From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] soc/tegra: fix link errors with PMC disabled
Date: Mon, 20 Mar 2017 10:13:06 +0100
Message-ID: <20170320091405.1041129-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Laxman Dewangan <ldewangan@nvidia.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

With the new Tegra186 PMC driver merged, anything that relies on the previous
PMC driver fails to link when that is disabled:

arch/arm/mach-tegra/pm.o: In function `tegra_pm_set':
pm.c:(.text.tegra_pm_set+0x3c): undefined reference to `tegra_pmc_enter_suspend_mode'
arch/arm/mach-tegra/pm.o: In function `tegra_suspend_enter':
pm.c:(.text.tegra_suspend_enter+0x4): undefined reference to `tegra_pmc_get_suspend_mode'
arch/arm/mach-tegra/pm.o: In function `tegra_init_suspend':
pm.c:(.init.text+0x1c): undefined reference to `tegra_pmc_get_suspend_mode'
pm.c:(.init.text+0x74): undefined reference to `tegra_pmc_set_suspend_mode'

ERROR: tegra_powergate_sequence_power_up [drivers/ata/ahci_tegra.ko] undefined!
ERROR: tegra_powergate_power_off [drivers/ata/ahci_tegra.ko] undefined!

Making the definition depend on the presence of the driver makes it build
again, though that might not be the correct fix.

Fixes: 854014236290 ("soc/tegra: Implement Tegra186 PMC support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/soc/tegra/pmc.h | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 2f271d1b9cea..1c3982bc558f 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -26,12 +26,6 @@
 struct clk;
 struct reset_control;
 
-#ifdef CONFIG_PM_SLEEP
-enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void);
-void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode);
-void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode);
-#endif /* CONFIG_PM_SLEEP */
-
 #ifdef CONFIG_SMP
 bool tegra_pmc_cpu_is_powered(unsigned int cpuid);
 int tegra_pmc_cpu_power_on(unsigned int cpuid);
@@ -144,7 +138,7 @@ enum tegra_io_pad_voltage {
 	TEGRA_IO_PAD_3300000UV,
 };
 
-#ifdef CONFIG_ARCH_TEGRA
+#ifdef CONFIG_SOC_TEGRA_PMC
 int tegra_powergate_is_powered(unsigned int id);
 int tegra_powergate_power_on(unsigned int id);
 int tegra_powergate_power_off(unsigned int id);
@@ -163,6 +157,11 @@ int tegra_io_pad_get_voltage(enum tegra_io_pad id);
 /* deprecated, use tegra_io_pad_power_{enable,disable}() instead */
 int tegra_io_rail_power_on(unsigned int id);
 int tegra_io_rail_power_off(unsigned int id);
+
+enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void);
+void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode);
+void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode);
+
 #else
 static inline int tegra_powergate_is_powered(unsigned int id)
 {
@@ -221,6 +220,20 @@ static inline int tegra_io_rail_power_off(unsigned int id)
 {
 	return -ENOSYS;
 }
-#endif /* CONFIG_ARCH_TEGRA */
+
+static inline enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void)
+{
+	return TEGRA_SUSPEND_NONE;
+}
+
+static inline void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
+{
+}
+
+static inline void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
+{
+}
+
+#endif /* CONFIG_SOC_TEGRA_PMC */
 
 #endif /* __SOC_TEGRA_PMC_H__ */
-- 
2.9.0
