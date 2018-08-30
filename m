From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/2] ARM: tegra: Switch CPU to PLLP before powergating on Tegra30
Date: Thu, 30 Aug 2018 22:04:53 +0300
Message-ID: <20180830190454.8729-2-digetx@gmail.com>
References: <20180830190454.8729-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830190454.8729-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

PLLX is getting turned by the HW logic when CPU enters powergated state
and there is no enough time for PLLX to re-lock on exiting the low-power
state, this causes memory errors coming from misbehaving CPU and eventual
hanging of the system.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index dd4a67dabd91..d572d4b860be 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -298,8 +298,8 @@ ENDPROC(tegra30_sleep_cpu_secondary_finish)
  * Switches the CPU to enter sleep.
  */
 ENTRY(tegra30_tear_down_cpu)
+	bl	tegra_switch_cpu_to_pllp
 	mov32	r6, TEGRA_FLOW_CTRL_BASE
-
 	b	tegra30_enter_sleep
 ENDPROC(tegra30_tear_down_cpu)
 
-- 
2.18.0
