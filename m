From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 04/13] ARM: tegra: Compile sleep-tegra20/30.S unconditionally
Date: Mon, 15 Jul 2019 20:26:20 +0300
Message-ID: <20190715172629.4437-5-digetx@gmail.com>
References: <20190715172629.4437-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715172629.4437-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The sleep-tegra*.S provides functionality required for suspend/resume
and CPU hotplugging. The new unified CPUIDLE driver will support multiple
hardware generations starting from Terga20 and ending with Tegra124, the
driver will utilize functions that are provided by the assembly and thus
it is cleaner to compile that code without any build-dependencies in order
to avoid churning with #ifdef's.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/Makefile | 10 ++++------
 arch/arm/mach-tegra/sleep.h  |  2 --
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index 5d93a0b36866..3bb44246d928 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -8,16 +8,14 @@ obj-y					+= reset.o
 obj-y					+= reset-handler.o
 obj-y					+= sleep.o
 obj-y					+= tegra.o
-obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= sleep-tegra20.o
-obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= pm-tegra20.o
-obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= sleep-tegra30.o
-obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= pm-tegra30.o
+obj-y					+= sleep-tegra20.o
+obj-y					+= sleep-tegra30.o
 obj-$(CONFIG_SMP)			+= platsmp.o
 obj-$(CONFIG_HOTPLUG_CPU)               += hotplug.o
 
-obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= sleep-tegra30.o
+obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= pm-tegra20.o
+obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= pm-tegra30.o
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= pm-tegra30.o
-obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= sleep-tegra30.o
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= pm-tegra30.o
 
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= board-paz00.o
diff --git a/arch/arm/mach-tegra/sleep.h b/arch/arm/mach-tegra/sleep.h
index d219872b7546..4978def9db46 100644
--- a/arch/arm/mach-tegra/sleep.h
+++ b/arch/arm/mach-tegra/sleep.h
@@ -118,10 +118,8 @@ void tegra_resume(void);
 int tegra_sleep_cpu_finish(unsigned long);
 void tegra_disable_clean_inv_dcache(u32 flag);
 
-#ifdef CONFIG_HOTPLUG_CPU
 void tegra20_hotplug_shutdown(void);
 void tegra30_hotplug_shutdown(void);
-#endif
 
 void tegra20_tear_down_cpu(void);
 int tegra30_sleep_cpu_secondary_finish(unsigned long);
-- 
2.22.0
