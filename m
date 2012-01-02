From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v1 3/3] arm/tegra: enable tegra30 clock framework
Date: Mon, 2 Jan 2012 17:18:05 +0200
Message-ID: <1325517486-22458-4-git-send-email-pdeschrijver@nvidia.com>
References: <1325517486-22458-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1325517486-22458-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/Makefile |    1 +
 arch/arm/mach-tegra/clock.h  |    1 +
 arch/arm/mach-tegra/common.c |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index d9bf7c1..c763eb7 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= tegra2_emc.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= pinmux-tegra20-tables.o
 obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= pinmux-tegra30-tables.o
 obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= board-dt-tegra30.o
+obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= tegra30_clocks.o
 obj-$(CONFIG_SMP)                       += platsmp.o localtimer.o headsmp.o
 obj-$(CONFIG_HOTPLUG_CPU)               += hotplug.o
 obj-$(CONFIG_TEGRA_SYSTEM_DMA)		+= dma.o
diff --git a/arch/arm/mach-tegra/clock.h b/arch/arm/mach-tegra/clock.h
index 18f8b85..bc30065 100644
--- a/arch/arm/mach-tegra/clock.h
+++ b/arch/arm/mach-tegra/clock.h
@@ -160,6 +160,7 @@ struct tegra_clk_init_table {
 };
 
 void tegra2_init_clocks(void);
+void tegra30_init_clocks(void);
 void clk_init(struct clk *clk);
 struct clk *tegra_get_clock_by_name(const char *name);
 int clk_reparent(struct clk *c, struct clk *parent);
diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
index 72b666b..1a752e5 100644
--- a/arch/arm/mach-tegra/common.c
+++ b/arch/arm/mach-tegra/common.c
@@ -107,6 +107,7 @@ void __init tegra20_init_early(void)
 #ifdef CONFIG_ARCH_TEGRA_3x_SOC
 void __init tegra30_init_early(void)
 {
+	tegra30_init_clocks();
 	tegra_init_cache(0x441, 0x551);
 }
 #endif
-- 
1.7.7.rc0.72.g4b5ea.dirty
