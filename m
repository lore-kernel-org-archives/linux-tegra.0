From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/6] clk: tegra114: implement wait_for_reset and disable_clock for tegra_cpu_car_ops
Date: Wed, 15 May 2013 18:27:23 +0800
Message-ID: <1368613644-11863-6-git-send-email-josephl@nvidia.com>
References: <1368613644-11863-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368613644-11863-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The conventional CPU hotplug sequence on the other Tegra chips, we will also
clock gate the CPU in tegra_cpu_kill() after the CPU was power gated. For
Tegra114, the flow controller will clock gate the CPU after the power down
sequence. But we still need to implement a empty function for disable_clock
to avoid kernel warning message.

Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra114.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index d78e16e..40d939d 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -250,6 +250,9 @@
 #define CLK_SOURCE_XUSB_DEV_SRC 0x60c
 #define CLK_SOURCE_EMC 0x19c
 
+/* Tegra CPU clock and reset control regs */
+#define CLK_RST_CONTROLLER_CPU_CMPLX_STATUS	0x470
+
 static int periph_clk_enb_refcnt[CLK_OUT_ENB_NUM * 32];
 
 static void __iomem *clk_base;
@@ -2000,7 +2003,25 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base)
 	}
 }
 
-static struct tegra_cpu_car_ops tegra114_cpu_car_ops;
+/* Tegra114 CPU clock and reset control functions */
+static void tegra114_wait_cpu_in_reset(u32 cpu)
+{
+	unsigned int reg;
+
+	do {
+		reg = readl(clk_base + CLK_RST_CONTROLLER_CPU_CMPLX_STATUS);
+		cpu_relax();
+	} while (!(reg & (1 << cpu)));  /* check CPU been reset or not */
+}
+static void tegra114_disable_cpu_clock(u32 cpu)
+{
+	/* flow controller would take care in the power sequence. */
+}
+
+static struct tegra_cpu_car_ops tegra114_cpu_car_ops = {
+	.wait_for_reset	= tegra114_wait_cpu_in_reset,
+	.disable_clock	= tegra114_disable_cpu_clock,
+};
 
 static const struct of_device_id pmc_match[] __initconst = {
 	{ .compatible = "nvidia,tegra114-pmc" },
-- 
1.8.2.2
