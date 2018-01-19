From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/3] pinctrl: sunxi: Use of_clk_get_parent_count() instead of open coding
Date: Fri, 19 Jan 2018 16:18:19 +0100
Message-ID: <1516375101-29836-2-git-send-email-geert+renesas@glider.be>
References: <1516375101-29836-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516375101-29836-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 4b6cb25bc796f86d..ab425eb45bf5e0f4 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -12,6 +12,7 @@
 
 #include <linux/io.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/gpio/driver.h>
 #include <linux/irqdomain.h>
 #include <linux/irqchip/chained_irq.h>
@@ -1185,7 +1186,7 @@ static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
 	int i, ret;
 
 	/* Deal with old DTs that didn't have the oscillators */
-	if (of_count_phandle_with_args(node, "clocks", "#clock-cells") != 3)
+	if (of_clk_get_parent_count(node) != 3)
 		return 0;
 
 	/* If we don't have any setup, bail out */
-- 
2.7.4
