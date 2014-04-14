From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 4/4] pinctrl: tegra: print better error messages
Date: Mon, 14 Apr 2014 15:33:42 -0600
Message-ID: <1397511222-28533-4-git-send-email-swarren@wwwdotorg.org>
References: <1397511222-28533-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397511222-28533-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When an attempt is made to configure an unsupported option on a pin,
print the DT property name of that option, so it's easier to debug
what the problem is.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/pinctrl-tegra.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c
index 0faa09200781..2d43bff74f59 100644
--- a/drivers/pinctrl/pinctrl-tegra.c
+++ b/drivers/pinctrl/pinctrl-tegra.c
@@ -413,10 +413,21 @@ static int tegra_pinconf_reg(struct tegra_pmx *pmx,
 	}
 
 	if (*reg < 0 || *bit > 31) {
-		if (report_err)
+		if (report_err) {
+			const char *prop = "unknown";
+			int i;
+
+			for (i = 0; i < ARRAY_SIZE(cfg_params); i++) {
+				if (cfg_params[i].param == param) {
+					prop = cfg_params[i].property;
+					break;
+				}
+			}
+
 			dev_err(pmx->dev,
-				"Config param %04x not supported on group %s\n",
-				param, g->name);
+				"Config param %04x (%s) not supported on group %s\n",
+				param, prop, g->name);
+		}
 		return -ENOTSUPP;
 	}
 
-- 
1.8.1.5
