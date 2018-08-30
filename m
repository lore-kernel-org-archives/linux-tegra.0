From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/4] ARM: tegra: Fix missed EMC registers latching on resume from LP1 on Tegra30+
Date: Thu, 30 Aug 2018 21:54:01 +0300
Message-ID: <20180830185404.7224-2-digetx@gmail.com>
References: <20180830185404.7224-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830185404.7224-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The memory interface configuration and re-calibration interval are left
unassigned on resume from LP1 because these registers are shadowed and
require latching after being adjusted.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index 127fc78365fe..801fe58978ae 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -521,6 +521,8 @@ zcal_done:
 	ldr	r1, [r5, #0x0]		@ restore EMC_CFG
 	str	r1, [r0, #EMC_CFG]
 
+	emc_timing_update r1, r0
+
 	/* Tegra114 had dual EMC channel, now config the other one */
 	cmp	r10, #TEGRA114
 	bne	__no_dual_emc_chanl
-- 
2.18.0
