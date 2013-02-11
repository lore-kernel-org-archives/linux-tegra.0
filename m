From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: [v2 2/3] ARM: tegra: Rename board-dt-tegra20.c to tegra.c
Date: Mon, 11 Feb 2013 08:05:42 +0200
Message-ID: <1360562743-21689-2-git-send-email-hdoyu@nvidia.com>
References: <1360562743-21689-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360562743-21689-1-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: arnd@arndb.de, marvin24@gmx.de, balbi@ti.com, Hiroshi Doyu <hdoyu@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This is the preparation to unify "board-dt-tegra{20,30,114}.c" to a
single file "tegra.c".

Signed-off-by: Hiroshi Doyu <hdoyu@nvidia.com>
---
 arch/arm/mach-tegra/Makefile                       |    2 +-
 .../arm/mach-tegra/{board-dt-tegra20.c => tegra.c} |    0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm/mach-tegra/{board-dt-tegra20.c => tegra.c} (100%)

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index f6b46ae..c6d6be2 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -27,7 +27,7 @@ obj-$(CONFIG_HOTPLUG_CPU)               += hotplug.o
 obj-$(CONFIG_CPU_FREQ)                  += cpu-tegra.o
 obj-$(CONFIG_TEGRA_PCI)			+= pcie.o
 
-obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= board-dt-tegra20.o
+obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= tegra.o
 obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= board-dt-tegra30.o
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= board-dt-tegra114.o
 ifeq ($(CONFIG_CPU_IDLE),y)
diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/tegra.c
similarity index 100%
rename from arch/arm/mach-tegra/board-dt-tegra20.c
rename to arch/arm/mach-tegra/tegra.c
-- 
1.7.9.5
