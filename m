From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] irqchip: tegra: Add Tegra210 support
Date: Mon, 23 Mar 2015 11:26:19 +0100
Message-ID: <1427106379-14037-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra210 uses the same legacy interrupt controller as older generations
but it adds a sixth instance.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/irqchip/irq-tegra.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index d919ecf29cf4..51c485d9a877 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -48,7 +48,7 @@
 #define ICTLR_COP_IER_CLR	0x38
 #define ICTLR_COP_IEP_CLASS	0x3c
 
-#define TEGRA_MAX_NUM_ICTLRS	5
+#define TEGRA_MAX_NUM_ICTLRS	6
 
 static unsigned int num_ictlrs;
 
@@ -64,7 +64,12 @@ static const struct tegra_ictlr_soc tegra30_ictlr_soc = {
 	.num_ictlrs = 5,
 };
 
+static const struct tegra_ictlr_soc tegra210_ictlr_soc = {
+	.num_ictlrs = 6,
+};
+
 static const struct of_device_id ictlr_matches[] = {
+	{ .compatible = "nvidia,tegra210-ictlr", .data = &tegra210_ictlr_soc },
 	{ .compatible = "nvidia,tegra30-ictlr", .data = &tegra30_ictlr_soc },
 	{ .compatible = "nvidia,tegra20-ictlr", .data = &tegra20_ictlr_soc },
 	{ }
@@ -369,3 +374,4 @@ out_free:
 
 IRQCHIP_DECLARE(tegra20_ictlr, "nvidia,tegra20-ictlr", tegra_ictlr_init);
 IRQCHIP_DECLARE(tegra30_ictlr, "nvidia,tegra30-ictlr", tegra_ictlr_init);
+IRQCHIP_DECLARE(tegra210_ictlr, "nvidia,tegra210-ictlr", tegra_ictlr_init);
-- 
2.3.2
