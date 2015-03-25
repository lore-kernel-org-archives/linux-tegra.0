From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH 4/5] Add support for MIPI pad ctrl groups in U-Boot driver generator
Date: Wed, 25 Mar 2015 12:06:16 -0600
Message-ID: <1427306777-17669-4-git-send-email-swarren@wwwdotorg.org>
References: <1427306777-17669-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427306777-17669-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 configs/tegra124.soc    |  1 +
 soc-to-uboot-driver.py  | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 tegra_pmx_soc_parser.py |  9 ++++++-
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/configs/tegra124.soc b/configs/tegra124.soc
index daf437419d6c..aaeaab85caf7 100644
--- a/configs/tegra124.soc
+++ b/configs/tegra124.soc
@@ -23,6 +23,7 @@ soc_pins_have_od = True
 soc_pins_have_rcv_sel = True
 soc_pins_have_schmitt = False
 soc_drv_reg_base = 0x868
+soc_mipipadctrl_reg_base = 0x820
 soc_einput_b = 5
 soc_odrain_b = 6
 
diff --git a/soc-to-uboot-driver.py b/soc-to-uboot-driver.py
index 8469af94dec2..50e0dc1b5baa 100755
--- a/soc-to-uboot-driver.py
+++ b/soc-to-uboot-driver.py
@@ -85,6 +85,28 @@ for group in soc.drive_groups_by_reg():
 print('''\
 	PMUX_DRVGRP_COUNT,
 };
+''', file=f, end='')
+
+if len(soc.mipi_pad_ctrl_groups_by_reg()):
+    print('''\
+
+enum pmux_mipipadctrlgrp {
+''', file=f, end='')
+
+    last_reg = soc.soc_mipipadctrl_reg_base - 4
+    for group in soc.mipi_pad_ctrl_groups_by_reg():
+        if group.reg != last_reg + 4:
+            eqs = ' = (0x%x / 4)' % (group.reg - soc.soc_mipipadctrl_reg_base)
+        else:
+            eqs = ''
+        print('\tPMUX_MIPIPADCTRLGRP_%s%s,' % (group.name.upper(), eqs), file=f)
+
+    print('''\
+	PMUX_MIPIPADCTRLGRP_COUNT,
+};
+''', file=f, end='')
+
+print('''\
 
 enum pmux_func {
 	PMUX_FUNC_DEFAULT,
@@ -107,11 +129,17 @@ print('''\
 ''' % tuple(soc.soc_rsvd_base + i for i in range(4)), file=f, end='')
 
 print('#define TEGRA_PMX_SOC_DRV_GROUP_BASE_REG 0x%x' % soc.soc_drv_reg_base, file=f)
+if len(soc.mipi_pad_ctrl_groups_by_reg()):
+    print('#define TEGRA_PMX_SOC_MIPIPADCTRL_BASE_REG 0x%x' % soc.soc_mipipadctrl_reg_base, file=f)
+
 if soc.soc_has_io_clamping:
     print('#define TEGRA_PMX_SOC_HAS_IO_CLAMPING', file=f)
 
 print('#define TEGRA_PMX_SOC_HAS_DRVGRPS', file=f)
 
+if len(soc.mipi_pad_ctrl_groups_by_reg()):
+    print('#define TEGRA_PMX_SOC_HAS_MIPI_PAD_CTRL_GRPS', file=f)
+
 if soc.soc_drvgroups_have_lpmd:
     print('#define TEGRA_PMX_GRPS_HAVE_LPMD', file=f)
 
@@ -193,4 +221,41 @@ print('''\
 const struct pmux_pingrp_desc *tegra_soc_pingroups = %s_pingroups;
 ''' % soc.name, file=f, end='')
 
+if len(soc.mipi_pad_ctrl_groups_by_reg()):
+    print('''\
+
+#define MIPIPADCTRL_GRP(grp, f0, f1)	\\
+	{				\\
+		.funcs = {		\\
+			PMUX_FUNC_##f0,	\\
+			PMUX_FUNC_##f1,	\\
+		},			\\
+	}
+
+#define MIPIPADCTRL_RESERVED {}
+
+static const struct pmux_mipipadctrlgrp_desc %s_mipipadctrl_groups[] = {
+''' % soc.name, file=f, end='')
+
+    headings = ('pin', 'f0', 'f1')
+    rows = []
+    last_reg = 0
+    for grp in soc.mipi_pad_ctrl_groups_by_reg():
+        if grp.reg != last_reg + 4:
+            if last_reg:
+                for i in range(((grp.reg - last_reg) // 4) - 1):
+                    rows.append('\tMIPIPACTRL_RESERVED,',)
+            rows.append('\t/* Offset 0x%x */' % grp.reg,)
+        last_reg = grp.reg
+        row = (grp.name.upper(),)
+        for i in range(2):
+            row += (grp.funcs[i].upper(),)
+        rows.append(row)
+    dump_c_table(headings, 'MIPIPADCTRL_GRP', rows, file=f)
+
+    print('''\
+};
+const struct pmux_mipipadctrlgrp_desc *tegra_soc_mipipadctrl_groups = %s_mipipadctrl_groups;
+''' % soc.name, file=f, end='')
+
 f.close()
diff --git a/tegra_pmx_soc_parser.py b/tegra_pmx_soc_parser.py
index a07c303d7df9..2b5d17001e58 100644
--- a/tegra_pmx_soc_parser.py
+++ b/tegra_pmx_soc_parser.py
@@ -126,6 +126,7 @@ class MipiPadCtrlGroup(ReprDictObj):
             self.__setattr__(field, data[i])
         self.gpios_pins = gpios_pins
         self.fullname = 'mipi_pad_ctrl_' + self.name
+        self.funcs = (self.f0, self.f1)
 
 class Function(ReprDictObj):
     def __init__(self, name):
@@ -158,6 +159,7 @@ class Soc(TopLevelParsedObj):
             ('soc_pins_have_rcv_sel', None),
             ('soc_pins_have_schmitt', None),
             ('soc_drv_reg_base', None),
+            ('soc_mipipadctrl_reg_base', 0),
             ('soc_einput_b', None),
             ('soc_odrain_b', None),
         )
@@ -228,7 +230,6 @@ class Soc(TopLevelParsedObj):
             for func in (group.f0, group.f1):
                 if func not in functions:
                     functions[func] = Function(func)
-                functions[func]._add_pin(pin)
         self._functions = functions.values()
         self._functions_by_alpha = sorted(self._functions, key=lambda f: f.name)
 
@@ -288,6 +289,12 @@ class Soc(TopLevelParsedObj):
     def mipi_pad_ctrl_groups_by_alpha(self):
         return self._mipi_pad_ctrl_groups_by_alpha
 
+    def mipi_pad_ctrl_group_by_name(self, name):
+        for mipi_pad_ctrl in self._mipi_pad_ctrl_groups:
+            if name == mipi_pad_ctrl.name:
+                return mipi_pad_ctrl
+        return None
+
     def functions(self):
         return self._functions
 
-- 
1.9.1
