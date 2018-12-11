From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] clk: tegra: fix SMP build
Date: Tue, 11 Dec 2018 15:35:07 +0100
Message-ID: <20181211143528.2024488-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Aapo Vienamo <avienamo@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

When CONFIG_SMP is disabled, the tegra clk driver now fails to build:

drivers/clk/tegra/clk-tegra30.c: In function 'tegra30_cpu_rail_off_ready':
drivers/clk/tegra/clk-tegra30.c:1151:19: error: implicit declaration of function 'tegra_pmc_cpu_is_powered'; did you mean 'tegra_powergate_is_powered'? [-Werror=implicit-function-declaration]
  cpu_pwr_status = tegra_pmc_cpu_is_powered(1) ||

I don't know if tegra works without CONFIG_SMP, but we can get it to
build by making the calls conditional, and removing the pointless
ifdef around the declaration. The assumption now is that in a
non-SMP system, the secondary CPUs are always disabled.

Fixes: 61866523ed6e ("clk: tegra30: Use Tegra CPU powergate helper function")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Not sure if this is the best solution. If you think it's not, please
submit a different fix.
---
 drivers/clk/tegra/clk-tegra30.c | 10 +++++++---
 include/soc/tegra/pmc.h         |  2 --
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index fa8d573ac626..1505185936f4 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1148,9 +1148,13 @@ static bool tegra30_cpu_rail_off_ready(void)
 
 	cpu_rst_status = readl(clk_base +
 				TEGRA30_CLK_RST_CONTROLLER_CPU_CMPLX_STATUS);
-	cpu_pwr_status = tegra_pmc_cpu_is_powered(1) ||
-			 tegra_pmc_cpu_is_powered(2) ||
-			 tegra_pmc_cpu_is_powered(3);
+
+	if (IS_ENABLED(CONFIG_SMP))
+		cpu_pwr_status = tegra_pmc_cpu_is_powered(1) ||
+				 tegra_pmc_cpu_is_powered(2) ||
+				 tegra_pmc_cpu_is_powered(3);
+	else
+		cpu_pwr_status = 0;
 
 	if (((cpu_rst_status & 0xE) != 0xE) || cpu_pwr_status)
 		return false;
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index fd816f6aa9cc..a9db1b501de1 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -26,11 +26,9 @@
 struct clk;
 struct reset_control;
 
-#ifdef CONFIG_SMP
 bool tegra_pmc_cpu_is_powered(unsigned int cpuid);
 int tegra_pmc_cpu_power_on(unsigned int cpuid);
 int tegra_pmc_cpu_remove_clamping(unsigned int cpuid);
-#endif /* CONFIG_SMP */
 
 /*
  * powergate and I/O rail APIs
-- 
2.20.0
