From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH] soc: tegra: fix tegra_pmc_get_suspend_mode definition
Date: Wed,  8 Apr 2020 21:01:15 +0200
Message-ID: <20200408190127.587768-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

When CONFIG_PM_SLEEP is disabled, the function is not defined,
causing a link failure:

arm-linux-gnueabi-ld: drivers/cpuidle/cpuidle-tegra.o: in function `tegra_cpuidle_probe':
cpuidle-tegra.c:(.text+0x24): undefined reference to `tegra_pmc_get_suspend_mode'

Change the #ifdef check according to the definition.

Fixes: 382ac8e22b90 ("cpuidle: tegra: Disable CC6 state if LP2 unavailable")
Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 include/soc/tegra/pmc.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 0dd52b0a5c1b..361cb64246f7 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -168,7 +168,6 @@ int tegra_io_pad_power_disable(enum tegra_io_pad id);
 int tegra_io_rail_power_on(unsigned int id);
 int tegra_io_rail_power_off(unsigned int id);
 
-enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void);
 void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode);
 void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode);
 
@@ -220,11 +219,6 @@ static inline int tegra_io_rail_power_off(unsigned int id)
 	return -ENOSYS;
 }
 
-static inline enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void)
-{
-	return TEGRA_SUSPEND_NONE;
-}
-
 static inline void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
 {
 }
@@ -235,4 +229,13 @@ static inline void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 
 #endif /* CONFIG_SOC_TEGRA_PMC */
 
+#if defined(CONFIG_SOC_TEGRA_PMC) && defined(CONFIG_PM_SLEEP)
+enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void);
+#else
+static inline enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void)
+{
+	return TEGRA_SUSPEND_NONE;
+}
+#endif
+
 #endif /* __SOC_TEGRA_PMC_H__ */
-- 
2.26.0
