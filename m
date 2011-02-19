From: Colin Cross <ccross@android.com>
Subject: [PATCH v2 05/21] ARM: tegra: clock: Disable clocks left on by
	bootloader
Date: Sat, 19 Feb 2011 14:25:54 -0800
Message-ID: <1298154371-5641-7-git-send-email-ccross__9584.2445189648$1298154435$gmane$org@android.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1298154371-5641-1-git-send-email-ccross@android.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.orglinux-tegra@vger.kernel.org
Cc: Russell King <linux@arm.linux.org.uk>, konkers@android.com, linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Adds CONFIG_TEGRA_DISABLE_BOOTLOADER_CLOCKS that iterates
through all clocks, disabling any for which the refcount
is 0 but the clock init detected the bootloader left the
clock on.

Signed-off-by: Colin Cross <ccross@android.com>
---
 arch/arm/mach-tegra/Kconfig |    6 ++++++
 arch/arm/mach-tegra/clock.c |   30 ++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index f0fda77..9f4fc6b 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -57,6 +57,12 @@ config TEGRA_DEBUG_UARTE
 
 endchoice
 
+config TEGRA_DISABLE_BOOTLOADER_CLOCKS
+	bool "Disable clocks left on by bootloader"
+	help
+	  Disables clocks that are detected to be on but haven't
+	  been requested by a kernel driver.
+
 config TEGRA_SYSTEM_DMA
 	bool "Enable system DMA driver for NVIDIA Tegra SoCs"
 	default y
diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c
index f55bb83..0ea5d92 100644
--- a/arch/arm/mach-tegra/clock.c
+++ b/arch/arm/mach-tegra/clock.c
@@ -511,6 +511,36 @@ int __init tegra_init_dvfs(void)
 
 late_initcall(tegra_init_dvfs);
 
+/*
+ * Iterate through all clocks, disabling any for which the refcount is 0
+ * but the clock init detected the bootloader left the clock on.
+ */
+#ifdef CONFIG_TEGRA_DISABLE_BOOTLOADER_CLOCKS
+int __init tegra_disable_boot_clocks(void)
+{
+	unsigned long flags;
+
+	struct clk *c;
+
+	spin_lock_irqsave(&clock_lock, flags);
+
+	list_for_each_entry(c, &clocks, node) {
+		if (c->refcnt == 0 && c->state == ON &&
+				c->ops && c->ops->disable) {
+			pr_warning("Disabling clock %s left on by bootloader\n",
+				c->name);
+			c->ops->disable(c);
+			c->state = OFF;
+		}
+	}
+
+	spin_unlock_irqrestore(&clock_lock, flags);
+
+	return 0;
+}
+late_initcall(tegra_disable_boot_clocks);
+#endif
+
 #ifdef CONFIG_DEBUG_FS
 static struct dentry *clk_debugfs_root;
 
-- 
1.7.3.1
