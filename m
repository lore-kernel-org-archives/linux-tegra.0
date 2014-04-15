From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] pinctrl: tegra: add missing kerneldoc
Date: Tue, 15 Apr 2014 11:02:03 -0600
Message-ID: <1397581323-1607-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The kerneldoc for struct tegra_pingroup didn't describe all of the fields
in the struct. Add some extra kerneldoc to fix that.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This depends on the 4-long series I sent yesterday, for patch context.

 drivers/pinctrl/pinctrl-tegra.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-tegra.h b/drivers/pinctrl/pinctrl-tegra.h
index 24c5a91230bb..8d94d1332e7b 100644
--- a/drivers/pinctrl/pinctrl-tegra.h
+++ b/drivers/pinctrl/pinctrl-tegra.h
@@ -78,6 +78,10 @@ struct tegra_function {
 
 /**
  * struct tegra_pingroup - Tegra pin group
+ * @name		The name of the pin group.
+ * @pins		An array of pin IDs included in this pin group.
+ * @npins		The number of entries in @pins.
+ * @funcs		The mux functions which can be muxed onto this group.
  * @mux_reg:		Mux register offset.
  *			This register contains the mux, einput, odrain, lock,
  *			ioreset, rcv_sel parameters.
-- 
1.8.1.5
