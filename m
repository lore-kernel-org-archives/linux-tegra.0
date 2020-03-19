From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v8 07/12] ARM: tegra: Don't enable PLLX while resuming from LP1 on Tegra30
Date: Thu, 19 Mar 2020 22:02:24 +0300
Message-ID: <20200319190229.32200-8-digetx@gmail.com>
References: <20200319190229.32200-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200319190229.32200-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, Jasper Korten <jja2000@gmail.com>, David Heidelberg <david@ixit.cz>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

PLLX may be kept disabled if cpufreq driver selects some other clock for
CPU. In that case PLLX will be disabled later in the resume path by the
CLK driver, which also can enable PLLX if necessary by itself. Thus there
is no need to enable PLLX early during resume. Tegra114/124 CLK drivers do
not manage PLLX on resume and thus they are left untouched by this patch.

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Marcel Ziswiler <marcel@ziswiler.com>
Tested-by: Jasper Korten <jja2000@gmail.com>
Tested-by: David Heidelberg <david@ixit.cz>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index 9942265ed650..2667bcdb5dc6 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -361,7 +361,6 @@ _no_pll_iddq_exit:
 
 	pll_enable r1, r0, CLK_RESET_PLLM_BASE, CLK_RESET_PLLM_MISC
 	pll_enable r1, r0, CLK_RESET_PLLC_BASE, CLK_RESET_PLLC_MISC
-	pll_enable r1, r0, CLK_RESET_PLLX_BASE, CLK_RESET_PLLX_MISC
 
 _pll_m_c_x_done:
 	pll_enable r1, r0, CLK_RESET_PLLP_BASE, CLK_RESET_PLLP_MISC
@@ -371,12 +370,18 @@ _pll_m_c_x_done:
 	pll_locked r1, r0, CLK_RESET_PLLP_BASE
 	pll_locked r1, r0, CLK_RESET_PLLA_BASE
 	pll_locked r1, r0, CLK_RESET_PLLC_BASE
-	pll_locked r1, r0, CLK_RESET_PLLX_BASE
 
+	/*
+	 * CPUFreq driver could select other PLL for CPU. PLLX will be
+	 * enabled by the Tegra30 CLK driver on an as-needed basis, see
+	 * tegra30_cpu_clock_resume().
+	 */
 	tegra_get_soc_id TEGRA_APB_MISC_BASE, r1
 	cmp	r1, #TEGRA30
 	beq	1f
 
+	pll_locked r1, r0, CLK_RESET_PLLX_BASE
+
 	ldr	r1, [r0, #CLK_RESET_PLLP_BASE]
 	bic	r1, r1, #(1<<31)	@ disable PllP bypass
 	str	r1, [r0, #CLK_RESET_PLLP_BASE]
-- 
2.25.1
