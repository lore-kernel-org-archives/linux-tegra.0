From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 3/4] pinctrl: tegra: reduce size of data table fields
Date: Mon, 14 Apr 2014 15:33:41 -0600
Message-ID: <1397511222-28533-3-git-send-email-swarren@wwwdotorg.org>
References: <1397511222-28533-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397511222-28533-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The range of npins and function ID values is small enough to fit into a
u8. Use this type rather than unsigned to shrink the pinmux data tables.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/pinctrl-tegra.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra.h b/drivers/pinctrl/pinctrl-tegra.h
index c60ad4cf971c..9052c1f8a59b 100644
--- a/drivers/pinctrl/pinctrl-tegra.h
+++ b/drivers/pinctrl/pinctrl-tegra.h
@@ -131,8 +131,8 @@ struct tegra_function {
 struct tegra_pingroup {
 	const char *name;
 	const unsigned *pins;
-	unsigned npins;
-	unsigned funcs[4];
+	u8 npins;
+	u8 funcs[4];
 	s16 mux_reg;
 	s16 pupd_reg;
 	s16 tri_reg;
-- 
1.8.1.5
