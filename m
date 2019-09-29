From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 02/14] ARM: tegra: Change tegra_set_cpu_in_lp2() type to void
Date: Sun, 29 Sep 2019 20:59:40 +0300
Message-ID: <20190929175952.22690-3-digetx@gmail.com>
References: <20190929175952.22690-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190929175952.22690-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The old Tegra30 CPUIDLE driver had intention to check whether primary
CPU was the last CPU that entered LP2 (CC6) idle-state, but that
functionality never got utilized by the old-removed driver because it
never supported the CC6 while secondary CPUs were online. The new driver
will properly support CC6 on Tegra30, including the case where secondary
CPUs are online, and that knowledge about what CPUs entered CC6 won't be
needed at all because new driver will use different approach by making use
of the coupled idle-state and explicitly parking secondary CPUs before
entering into CC6.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/pm.c | 8 +-------
 arch/arm/mach-tegra/pm.h | 2 +-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index 6aaacb5757e1..2f6fb54be9f8 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -123,11 +123,9 @@ void tegra_clear_cpu_in_lp2(void)
 	spin_unlock(&tegra_lp2_lock);
 }
 
-bool tegra_set_cpu_in_lp2(void)
+void tegra_set_cpu_in_lp2(void)
 {
 	int phy_cpu_id = cpu_logical_map(smp_processor_id());
-	bool last_cpu = false;
-	cpumask_t *cpu_lp2_mask = tegra_cpu_lp2_mask;
 	u32 *cpu_in_lp2 = tegra_cpu_lp2_mask;
 
 	spin_lock(&tegra_lp2_lock);
@@ -135,11 +133,7 @@ bool tegra_set_cpu_in_lp2(void)
 	BUG_ON((*cpu_in_lp2 & BIT(phy_cpu_id)));
 	*cpu_in_lp2 |= BIT(phy_cpu_id);
 
-	if ((phy_cpu_id == 0) && cpumask_equal(cpu_lp2_mask, cpu_online_mask))
-		last_cpu = true;
-
 	spin_unlock(&tegra_lp2_lock);
-	return last_cpu;
 }
 
 static int tegra_sleep_cpu(unsigned long v2p)
diff --git a/arch/arm/mach-tegra/pm.h b/arch/arm/mach-tegra/pm.h
index 1e51a9b636eb..3f3164ad04b7 100644
--- a/arch/arm/mach-tegra/pm.h
+++ b/arch/arm/mach-tegra/pm.h
@@ -24,7 +24,7 @@ void tegra30_lp1_iram_hook(void);
 void tegra30_sleep_core_init(void);
 
 void tegra_clear_cpu_in_lp2(void);
-bool tegra_set_cpu_in_lp2(void);
+void tegra_set_cpu_in_lp2(void);
 void tegra_idle_lp2_last(void);
 extern void (*tegra_tear_down_cpu)(void);
 
-- 
2.23.0
