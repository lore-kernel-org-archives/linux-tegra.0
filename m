From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2] Add MIPI pad control
Date: Tue,  9 Sep 2014 15:59:59 -0400
Message-ID: <1410292799-5913-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch adds MIPI CSI/DSIB pad control mux register
from the APB misc block to tegra pinctrl.

Without writing to this register, the dsib pads are
muxed as csi, and cannot be used.

The register is not yet documented in the TRM, here is
the description:

70000820: APB_MISC_GP_MIPI_PAD_CTRL_0
	[31:02] RESERVED
	[01:01] DSIB_MODE       [CSI=0,DSIB=1]
	[00:00] RESERVED

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
	- Renamed to mipi_pad_ctrl
	- Broke out mipi_pad_ctrl into its own soc/board array


 board-to-kernel-dt.py     |  7 +++++++
 configs/jetson-tk1.board  |  5 +++++
 configs/norrin.board      |  5 +++++
 configs/tegra124.soc      | 30 ++++++++++++++++++++++++++++++
 configs/venice2.board     |  5 +++++
 tegra_pmx_board_parser.py | 22 ++++++++++++++++++++++
 tegra_pmx_soc_parser.py   | 19 +++++++++++++++++++
 7 files changed, 93 insertions(+)

diff --git a/board-to-kernel-dt.py b/board-to-kernel-dt.py
index 86739db..62658bd 100755
--- a/board-to-kernel-dt.py
+++ b/board-to-kernel-dt.py
@@ -62,6 +62,13 @@ for pincfg in board.pincfgs_by_num():
 
 # FIXME: Handle drive groups
 
+for mpccfg in board.mpccfgs_by_conf_order():
+    print('			' + mpccfg.fullname + ' {')
+    print('				nvidia,pins = "' + mpccfg.fullname + '";')
+    print('				nvidia,function = "' + mpccfg.mux + '";')
+    print('			};')
+
+
 print('		};')
 
 board.warn_about_unconfigured_pins()
diff --git a/configs/jetson-tk1.board b/configs/jetson-tk1.board
index f69b89e..fb60017 100644
--- a/configs/jetson-tk1.board
+++ b/configs/jetson-tk1.board
@@ -196,3 +196,8 @@ pins = (
 
 drive_groups = (
 )
+
+mipi_pad_ctrl = (
+    #pin,                      mux
+    ('mipi_pad_ctrl_dsi_b',    'csi'),
+)
diff --git a/configs/norrin.board b/configs/norrin.board
index d96d366..341f816 100644
--- a/configs/norrin.board
+++ b/configs/norrin.board
@@ -196,3 +196,8 @@ pins = (
 
 drive_groups = (
 )
+
+mipi_pad_ctrl = (
+    #pin,                      mux
+    ('mipi_pad_ctrl_dsi_b',    'csi'),
+)
diff --git a/configs/tegra124.soc b/configs/tegra124.soc
index 1e13bba..bd30a6c 100644
--- a/configs/tegra124.soc
+++ b/configs/tegra124.soc
@@ -203,6 +203,16 @@ pins = (
     ('owr',          0x3334, 'owr',    'rsvd2', 'rsvd3', 'rsvd4',       False, False, True),
     ('clk_32k_in',   0x3330, 'clk',    'rsvd2', 'rsvd3', 'rsvd4',       False, False, False),
     ('jtag_rtck',    0x32b0, 'rtck',   'rsvd2', 'rsvd3', 'rsvd4',       False, False, False),
+    ('dsi_b_clk_p',  0x820,  'csi',    'dsi_b', 'rsvd3', 'rsvd4',       False, False, False),
+    ('dsi_b_clk_n',  0x820,  'csi',    'dsi_b', 'rsvd3', 'rsvd4',       False, False, False),
+    ('dsi_b_d0_p',   0x820,  'csi',    'dsi_b', 'rsvd3', 'rsvd4',       False, False, False),
+    ('dsi_b_d0_n',   0x820,  'csi',    'dsi_b', 'rsvd3', 'rsvd4',       False, False, False),
+    ('dsi_b_d1_p',   0x820,  'csi',    'dsi_b', 'rsvd3', 'rsvd4',       False, False, False),
+    ('dsi_b_d1_n',   0x820,  'csi',    'dsi_b', 'rsvd3', 'rsvd4',       False, False, False),
+    ('dsi_b_d2_p',   0x820,  'csi',    'dsi_b', 'rsvd3', 'rsvd4',       False, False, False),
+    ('dsi_b_d2_n',   0x820,  'csi',    'dsi_b', 'rsvd3', 'rsvd4',       False, False, False),
+    ('dsi_b_d3_p',   0x820,  'csi',    'dsi_b', 'rsvd3', 'rsvd4',       False, False, False),
+    ('dsi_b_d3_n',   0x820,  'csi',    'dsi_b', 'rsvd3', 'rsvd4',       False, False, False),
 )
 
 drive_groups = (
@@ -524,3 +534,23 @@ drive_group_pins = {
         'jtag_rtck',
     ),
 }
+
+mipi_pad_ctrl_groups = (
+    #name, r
+    ('dsi_b', 0x820),
+)
+
+mipi_pad_ctrl_pins = {
+    'dsi_b': (
+	    'dsi_b_clk_p',
+	    'dsi_b_clk_n',
+	    'dsi_b_d0_p',
+	    'dsi_b_d0_n',
+	    'dsi_b_d1_p',
+	    'dsi_b_d1_n',
+	    'dsi_b_d2_p',
+	    'dsi_b_d2_n',
+	    'dsi_b_d3_p',
+	    'dsi_b_d3_n',
+    ),
+}
diff --git a/configs/venice2.board b/configs/venice2.board
index ea888e8..c391e0f 100644
--- a/configs/venice2.board
+++ b/configs/venice2.board
@@ -196,3 +196,8 @@ pins = (
 
 drive_groups = (
 )
+
+mipi_pad_ctrl = (
+    #pin,                      mux
+    ('mipi_pad_ctrl_dsi_b',    'csi'),
+)
diff --git a/tegra_pmx_board_parser.py b/tegra_pmx_board_parser.py
index 7b45abe..67d8b03 100644
--- a/tegra_pmx_board_parser.py
+++ b/tegra_pmx_board_parser.py
@@ -35,6 +35,12 @@ class PinConfig(ReprDictObj):
             self.__setattr__(field, data[i])
         self.gpio_pin = soc.gpio_or_pin_by_fullname(self.fullname)
 
+class MipiPadConfig(ReprDictObj):
+    def __init__(self, soc, data):
+        fields = ('fullname', 'mux')
+        for i, field in enumerate(fields):
+            self.__setattr__(field, data[i])
+
 class Board(TopLevelParsedObj):
     def __init__(self, name, data):
         TopLevelParsedObj.__init__(self, name, (), data)
@@ -52,6 +58,11 @@ class Board(TopLevelParsedObj):
         # FIXME: fill this in...
         self.drvcfg = []
 
+        self._mpccfgs = []
+        for num, mpcdata in enumerate(data['mipi_pad_ctrl']):
+            mpccfg = MipiPadConfig(self.soc, mpcdata)
+            self._mpccfgs.append(mpccfg)
+
         self._generate_derived_data()
 
     def _generate_derived_data(self):
@@ -60,6 +71,9 @@ class Board(TopLevelParsedObj):
     def pincfgs_by_conf_order(self):
         return self._pincfgs
 
+    def mpccfgs_by_conf_order(self):
+        return self._mpccfgs;
+
     def pincfgs_by_num(self):
         return self._pincfgs_by_num
 
@@ -67,6 +81,14 @@ class Board(TopLevelParsedObj):
         unconfigured_gpio_pins = {gpio_pin.fullname for gpio_pin in self.soc.gpios_pins_by_num()}
         for gpio_pin in self.pincfgs_by_num():
             unconfigured_gpio_pins.remove(gpio_pin.gpio_pin.fullname)
+
+        for mpccfg in self.mpccfgs_by_conf_order():
+            for mpc_group in self.soc.mpc_groups_by_conf_order():
+                if mpccfg.fullname != mpc_group.fullname:
+                    continue
+                for gpio_pin in mpc_group.gpios_pins:
+                    unconfigured_gpio_pins.remove(gpio_pin.fullname)
+
         for gpio_pin in unconfigured_gpio_pins:
             print('WARNING: Unconfigured pin ' + gpio_pin, file=sys.stderr)
 
diff --git a/tegra_pmx_soc_parser.py b/tegra_pmx_soc_parser.py
index 06e4b44..5f46695 100644
--- a/tegra_pmx_soc_parser.py
+++ b/tegra_pmx_soc_parser.py
@@ -85,6 +85,14 @@ class DriveGroup(ReprDictObj):
         self.gpios_pins = gpios_pins
         self.fullname = 'drive_' + self.name
 
+class MipiPadCtrlGroup(ReprDictObj):
+    def __init__(self, data, gpios_pins):
+        fields = ('name', 'reg')
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
 
+        self._mpc_groups = []
+        for mpc_group in data['mipi_pad_ctrl_groups']:
+            names = data['mipi_pad_ctrl_pins'][mpc_group[0]]
+            gpios_pins = []
+            for name in names:
+                gpios_pins.append(gpios_pins_by_name[name])
+            self._mpc_groups.append(MipiPadCtrlGroup(mpc_group, gpios_pins))
+
         self._generate_derived_data()
 
     def _generate_derived_data(self):
@@ -201,6 +217,9 @@ class Soc(TopLevelParsedObj):
     def drive_groups_by_alpha(self):
         return self._drive_groups_by_alpha
 
+    def mpc_groups_by_conf_order(self):
+        return self._mpc_groups;
+
     def functions(self):
         return self._functions
 
-- 
2.0.0
