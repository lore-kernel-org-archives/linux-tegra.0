From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 2/2] pinctrl: tegra-xusb: Fix allocation of pins
Date: Wed, 27 May 2015 14:11:54 +0100
Message-ID: <1432732314-372-3-git-send-email-jonathanh@nvidia.com>
References: <1432732314-372-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432732314-372-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit e5b3b2d9ed20 ("pinctrl: allows not to define the get_group_pins
operation") allows pin controllers not to register the get_group_pins()
function. However, a side-effect of not registering this function is
that pins are not allocated and potentially multiple devices could
attempt to configure the same pins [1]. Although this problem exists in
the pinctrl core, because only a few devices are impacted by this, fix
this for tegra-xusb by adding the get_group_pins() function.

Please note that in addition to adding the get_group_pins() functions
the pins/lanes for the tegra-xusb also need to be registered when
calling pinctrl_register(). This also allows the current pinmux state
to be viewed by the debugfs node "pinmux-pins" for the tegra-xusb pad
controller.

[1] http://www.spinics.net/lists/linux-gpio/msg05810.html

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/pinctrl-tegra-xusb.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinctrl-tegra-xusb.c
index 3e8e4a914fb4..6a6eebfb2930 100644
--- a/drivers/pinctrl/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
@@ -125,6 +125,21 @@ static const char *tegra_xusb_padctl_get_group_name(struct pinctrl_dev *pinctrl,
 	return padctl->soc->pins[group].name;
 }
 
+static int tegra_xusb_padctl_get_group_pins(struct pinctrl_dev *pinctrl,
+					    unsigned group,
+					    const unsigned **pins,
+					    unsigned *num_pins)
+{
+	/*
+	 * For the tegra-xusb pad controller groups are synonomous
+	 * with lanes/pins and there is always one lane/pin per group.
+	 */
+	*pins = &pinctrl->desc->pins[group].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
 enum tegra_xusb_padctl_param {
 	TEGRA_XUSB_PADCTL_IDDQ,
 };
@@ -248,6 +263,7 @@ static int tegra_xusb_padctl_dt_node_to_map(struct pinctrl_dev *pinctrl,
 static const struct pinctrl_ops tegra_xusb_padctl_pinctrl_ops = {
 	.get_groups_count = tegra_xusb_padctl_get_groups_count,
 	.get_group_name = tegra_xusb_padctl_get_group_name,
+	.get_group_pins = tegra_xusb_padctl_get_group_pins,
 	.dt_node_to_map = tegra_xusb_padctl_dt_node_to_map,
 	.dt_free_map = pinctrl_utils_dt_free_map,
 };
@@ -898,6 +914,8 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 
 	memset(&padctl->desc, 0, sizeof(padctl->desc));
 	padctl->desc.name = dev_name(padctl->dev);
+	padctl->desc.pins = tegra124_pins;
+	padctl->desc.npins = ARRAY_SIZE(tegra124_pins);
 	padctl->desc.pctlops = &tegra_xusb_padctl_pinctrl_ops;
 	padctl->desc.pmxops = &tegra_xusb_padctl_pinmux_ops;
 	padctl->desc.confops = &tegra_xusb_padctl_pinconf_ops;
-- 
1.9.1
