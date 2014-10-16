From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] pinctrl: tegra-xusb: Don't leak configurations
Date: Thu, 16 Oct 2014 12:12:22 +0200
Message-ID: <1413454342-16935-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The pinctrl config helpers make a separate copy of the configuration, so
callers must make sure to free any dynamically allocated memory that was
used to store it.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/pinctrl-tegra-xusb.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinctrl-tegra-xusb.c
index 1631ec94fb02..080ec7723ef2 100644
--- a/drivers/pinctrl/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
@@ -20,6 +20,7 @@
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/slab.h>
 
 #include <dt-bindings/pinctrl/pinctrl-tegra-xusb.h>
 
@@ -171,7 +172,7 @@ static int tegra_xusb_padctl_parse_subnode(struct tegra_xusb_padctl *padctl,
 			if (err == -EINVAL)
 				continue;
 
-			return err;
+			goto out;
 		}
 
 		config = TEGRA_XUSB_PADCTL_PACK(properties[i].param, value);
@@ -179,7 +180,7 @@ static int tegra_xusb_padctl_parse_subnode(struct tegra_xusb_padctl *padctl,
 		err = pinctrl_utils_add_config(padctl->pinctrl, &configs,
 					       &num_configs, config);
 		if (err < 0)
-			return err;
+			goto out;
 	}
 
 	if (function)
@@ -190,14 +191,14 @@ static int tegra_xusb_padctl_parse_subnode(struct tegra_xusb_padctl *padctl,
 
 	err = of_property_count_strings(np, "nvidia,lanes");
 	if (err < 0)
-		return err;
+		goto out;
 
 	reserve *= err;
 
 	err = pinctrl_utils_reserve_map(padctl->pinctrl, maps, reserved_maps,
 					num_maps, reserve);
 	if (err < 0)
-		return err;
+		goto out;
 
 	of_property_for_each_string(np, "nvidia,lanes", prop, group) {
 		if (function) {
@@ -205,7 +206,7 @@ static int tegra_xusb_padctl_parse_subnode(struct tegra_xusb_padctl *padctl,
 					reserved_maps, num_maps, group,
 					function);
 			if (err < 0)
-				return err;
+				goto out;
 		}
 
 		if (num_configs) {
@@ -214,11 +215,15 @@ static int tegra_xusb_padctl_parse_subnode(struct tegra_xusb_padctl *padctl,
 					configs, num_configs,
 					PIN_MAP_TYPE_CONFIGS_GROUP);
 			if (err < 0)
-				return err;
+				goto out;
 		}
 	}
 
-	return 0;
+	err = 0;
+
+out:
+	kfree(configs);
+	return err;
 }
 
 static int tegra_xusb_padctl_dt_node_to_map(struct pinctrl_dev *pinctrl,
-- 
2.1.2
