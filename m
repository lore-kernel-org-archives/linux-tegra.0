From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH 5/5] Support for MIPI pad ctrl groups in *.board
Date: Wed, 25 Mar 2015 12:06:17 -0600
Message-ID: <1427306777-17669-5-git-send-email-swarren@wwwdotorg.org>
References: <1427306777-17669-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427306777-17669-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Update csv-to-board.py to extract, and board-to-*.py to emit,
configuration for MIPI pad ctrl groups.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 board-to-kernel-dt.py     |  6 ++++++
 board-to-uboot.py         | 29 +++++++++++++++++++++++++++++
 csv-to-board.py           | 30 +++++++++++++++++++++++-------
 tegra_pmx_board_parser.py | 20 ++++++++++++++++++++
 4 files changed, 78 insertions(+), 7 deletions(-)

diff --git a/board-to-kernel-dt.py b/board-to-kernel-dt.py
index 394b4ac6ce9c..273f74125fa6 100755
--- a/board-to-kernel-dt.py
+++ b/board-to-kernel-dt.py
@@ -64,6 +64,12 @@ for pincfg in board.pincfgs_by_num():
 
 # FIXME: Handle drive groups
 
+for cfg in board.mipipadctrlcfgs_by_num():
+    print('			' + cfg.name + ' {')
+    print('				nvidia,pins = "mipi_pad_ctrl_' + cfg.name + '";')
+    print('				nvidia,function = "' + cfg.mux + '";')
+    print('			};')
+
 print('		};')
 
 board.warn_about_unconfigured_pins()
diff --git a/board-to-uboot.py b/board-to-uboot.py
index 8c5f11f076f7..7b20f23949bc 100755
--- a/board-to-uboot.py
+++ b/board-to-uboot.py
@@ -205,6 +205,35 @@ static const struct pmux_drvgrp_config %s_drvgrps[] = {
 print('''\
 };
 
+''', end='')
+
+if len(board.mipipadctrlcfgs_by_num()):
+    print('''\
+#define MIPIPADCTRLCFG(_grp, _mux) \\
+	{							\\
+		.grp		= PMUX_MIPIPADCTRLGRP_##_grp,	\\
+		.func		= PMUX_FUNC_##_mux,		\\
+	}
+
+static const struct pmux_mipipadctrlgrp_config %s_mipipadctrlgrps[] = {
+''' % board.varname, end='')
+
+    mipipadctrl_table = []
+    for cfg in board.mipipadctrlcfgs_by_num():
+        row = (
+            cfg.name.upper(),
+            mapper_mux(cfg.mux),
+        )
+        mipipadctrl_table.append(row)
+    headings = ('grp', 'mux')
+    dump_c_table(headings, 'MIPIPADCTRLCFG', mipipadctrl_table)
+
+    print('''\
+};
+
+''', end='')
+
+print('''\
 #endif /* PINMUX_CONFIG_%s_H */
 ''' % board.definename, end='')
 
diff --git a/csv-to-board.py b/csv-to-board.py
index b2d1c46ec302..68653588ef69 100755
--- a/csv-to-board.py
+++ b/csv-to-board.py
@@ -173,6 +173,7 @@ def rcv_sel_munge(d):
 
 found_header = False
 pin_table = []
+mipi_table = []
 with open(board_conf['filename'], newline='') as fh:
     csv = csv.reader(fh)
     lnum = 0
@@ -203,6 +204,12 @@ with open(board_conf['filename'], newline='') as fh:
             continue
 
         ball_name = row[cols[COL_BALL_NAME]].lower()
+        if ball_name.startswith('mipi_pad_ctrl_'):
+            ball_name = ball_name[14:]
+            mipi = soc.mipi_pad_ctrl_group_by_name(ball_name)
+        else:
+            mipi = None
+
         if cols[COL_BALL_MID]:
             ball_mid = row[cols[COL_BALL_MID]]
         else:
@@ -212,12 +219,17 @@ with open(board_conf['filename'], newline='') as fh:
         else:
             ball_dsc = None
 
+
         # Section title row
-        if not ball_mid and not ball_dsc:
+        if not ball_mid and not ball_dsc and not mipi:
             continue
 
         mux = func_munge(row[cols[COL_MUX]].lower())
 
+        if mipi:
+            mipi_table.append((repr(mipi.name), repr(mux)))
+            continue
+
         # Pin not affected by pinmux
         if mux in ('', '0', '#n/a'):
             continue
@@ -286,21 +298,25 @@ with open(board_conf['filename'], newline='') as fh:
 
         pin_table.append((repr(gpio_pin.fullname), repr(mux), repr(gpio_init), repr(pupd), repr(tri), repr(e_input), repr(od), repr(rcv_sel)))
 
-headings = ('pin', 'mux', 'gpio_init', 'pull', 'tri', 'e_inp', 'od')
+pin_headings = ('pin', 'mux', 'gpio_init', 'pull', 'tri', 'e_inp', 'od')
 if soc.soc_pins_have_e_io_hv:
-    headings += ('e_io_hv',)
+    pin_headings += ('e_io_hv',)
 if soc.soc_pins_have_rcv_sel:
-    headings += ('rcv_sel',)
+    pin_headings += ('rcv_sel',)
+
+mipi_headings = ('pin', 'mux')
 
 cfgfile = os.path.join('configs', args.board + '.board')
 with open(cfgfile, 'wt') as fh:
     print('soc = \'%s\'' % board_conf['soc'], file=fh)
     print(file=fh)
     print('pins = (', file=fh)
-
-    dump_py_table(headings, pin_table, file=fh)
-
+    dump_py_table(pin_headings, pin_table, file=fh)
     print(')', file=fh)
     print('', file=fh)
     print('drive_groups = (', file=fh)
     print(')', file=fh)
+    print('', file=fh)
+    print('mipi_pad_ctrl_groups = (', file=fh)
+    dump_py_table(mipi_headings, mipi_table, file=fh)
+    print(')', file=fh)
diff --git a/tegra_pmx_board_parser.py b/tegra_pmx_board_parser.py
index b72bc8bffc06..f47947dd7ed5 100644
--- a/tegra_pmx_board_parser.py
+++ b/tegra_pmx_board_parser.py
@@ -37,6 +37,13 @@ class PinConfig(ReprDictObj):
             self.__setattr__(field, data[i])
         self.gpio_pin = soc.gpio_or_pin_by_fullname(self.fullname)
 
+class MipiPadCtrlConfig(ReprDictObj):
+    def __init__(self, soc, data):
+        fields = ('name', 'mux')
+        for i, field in enumerate(fields):
+            self.__setattr__(field, data[i])
+        self.mipi_pad_ctrl_group = soc.mipi_pad_ctrl_group_by_name(self.name)
+
 class Board(TopLevelParsedObj):
     def __init__(self, name, data):
         TopLevelParsedObj.__init__(self, name, (), data)
@@ -54,10 +61,17 @@ class Board(TopLevelParsedObj):
         # FIXME: fill this in...
         self.drvcfg = []
 
+        self._mipipadctrlcfgs = []
+        if 'mipi_pad_ctrl_groups' in data:
+            for num, pindata in enumerate(data['mipi_pad_ctrl_groups']):
+                mipipadctrlcfg = MipiPadCtrlConfig(self.soc, pindata)
+                self._mipipadctrlcfgs.append(mipipadctrlcfg)
+
         self._generate_derived_data()
 
     def _generate_derived_data(self):
         self._pincfgs_by_num = sorted(self._pincfgs, key=lambda pincfg: pincfg.gpio_pin.sort_by_num_key())
+        self._mipipadctrlcfgs_by_num = sorted(self._mipipadctrlcfgs, key=lambda cfg: cfg.mipi_pad_ctrl_group.reg)
 
     def pincfgs_by_conf_order(self):
         return self._pincfgs
@@ -65,6 +79,12 @@ class Board(TopLevelParsedObj):
     def pincfgs_by_num(self):
         return self._pincfgs_by_num
 
+    def mipipadctrlcfgs_by_conf_order(self):
+        return self._mipipadctrlcfgs
+
+    def mipipadctrlcfgs_by_num(self):
+        return self._mipipadctrlcfgs_by_num
+
     def warn_about_unconfigured_pins(self):
         unconfigured_gpio_pins = [gpio_pin.fullname for gpio_pin in self.soc.gpios_pins_by_num() if gpio_pin.reg]
         for gpio_pin in self.pincfgs_by_num():
-- 
1.9.1
