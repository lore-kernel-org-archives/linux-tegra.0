From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [Patch v3 2/4] mfd: tps65090: Add resources for charger
Date: Tue, 12 Mar 2013 18:08:07 -0400
Message-ID: <1363126089-9071-3-git-send-email-rklein@nvidia.com>
References: <1363126089-9071-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363126089-9071-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add irq resources to pass to the charger mfd sub dev so
the charger can listen for interrupts.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v3:
 - no changes since v2
v2:
 - no changes since v1

 drivers/mfd/tps65090.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index 98edb5be..88846ae 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -56,12 +56,22 @@
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
 	},
 };
 
-- 
1.7.9.5
