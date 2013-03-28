From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 1/2] clk: tegra: Export peripheral reset functions
Date: Thu, 28 Mar 2013 21:31:27 +0100
Message-ID: <1364502688-5135-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The tegra_periph_reset_assert() and tegra_periph_reset_deassert()
functions can be used by drivers to reset peripherals. In order to allow
such drivers to be built as modules, export the functions.

Note that this restores the status quo as the functions were exported
before the move to the drivers/clk tree.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/clk/tegra/clk-periph.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 788486e..9dbd301 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -16,6 +16,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/err.h>
 
@@ -128,6 +129,7 @@ void tegra_periph_reset_deassert(struct clk *c)
 
 	tegra_periph_reset(gate, 0);
 }
+EXPORT_SYMBOL(tegra_periph_reset_deassert);
 
 void tegra_periph_reset_assert(struct clk *c)
 {
@@ -147,6 +149,7 @@ void tegra_periph_reset_assert(struct clk *c)
 
 	tegra_periph_reset(gate, 1);
 }
+EXPORT_SYMBOL(tegra_periph_reset_assert);
 
 const struct clk_ops tegra_clk_periph_ops = {
 	.get_parent = clk_periph_get_parent,
-- 
1.8.1.5
