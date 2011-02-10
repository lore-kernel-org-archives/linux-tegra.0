From: Colin Cross <ccross@android.com>
Subject: [PATCH v4 12/15] ARM: tegra: Allow overriding arch_reset
Date: Wed,  9 Feb 2011 22:43:21 -0800
Message-ID: <1297320204-31882-13-git-send-email-ccross@android.com>
References: <1297320204-31882-1-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1297320204-31882-1-git-send-email-ccross@android.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org
Cc: Russell King <linux@arm.linux.org.uk>, konkers@android.com, linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Colin Cross <ccross@android.com>
---
 arch/arm/mach-tegra/board.h               |    2 ++
 arch/arm/mach-tegra/common.c              |   13 +++++++++++++
 arch/arm/mach-tegra/include/mach/system.h |   10 ++--------
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-tegra/board.h b/arch/arm/mach-tegra/board.h
index 0de565c..b3f9c94 100644
--- a/arch/arm/mach-tegra/board.h
+++ b/arch/arm/mach-tegra/board.h
@@ -23,6 +23,8 @@
 
 #include <linux/types.h>
 
+void tegra_assert_system_reset(char mode, const char *cmd);
+
 void __init tegra_common_init(void);
 void __init tegra_map_common_io(void);
 void __init tegra_init_irq(void);
diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
index 7c91e2b..84a7197 100644
--- a/arch/arm/mach-tegra/common.c
+++ b/arch/arm/mach-tegra/common.c
@@ -26,11 +26,24 @@
 
 #include <mach/iomap.h>
 #include <mach/dma.h>
+#include <mach/system.h>
 
 #include "board.h"
 #include "clock.h"
 #include "fuse.h"
 
+void (*arch_reset)(char mode, const char *cmd) = tegra_assert_system_reset;
+
+void tegra_assert_system_reset(char mode, const char *cmd)
+{
+	void __iomem *reset = IO_ADDRESS(TEGRA_CLK_RESET_BASE + 0x04);
+	u32 reg;
+
+	reg = readl(reset);
+	reg |= 0x04;
+	writel(reg, reset);
+}
+
 static __initdata struct tegra_clk_init_table common_clk_init_table[] = {
 	/* name		parent		rate		enabled */
 	{ "clk_m",	NULL,		0,		true },
diff --git a/arch/arm/mach-tegra/include/mach/system.h b/arch/arm/mach-tegra/include/mach/system.h
index 84d5d46..d0183d8 100644
--- a/arch/arm/mach-tegra/include/mach/system.h
+++ b/arch/arm/mach-tegra/include/mach/system.h
@@ -24,16 +24,10 @@
 #include <mach/hardware.h>
 #include <mach/iomap.h>
 
-static inline void arch_idle(void)
-{
-}
+extern void (*arch_reset)(char mode, const char *cmd);
 
-static inline void arch_reset(char mode, const char *cmd)
+static inline void arch_idle(void)
 {
-	void __iomem *reset = IO_ADDRESS(TEGRA_CLK_RESET_BASE + 0x04);
-	u32 reg = readl(reset);
-	reg |= 0x04;
-	writel(reg, reset);
 }
 
 #endif
-- 
1.7.3.1
