From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v7 3/5] ARM: tegra: split setting of CPU reset handler
Date: Fri, 4 Oct 2013 09:37:13 -0700
Message-ID: <1380904635-18113-4-git-send-email-acourbot@nvidia.com>
References: <1380904635-18113-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380904635-18113-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Not all Tegra devices can set the CPU reset handler in the same way.
In particular, devices using a TrustZone secure monitor cannot set the
reset handler directly and need to do it through a firmware operation.

This patch separates the act of setting the reset handler from its
preparation, so the former can be implemented in a different way.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/reset.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
index fd0bbf8..e282395 100644
--- a/arch/arm/mach-tegra/reset.c
+++ b/arch/arm/mach-tegra/reset.c
@@ -33,26 +33,18 @@
 
 static bool is_enabled;
 
-static void __init tegra_cpu_reset_handler_enable(void)
+static void __init tegra_cpu_reset_handler_set(const u32 reset_address)
 {
-	void __iomem *iram_base = IO_ADDRESS(TEGRA_IRAM_RESET_BASE);
 	void __iomem *evp_cpu_reset =
 		IO_ADDRESS(TEGRA_EXCEPTION_VECTORS_BASE + 0x100);
 	void __iomem *sb_ctrl = IO_ADDRESS(TEGRA_SB_BASE);
 	u32 reg;
 
-	BUG_ON(is_enabled);
-	BUG_ON(tegra_cpu_reset_handler_size > TEGRA_IRAM_RESET_HANDLER_SIZE);
-
-	memcpy(iram_base, (void *)__tegra_cpu_reset_handler_start,
-			tegra_cpu_reset_handler_size);
-
 	/*
 	 * NOTE: This must be the one and only write to the EVP CPU reset
 	 *       vector in the entire system.
 	 */
-	writel(TEGRA_IRAM_RESET_BASE + tegra_cpu_reset_handler_offset,
-			evp_cpu_reset);
+	writel(reset_address, evp_cpu_reset);
 	wmb();
 	reg = readl(evp_cpu_reset);
 
@@ -66,6 +58,21 @@ static void __init tegra_cpu_reset_handler_enable(void)
 		writel(reg, sb_ctrl);
 		wmb();
 	}
+}
+
+static void __init tegra_cpu_reset_handler_enable(void)
+{
+	void __iomem *iram_base = IO_ADDRESS(TEGRA_IRAM_RESET_BASE);
+	const u32 reset_address = TEGRA_IRAM_RESET_BASE +
+						tegra_cpu_reset_handler_offset;
+
+	BUG_ON(is_enabled);
+	BUG_ON(tegra_cpu_reset_handler_size > TEGRA_IRAM_RESET_HANDLER_SIZE);
+
+	memcpy(iram_base, (void *)__tegra_cpu_reset_handler_start,
+			tegra_cpu_reset_handler_size);
+
+	tegra_cpu_reset_handler_set(reset_address);
 
 	is_enabled = true;
 }
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
