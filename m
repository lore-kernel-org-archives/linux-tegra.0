From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/2] ARM: tegra: Switch CPU to PLLP on resume from LP1 on Tegra30
Date: Thu, 30 Aug 2018 22:04:54 +0300
Message-ID: <20180830190454.8729-3-digetx@gmail.com>
References: <20180830190454.8729-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830190454.8729-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The early-resume code shall not switch CPU to PLLX because PLLX
configuration could be unstable or PLLX could be even disabled if
CPU entered suspend on PLLP, it the case if CPUFREQ driver is active.
The actual PLLX configuration and burst policy shall be restored by
the clock driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index d572d4b860be..127fc78365fe 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -396,8 +396,8 @@ _pll_m_c_x_done:
 	str	r4, [r0, #CLK_RESET_SCLK_BURST]
 
 	cmp	r10, #TEGRA30
-	movweq	r4, #:lower16:((1 << 28) | (0x8))	@ burst policy is PLLX
-	movteq	r4, #:upper16:((1 << 28) | (0x8))
+	movweq	r4, #:lower16:((1 << 28) | (0x4))	@ burst policy is PLLP
+	movteq	r4, #:upper16:((1 << 28) | (0x4))
 	movwne	r4, #:lower16:((1 << 28) | (0xe))
 	movtne	r4, #:upper16:((1 << 28) | (0xe))
 	str	r4, [r0, #CLK_RESET_CCLK_BURST]
-- 
2.18.0
