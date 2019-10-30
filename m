From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/2] ARM: tegra: Don't enable PLLX while resuming from LP1 on Tegra30
Date: Thu, 31 Oct 2019 00:53:42 +0300
Message-ID: <20191030215342.14948-2-digetx@gmail.com>
References: <20191030215342.14948-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191030215342.14948-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

PLLX may be kept disabled if cpufreq driver selects some other clock for
CPU. In that case PLLX will be disabled later in the resume path by the
CLK driver, which also can enable PLLX if necessary by itself. Thus there
is no need to enable PLLX early during resume. Tegra114/124 CLK drivers do
not manage PLLX on resume and thus they are left untouched by this patch.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index 2f9e5076d201..3caae60a75a0 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -358,7 +358,6 @@ _no_pll_iddq_exit:
 
 	pll_enable r1, r0, CLK_RESET_PLLM_BASE, CLK_RESET_PLLM_MISC
 	pll_enable r1, r0, CLK_RESET_PLLC_BASE, CLK_RESET_PLLC_MISC
-	pll_enable r1, r0, CLK_RESET_PLLX_BASE, CLK_RESET_PLLX_MISC
 
 _pll_m_c_x_done:
 	pll_enable r1, r0, CLK_RESET_PLLP_BASE, CLK_RESET_PLLP_MISC
@@ -368,8 +367,18 @@ _pll_m_c_x_done:
 	pll_locked r1, r0, CLK_RESET_PLLP_BASE
 	pll_locked r1, r0, CLK_RESET_PLLA_BASE
 	pll_locked r1, r0, CLK_RESET_PLLC_BASE
+
+	/*
+	 * CPUFreq driver could select other PLL for CPU. PLLX will be
+	 * enabled by the Tegra30 CLK driver on an as-needed basis, see
+	 * tegra30_cpu_clock_resume().
+	 */
+	cmp	r10, #TEGRA30
+	beq	_pll_m_c_x_locked
+
 	pll_locked r1, r0, CLK_RESET_PLLX_BASE
 
+_pll_m_c_x_locked:
 	mov32	r7, TEGRA_TMRUS_BASE
 	ldr	r1, [r7]
 	add	r1, r1, #LOCK_DELAY
-- 
2.23.0
