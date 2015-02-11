From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux PATCH 2/2] Add support for MIPI Pad Ctrl groups on Tegra124
Date: Wed, 11 Feb 2015 14:04:43 -0700
Message-ID: <1423688683-13249-2-git-send-email-swarren@wwwdotorg.org>
References: <1423688683-13249-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423688683-13249-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This aligns the output with what's check into the kernel. There are now
only minor white-space/formatting differences. I'll fix those in the
kernel soon, when I send patched to add Tegra210 SoC support.

Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 configs/tegra124.soc            | 30 +++++++++++++++++++
 soc-to-kernel-pinctrl-driver.py | 64 +++++++++++++++++++++++++++++++++++++++++
 tegra_pmx_soc_parser.py         | 33 +++++++++++++++++++++
 3 files changed, 127 insertions(+)

diff --git a/configs/tegra124.soc b/configs/tegra124.soc
index 1e13bba8943c..09c6e68bb7f5 100644
--- a/configs/tegra124.soc
+++ b/configs/tegra124.soc
@@ -203,6 +203,16 @@ pins = (
     ('owr',          0x3334, 'owr',    'rsvd2', 'rsvd3', 'rsvd4',       False, False, True),
     ('clk_32k_in',   0x3330, 'clk',    'rsvd2', 'rsvd3', 'rsvd4',       False, False, False),
     ('jtag_rtck',    0x32b0, 'rtck',   'rsvd2', 'rsvd3', 'rsvd4',       False, False, False),
+    ('dsi_b_clk_p',  ),
+    ('dsi_b_clk_n',  ),
+    ('dsi_b_d0_p',   ),
+    ('dsi_b_d0_n',   ),
+    ('dsi_b_d1_p',   ),
+    ('dsi_b_d1_n',   ),
+    ('dsi_b_d2_p',   ),
+    ('dsi_b_d2_n',   ),
+    ('dsi_b_d3_p',   ),
+    ('dsi_b_d3_n',   ),
 )
 
 drive_groups = (
@@ -524,3 +534,23 @@ drive_group_pins = {
         'jtag_rtck',
     ),
 }
+
+mipi_pad_ctrl_groups = {
+    #name,    r,     b, f0,    f1
+    ('dsi_b', 0x820, 1, 'csi', 'dsi_b'),
+}
+
+mipi_pad_ctrl_group_pins = {
+    'dsi_b': (
+        'dsi_b_clk_p',
+        'dsi_b_clk_n',
+        'dsi_b_d0_p',
+        'dsi_b_d0_n',
+        'dsi_b_d1_p',
+        'dsi_b_d1_n',
+        'dsi_b_d2_p',
+        'dsi_b_d2_n',
+        'dsi_b_d3_p',
+        'dsi_b_d3_n',
+    ),
+}
diff --git a/soc-to-kernel-pinctrl-driver.py b/soc-to-kernel-pinctrl-driver.py
index a6cb59eebd4e..51c5009433b0 100755
--- a/soc-to-kernel-pinctrl-driver.py
+++ b/soc-to-kernel-pinctrl-driver.py
@@ -124,6 +124,15 @@ static const unsigned %s_pins[] = {
         print('\t%s,' % pin.define)
     print('};');
 
+for group in soc.mipi_pad_ctrl_groups_by_reg():
+    print('''\
+
+static const unsigned %s_pins[] = {
+''' % group.fullname, end='')
+    for pin in group.gpios_pins:
+        print('\t%s,' % pin.define)
+    print('};');
+
 print('''\
 
 enum tegra_mux {
@@ -151,6 +160,12 @@ print('''\
 
 #define DRV_PINGROUP_REG_A		0x868	/* bank 0 */
 #define PINGROUP_REG_A			0x3000	/* bank 1 */
+''', end='')
+
+if len(soc.mipi_pad_ctrl_groups_by_reg()):
+    print('#define MIPI_PAD_CTRL_PINGROUP_REG_A	0x820	/* bank 2 */''')
+
+print('''\
 
 #define PINGROUP_REG(r)			((r) - PINGROUP_REG_A)
 
@@ -263,6 +278,40 @@ else:
 print('''\
 	}
 
+''', end='')
+
+if len(soc.mipi_pad_ctrl_groups_by_reg()):
+    print('''\
+#define MIPI_PAD_CTRL_PINGROUP_REG_Y(r)	((r) - MIPI_PAD_CTRL_PINGROUP_REG_A)
+
+#define MIPI_PAD_CTRL_PINGROUP(pg_name, r, b, f0, f1)			\\
+	{								\\
+		.name = "mipi_pad_ctrl_" #pg_name,			\\
+		.pins = mipi_pad_ctrl_##pg_name##_pins,			\\
+		.npins = ARRAY_SIZE(mipi_pad_ctrl_##pg_name##_pins),	\\
+		.funcs = {						\\
+			TEGRA_MUX_ ## f0,				\\
+			TEGRA_MUX_ ## f1,				\\
+			TEGRA_MUX_RSVD3,				\\
+			TEGRA_MUX_RSVD4,				\\
+		},							\\
+		.mux_reg = MIPI_PAD_CTRL_PINGROUP_REG_Y(r),		\\
+		.mux_bank = 2,						\\
+		.mux_bit = b,						\\
+		.pupd_reg = -1,						\\
+		.tri_reg = -1,						\\
+		.einput_bit = -1,					\\
+		.odrain_bit = -1,					\\
+		.lock_bit = -1,						\\
+		.ioreset_bit = -1,					\\
+		.rcv_sel_bit = -1,					\\
+		.drv_reg = -1,						\\
+	}
+
+''', end='')
+
+
+print('''\
 static const struct tegra_pingroup %s_groups[] = {
 ''' % soc.name, end='')
 
@@ -361,6 +410,21 @@ for drvgroup in f():
     rows.append(row)
 dump_c_table(None, 'DRV_PINGROUP', rows, col_widths=col_widths, right_justifies=right_justifies)
 
+if len(soc.mipi_pad_ctrl_groups_by_reg()):
+    print()
+    headings = ('pg_name', 'r', 'b', 'f0', 'f1')
+    rows = []
+    for group in soc.mipi_pad_ctrl_groups_by_reg():
+        row = (
+            group.name,
+            '0x%x' % group.reg,
+            repr(group.bit),
+            group.f0.upper(),
+            group.f1.upper(),
+        )
+    rows.append(row)
+    dump_c_table(headings, 'MIPI_PAD_CTRL_PINGROUP', rows )
+
 socvars = {
     'author': soc.kernel_author,
     'soc': soc.name,
diff --git a/tegra_pmx_soc_parser.py b/tegra_pmx_soc_parser.py
index 06e4b44341ea..e6335dd87cbe 100644
--- a/tegra_pmx_soc_parser.py
+++ b/tegra_pmx_soc_parser.py
@@ -85,6 +85,14 @@ class DriveGroup(ReprDictObj):
         self.gpios_pins = gpios_pins
         self.fullname = 'drive_' + self.name
 
+class MipiPadCtrlGroup(ReprDictObj):
+    def __init__(self, data, gpios_pins):
+        fields = ('name', 'reg', 'bit', 'f0', 'f1')
+        for i, field in enumerate(fields):
+            self.__setattr__(field, data[i])
+        self.gpios_pins = gpios_pins
+        self.fullname = 'mipi_pad_ctrl_' + self.name
+
 class Function(ReprDictObj):
     def __init__(self, name):
         self.name = name
@@ -126,6 +134,14 @@ class Soc(TopLevelParsedObj):
                 gpios_pins.append(gpios_pins_by_name[name])
             self._drive_groups.append(DriveGroup(drive_group, gpios_pins, self.has_drvtype))
 
+        self._mipi_pad_ctrl_groups = []
+        for group in data.get('mipi_pad_ctrl_groups', []):
+            names = data['mipi_pad_ctrl_group_pins'][group[0]]
+            gpios_pins = []
+            for name in names:
+                gpios_pins.append(gpios_pins_by_name[name])
+            self._mipi_pad_ctrl_groups.append(MipiPadCtrlGroup(group, gpios_pins))
+
         self._generate_derived_data()
 
     def _generate_derived_data(self):
@@ -143,6 +159,9 @@ class Soc(TopLevelParsedObj):
         self._drive_groups_by_reg = sorted(self._drive_groups, key=lambda drive_group: drive_group.reg)
         self._drive_groups_by_alpha = sorted(self._drive_groups, key=lambda drive_group: drive_group.name)
 
+        self._mipi_pad_ctrl_groups_by_reg = sorted(self._mipi_pad_ctrl_groups, key=lambda group: group.reg)
+        self._mipi_pad_ctrl_groups_by_alpha = sorted(self._mipi_pad_ctrl_groups, key=lambda group: group.name)
+
         functions = collections.OrderedDict()
         for pin in self._gpios + self._pins:
             if not pin.reg:
@@ -151,6 +170,11 @@ class Soc(TopLevelParsedObj):
                 if func not in functions:
                     functions[func] = Function(func)
                 functions[func]._add_pin(pin)
+        for group in self._mipi_pad_ctrl_groups:
+            for func in (group.f0, group.f1):
+                if func not in functions:
+                    functions[func] = Function(func)
+                functions[func]._add_pin(pin)
         self._functions = functions.values()
         self._functions_by_alpha = sorted(self._functions, key=lambda f: f.name)
 
@@ -201,6 +225,15 @@ class Soc(TopLevelParsedObj):
     def drive_groups_by_alpha(self):
         return self._drive_groups_by_alpha
 
+    def mipi_pad_ctrl_groups_by_conf_order(self):
+        return self._mipi_pad_ctrl_groups
+
+    def mipi_pad_ctrl_groups_by_reg(self):
+        return self._mipi_pad_ctrl_groups_by_reg
+
+    def mipi_pad_ctrl_groups_by_alpha(self):
+        return self._mipi_pad_ctrl_groups_by_alpha
+
     def functions(self):
         return self._functions
 
-- 
1.9.1
