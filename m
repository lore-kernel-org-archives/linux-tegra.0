From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v11 02/17] ARM: tegra: Add tegra_pm_park_secondary_cpu()
Date: Tue, 25 Feb 2020 01:40:42 +0300
Message-ID: <20200224224057.21877-3-digetx@gmail.com>
References: <20200224224057.21877-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200224224057.21877-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, Jasper Korten <jja2000@gmail.com>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This function resembles tegra_cpu_die() of the hotplug code, but
this variant is more suitable to be used for CPU PM because it's made
specifically to be used by cpu_suspend(). In short this function puts
secondary CPU offline, it will be used by the new CPUIDLE driver.

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Jasper Korten <jja2000@gmail.com>
Tested-by: David Heidelberg <david@ixit.cz>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/pm.c | 14 ++++++++++++++
 arch/arm/mach-tegra/pm.h |  5 +++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index 3cab81b82866..f5ff3dd1dd81 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -436,4 +436,18 @@ void __init tegra_init_suspend(void)
 
 	suspend_set_ops(&tegra_suspend_ops);
 }
+
+int tegra_pm_park_secondary_cpu(unsigned long cpu)
+{
+	if (cpu > 0) {
+		tegra_disable_clean_inv_dcache(TEGRA_FLUSH_CACHE_LOUIS);
+
+		if (tegra_get_chip_id() == TEGRA20)
+			tegra20_hotplug_shutdown();
+		else
+			tegra30_hotplug_shutdown();
+	}
+
+	return -EINVAL;
+}
 #endif
diff --git a/arch/arm/mach-tegra/pm.h b/arch/arm/mach-tegra/pm.h
index 569151b3edc0..9a790f00237f 100644
--- a/arch/arm/mach-tegra/pm.h
+++ b/arch/arm/mach-tegra/pm.h
@@ -31,8 +31,13 @@ extern void (*tegra_tear_down_cpu)(void);
 
 #ifdef CONFIG_PM_SLEEP
 void tegra_init_suspend(void);
+int tegra_pm_park_secondary_cpu(unsigned long cpu);
 #else
 static inline void tegra_init_suspend(void) {}
+static inline int tegra_pm_park_secondary_cpu(unsigned long cpu)
+{
+	return -ENOTSUPP;
+}
 #endif
 
 #endif /* _MACH_TEGRA_PM_H_ */
-- 
2.24.0
