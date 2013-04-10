From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] mfd: tps65090: Add compatible string for charger subnode
Date: Wed, 10 Apr 2013 13:14:55 -0400
Message-ID: <1365614095-5846-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch adds the of_compatible value for the tps65090 charger
subnode used when loading the driver to find its properties
and of_node.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/mfd/tps65090.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index 88846ae..fbd6ee6 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -72,6 +72,7 @@ static struct mfd_cell tps65090s[] = {
 		.name = "tps65090-charger",
 		.num_resources = ARRAY_SIZE(charger_resources),
 		.resources = &charger_resources[0],
+		.of_compatible = "ti,tps65090-charger",
 	},
 };
 
-- 
1.7.9.5
