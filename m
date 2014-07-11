From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/12] ARM: tegra: Always lock the CPU reset vector
Date: Fri, 11 Jul 2014 14:16:09 +0200
Message-ID: <1405080971-7609-11-git-send-email-thierry.reding@gmail.com>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405080971-7609-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Currently the reset vector is not locked on Tegra20 because the hardware
doesn't support it. However in order not to depend on the chip ID, which
becomes available only later in the boot process, we set the bit anyway.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/reset.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
index e997b2573893..96cafc426cdb 100644
--- a/arch/arm/mach-tegra/reset.c
+++ b/arch/arm/mach-tegra/reset.c
@@ -53,12 +53,10 @@ static void __init tegra_cpu_reset_handler_set(const u32 reset_address)
 	 * Prevent further modifications to the physical reset vector.
 	 *  NOTE: Has no effect on chips prior to Tegra30.
 	 */
-	if (tegra_get_chip_id() != TEGRA20) {
-		reg = readl(sb_ctrl);
-		reg |= 2;
-		writel(reg, sb_ctrl);
-		wmb();
-	}
+	reg = readl(sb_ctrl);
+	reg |= 2;
+	writel(reg, sb_ctrl);
+	wmb();
 }
 
 static void __init tegra_cpu_reset_handler_enable(void)
-- 
2.0.1
