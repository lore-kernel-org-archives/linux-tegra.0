From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v6 06/12] ARM: tegra: Switch CPU to PLLP on resume from LP1 on Tegra30/114/124
Date: Wed, 18 Dec 2019 23:21:36 +0300
Message-ID: <20191218202142.11717-7-digetx@gmail.com>
References: <20191218202142.11717-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191218202142.11717-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The early-resume code shall not switch CPU to PLLX because PLLX
configuration could be unstable or PLLX should be simply disabled if
CPU enters into suspend running off some other PLL (the case if CPUFREQ
driver is active). The actual burst policy is restored by the clock
drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index 3341a12bbb9c..9a20c93abe48 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -383,11 +383,8 @@ _pll_m_c_x_done:
 	ldr	r4, [r5, #0x1C]		@ restore SCLK_BURST
 	str	r4, [r0, #CLK_RESET_SCLK_BURST]
 
-	cmp	r10, #TEGRA30
-	movweq	r4, #:lower16:((1 << 28) | (0x8))	@ burst policy is PLLX
-	movteq	r4, #:upper16:((1 << 28) | (0x8))
-	movwne	r4, #:lower16:((1 << 28) | (0xe))
-	movtne	r4, #:upper16:((1 << 28) | (0xe))
+	movw	r4, #:lower16:((1 << 28) | (0x4))	@ burst policy is PLLP
+	movt	r4, #:upper16:((1 << 28) | (0x4))
 	str	r4, [r0, #CLK_RESET_CCLK_BURST]
 
 	/* Restore pad power state to normal */
-- 
2.24.0
