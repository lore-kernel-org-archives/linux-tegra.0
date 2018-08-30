From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/4] ARM: tegra: Fix DRAM refresh-interval clobbering on resume from LP1 on Tegra30
Date: Thu, 30 Aug 2018 21:54:02 +0300
Message-ID: <20180830185404.7224-3-digetx@gmail.com>
References: <20180830185404.7224-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830185404.7224-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The DRAM refresh-interval is getting erroneously set to "1" on exiting
from memory self-refreshing mode. The clobbered interval causes the
"refresh request overflow timeout" error raised by the External Memory
Controller on exiting from LP1 on Tegra30.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index 801fe58978ae..99ac9c6dcf7c 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -29,7 +29,6 @@
 #define EMC_CFG				0xc
 #define EMC_ADR_CFG			0x10
 #define EMC_TIMING_CONTROL		0x28
-#define EMC_REFRESH			0x70
 #define EMC_NOP				0xdc
 #define EMC_SELF_REF			0xe0
 #define EMC_MRW				0xe8
@@ -459,7 +458,6 @@ emc_wait_auto_cal_onetime:
 	cmp	r10, #TEGRA30
 	streq	r1, [r0, #EMC_NOP]
 	streq	r1, [r0, #EMC_NOP]
-	streq	r1, [r0, #EMC_REFRESH]
 
 	emc_device_mask r1, r0
 
-- 
2.18.0
