From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v6 14/15] ARM: tegra30: cpuidle: Don't enter LP2 on CPU0 when EMC runs off PLLP
Date: Mon,  1 Jul 2019 00:00:18 +0300
Message-ID: <20190630210019.26914-15-digetx@gmail.com>
References: <20190630210019.26914-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190630210019.26914-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Machine hangs after entering LP2 if EMC clock is running off the PLLP.
Either hardware is touching PLLP during LP2, making it unstable, or there
is a software bug somewhere around PLLP programming. Real reason is
unknown, hence let's simply avoid LP2 for CPU0 for now to workaround the
problem. Note that LP2 works fine when EMC is running off any other parent
clock, LP1 is totally unaffected. Also note that there is no hang on LP2
if memory timing is set up for a higher rate (600MHz) when on PLLP, which
makes this extra suspicious.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/cpuidle-tegra30.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/cpuidle-tegra30.c b/arch/arm/mach-tegra/cpuidle-tegra30.c
index c6128526877d..0f8da69ba5be 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra30.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra30.c
@@ -60,10 +60,15 @@ static bool tegra30_cpu_cluster_power_down(struct cpuidle_device *dev,
 					   struct cpuidle_driver *drv,
 					   int index)
 {
-	/* All CPUs entering LP2 is not working.
+	/*
+	 * All CPUs entering LP2 is not working.
 	 * Don't let CPU0 enter LP2 when any secondary CPU is online.
+	 *
+	 * Machine hangs after entering LP2 if EMC is running off PLLP,
+	 * reason is unknown.
 	 */
-	if (num_online_cpus() > 1 || !tegra_cpu_rail_off_ready()) {
+	if (num_online_cpus() > 1 || !tegra_cpu_rail_off_ready() ||
+	    tegra20_clk_emc_on_pllp()) {
 		cpu_do_idle();
 		return false;
 	}
-- 
2.22.0
