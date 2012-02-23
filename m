From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: Enable CPUIdle on Tegra20
Date: Thu, 23 Feb 2012 18:20:56 +0200
Message-ID: <1330014056-26125-1-git-send-email-pdeschrijver@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

As the LP3 code also works for Tegra20, we can enable cpuidle for Tegra20.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
Tested on Tegra2 Ventana,
/sys/devices/system/cpu/cpu[0-1]/cpuidle/state0/usage increments over time
and the system is stable.

---
 arch/arm/mach-tegra/common.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
index e2a2c1f..2f86fcc 100644
--- a/arch/arm/mach-tegra/common.c
+++ b/arch/arm/mach-tegra/common.c
@@ -113,8 +113,6 @@ static void __init tegra_init_cache(u32 tag_latency, u32 data_latency)
 #ifdef CONFIG_ARCH_TEGRA_2x_SOC
 void __init tegra20_init_early(void)
 {
-	disable_hlt();  /* idle WFI usage needs to be confirmed */
-
 	tegra_init_fuse();
 	tegra2_init_clocks();
 	tegra_clk_init_from_table(tegra20_clk_init_table);
-- 
1.7.7.rc0.72.g4b5ea.dirty
