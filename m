From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3 6/6] pinctrl: tegra: Add complete device tree support
Date: Thu, 22 Mar 2012 12:27:22 -0600
Message-ID: <1332440842-1098-6-git-send-email-swarren@wwwdotorg.org>
References: <1332440842-1098-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332440842-1098-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Implement pinctrl_ops dt_node_to_map() and dt_free_map(). These allow
complete specification of the desired pinmux configuration using device
tree.

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
v3: Rebase on of_property_for_each_string() API changes.
    Improve DT parsing so it only calls krealloc() on the top-level map
    table once per subnode, rather than once per subnode/pin combination.
v2: Rebase on of_property_for_each_string() API changes.
---
 drivers/pinctrl/pinctrl-tegra.c |  205 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 205 insertions(+), 0 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c
index 9b32968..80e97c9 100644
--- a/drivers/pinctrl/pinctrl-tegra.c
+++ b/drivers/pinctrl/pinctrl-tegra.c
@@ -23,9 +23,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
+#include <linux/slab.h>
 
 #include <mach/pinconf-tegra.h>
 
@@ -98,11 +100,214 @@ static void tegra_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
 	seq_printf(s, " " DRIVER_NAME);
 }
 
+static int reserve_map(struct pinctrl_map **map, unsigned *reserved_maps,
+		       unsigned *num_maps, unsigned reserve)
+{
+	unsigned old_num = *reserved_maps;
+	unsigned new_num = *num_maps + reserve;
+	struct pinctrl_map *new_map;
+
+	if (old_num >= new_num)
+		return 0;
+
+	new_map = krealloc(*map, sizeof(*new_map) * new_num, GFP_KERNEL);
+	if (!new_map)
+		return -ENOMEM;
+
+	memset(new_map + old_num, 0, (new_num - old_num) * sizeof(*new_map));
+
+	*map = new_map;
+	*reserved_maps = new_num;
+
+	return 0;
+}
+
+static int add_map_mux(struct pinctrl_map **map, unsigned *reserved_maps,
+		       unsigned *num_maps, const char *group,
+		       const char *function)
+{
+	if (*num_maps == *reserved_maps)
+		return -ENOSPC;
+
+	(*map)[*num_maps].type = PIN_MAP_TYPE_MUX_GROUP;
+	(*map)[*num_maps].data.mux.group = group;
+	(*map)[*num_maps].data.mux.function = function;
+	(*num_maps)++;
+
+	return 0;
+}
+
+static int add_map_configs(struct pinctrl_map **map, unsigned *reserved_maps,
+			   unsigned *num_maps, const char *group,
+			   unsigned long *configs, unsigned num_configs)
+{
+	unsigned long *dup_configs;
+
+	if (*num_maps == *reserved_maps)
+		return -ENOSPC;
+
+	dup_configs = kmemdup(configs, num_configs * sizeof(*dup_configs),
+			      GFP_KERNEL);
+	if (!dup_configs)
+		return -ENOMEM;
+
+	(*map)[*num_maps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
+	(*map)[*num_maps].data.configs.group_or_pin = group;
+	(*map)[*num_maps].data.configs.configs = dup_configs;
+	(*map)[*num_maps].data.configs.num_configs = num_configs;
+	(*num_maps)++;
+
+	return 0;
+}
+
+static int add_config(unsigned long **configs, unsigned *num_configs,
+		      unsigned long config)
+{
+	unsigned old_num = *num_configs;
+	unsigned new_num = old_num + 1;
+	unsigned long *new_configs;
+
+	new_configs = krealloc(*configs, sizeof(*new_configs) * new_num,
+			       GFP_KERNEL);
+	if (!new_configs)
+		return -ENOMEM;
+
+	new_configs[old_num] = config;
+
+	*configs = new_configs;
+	*num_configs = new_num;
+
+	return 0;
+}
+
+void tegra_pinctrl_dt_free_map(struct pinctrl_dev *pctldev,
+			       struct pinctrl_map *map, unsigned num_maps)
+{
+	int i;
+
+	for (i = 0; i < num_maps; i++)
+		if (map[i].type == PIN_MAP_TYPE_CONFIGS_GROUP)
+			kfree(map[i].data.configs.configs);
+
+	kfree(map);
+}
+
+static const struct cfg_param {
+	const char *property;
+	enum tegra_pinconf_param param;
+} cfg_params[] = {
+	{"nvidia,pull",			TEGRA_PINCONF_PARAM_PULL},
+	{"nvidia,tristate",		TEGRA_PINCONF_PARAM_TRISTATE},
+	{"nvidia,enable-input",		TEGRA_PINCONF_PARAM_ENABLE_INPUT},
+	{"nvidia,open-drain",		TEGRA_PINCONF_PARAM_OPEN_DRAIN},
+	{"nvidia,lock",			TEGRA_PINCONF_PARAM_LOCK},
+	{"nvidia,io-reset",		TEGRA_PINCONF_PARAM_IORESET},
+	{"nvidia,high-speed-mode",	TEGRA_PINCONF_PARAM_HIGH_SPEED_MODE},
+	{"nvidia,schmitt",		TEGRA_PINCONF_PARAM_SCHMITT},
+	{"nvidia,low-power-mode",	TEGRA_PINCONF_PARAM_LOW_POWER_MODE},
+	{"nvidia,pull-down-strength",	TEGRA_PINCONF_PARAM_DRIVE_DOWN_STRENGTH},
+	{"nvidia,pull-up-strength",	TEGRA_PINCONF_PARAM_DRIVE_UP_STRENGTH},
+	{"nvidia,slew-rate-falling",	TEGRA_PINCONF_PARAM_SLEW_RATE_FALLING},
+	{"nvidia,slew-rate-rising",	TEGRA_PINCONF_PARAM_SLEW_RATE_RISING},
+};
+
+int tegra_pinctrl_dt_subnode_to_map(struct device_node *np,
+				    struct pinctrl_map **map,
+				    unsigned *reserved_maps,
+				    unsigned *num_maps)
+{
+	int ret, i;
+	const char *function;
+	u32 val;
+	unsigned long config;
+	unsigned long *configs = NULL;
+	unsigned num_configs = 0;
+	unsigned reserve;
+	struct property *prop;
+	const char *group;
+
+	ret = of_property_read_string(np, "nvidia,function", &function);
+	if (ret < 0)
+		function = NULL;
+
+	for (i = 0; i < ARRAY_SIZE(cfg_params); i++) {
+		ret = of_property_read_u32(np, cfg_params[i].property, &val);
+		if (!ret) {
+			config = TEGRA_PINCONF_PACK(cfg_params[i].param, val);
+			ret = add_config(&configs, &num_configs, config);
+			if (ret < 0)
+				goto exit;
+		}
+	}
+
+	reserve = 0;
+	if (function != NULL)
+		reserve++;
+	if (num_configs)
+		reserve++;
+	ret = of_property_count_strings(np, "nvidia,pins");
+	if (ret < 0)
+		goto exit;
+	reserve *= ret;
+
+	ret = reserve_map(map, reserved_maps, num_maps, reserve);
+	if (ret < 0)
+		goto exit;
+
+	of_property_for_each_string(np, "nvidia,pins", prop, group) {
+		if (function) {
+			ret = add_map_mux(map, reserved_maps, num_maps,
+					  group, function);
+			if (ret < 0)
+				goto exit;
+		}
+
+		if (num_configs) {
+			ret = add_map_configs(map, reserved_maps, num_maps,
+					      group, configs, num_configs);
+			if (ret < 0)
+				goto exit;
+		}
+	}
+
+	ret = 0;
+
+exit:
+	kfree(configs);
+	return ret;
+}
+
+int tegra_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
+				 struct device_node *np_config,
+				 struct pinctrl_map **map, unsigned *num_maps)
+{
+	unsigned reserved_maps;
+	struct device_node *np;
+	int ret;
+
+	reserved_maps = 0;
+	*map = NULL;
+	*num_maps = 0;
+
+	for_each_child_of_node(np_config, np) {
+		ret = tegra_pinctrl_dt_subnode_to_map(np, map, &reserved_maps,
+						      num_maps);
+		if (ret < 0) {
+			tegra_pinctrl_dt_free_map(pctldev, *map, *num_maps);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static struct pinctrl_ops tegra_pinctrl_ops = {
 	.list_groups = tegra_pinctrl_list_groups,
 	.get_group_name = tegra_pinctrl_get_group_name,
 	.get_group_pins = tegra_pinctrl_get_group_pins,
 	.pin_dbg_show = tegra_pinctrl_pin_dbg_show,
+	.dt_node_to_map = tegra_pinctrl_dt_node_to_map,
+	.dt_free_map = tegra_pinctrl_dt_free_map,
 };
 
 static int tegra_pinctrl_list_funcs(struct pinctrl_dev *pctldev,
-- 
1.7.0.4
