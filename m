From: Alan Ott <alan@signal11.us>
Subject: [PATCH v2 3/6] ARM: tegra: build localtimer support only when needed
Date: Fri,  2 Mar 2012 15:58:32 -0500
Message-ID: <1330721912-8694-1-git-send-email-alan@signal11.us>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Russell King <linux@arm.linux.org.uk>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Alan Ott <alan@signal11.us>
List-Id: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

It is possible to build a tegra kernel without localtimer
support, so the tegra specific parts should only be built
when that is indeed enabled.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Alan Ott <alan@signal11.us>
---
 arch/arm/mach-tegra/Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index e120ff5..829066f 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -13,7 +13,8 @@ obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= tegra2_emc.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= pinmux-tegra20-tables.o
 obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= pinmux-tegra30-tables.o
 obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= board-dt-tegra30.o
-obj-$(CONFIG_SMP)                       += platsmp.o localtimer.o headsmp.o
+obj-$(CONFIG_SMP)			+= platsmp.o headsmp.o
+obj-$(CONFIG_LOCAL_TIMERS)		+= localtimer.o
 obj-$(CONFIG_HOTPLUG_CPU)               += hotplug.o
 obj-$(CONFIG_TEGRA_SYSTEM_DMA)		+= dma.o
 obj-$(CONFIG_CPU_FREQ)                  += cpu-tegra.o
-- 
1.7.0.4
