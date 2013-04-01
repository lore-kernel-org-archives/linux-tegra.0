From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [REPOST V4 2/2] mfd: tps65090: Add resources for charger
Date: Mon, 1 Apr 2013 18:20:24 -0400
Message-ID: <1364854824-7647-2-git-send-email-rklein@nvidia.com>
References: <1364854824-7647-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364854824-7647-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add irq resources to pass to the charger mfd sub dev so
the charger can listen for interrupts.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v4:
 - Added of_compatible string to resources for tps65090-charger
v3:
 - no changes since v2
v2:
 - no changes since v1

 drivers/mfd/tps65090.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index 98edb5be..fbd6ee6 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -56,12 +56,23 @@
 #define TPS65090_INT2_MASK_OVERLOAD_FET6		6
 #define TPS65090_INT2_MASK_OVERLOAD_FET7		7
 
+static struct resource charger_resources[] = {
+	{
+		.start  = TPS65090_IRQ_VAC_STATUS_CHANGE,
+		.end    = TPS65090_IRQ_VAC_STATUS_CHANGE,
+		.flags  = IORESOURCE_IRQ,
+	}
+};
+
 static struct mfd_cell tps65090s[] = {
 	{
 		.name = "tps65090-pmic",
 	},
 	{
 		.name = "tps65090-charger",
+		.num_resources = ARRAY_SIZE(charger_resources),
+		.resources = &charger_resources[0],
+		.of_compatible = "ti,tps65090-charger",
 	},
 };
 
-- 
1.7.9.5
