From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [pinmux scripts PATCH v3] soc: Add support for Parked bits for Tegra210
Date: Thu, 7 Apr 2016 16:55:37 -0400
Message-ID: <1460062537-26011-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra210 has a parked bit for each pin. Add code to express this by
updating the kernel driver MACROs to add in parked_* fields so that
the kernel can handle them as it sees fit.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v3:
 - renamed soc_pins_have_parked->soc_pins_all_have_parked
 - reordered things to be sorted alphabetically

v2:
 - reformated commit msg

 configs/tegra114.soc            |  3 +++
 configs/tegra124.soc            |  3 +++
 configs/tegra210.soc            |  3 +++
 configs/tegra30.soc             |  3 +++
 soc-to-kernel-pinctrl-driver.py | 12 ++++++++++++
 tegra_pmx_soc_parser.py         |  3 +++
 6 files changed, 27 insertions(+)

diff --git a/configs/tegra114.soc b/configs/tegra114.soc
index 64454c0625db..dd47072e9cdf 100644
--- a/configs/tegra114.soc
+++ b/configs/tegra114.soc
@@ -13,6 +13,7 @@ soc_drvgroups_have_hsm = True
 soc_drvgroups_have_lpmd = True
 soc_drvgroups_have_schmitt = True
 soc_pins_all_have_od = False
+soc_pins_all_have_parked = False
 soc_pins_all_have_schmitt = False
 soc_pins_have_drvtype = False
 soc_pins_have_e_io_hv = False
@@ -24,6 +25,8 @@ soc_pins_have_schmitt = False
 soc_drv_reg_base = 0x868
 soc_einput_b = 5
 soc_odrain_b = 6
+soc_parked_bank = 0
+soc_parked_bit = 0
 
 gpios = (
     #name,                gpio,  reg,    f0,           f1,         f2,             f3,         od,    ior,   rcv_sel
diff --git a/configs/tegra124.soc b/configs/tegra124.soc
index aaeaab85caf7..6e8762ca0cb7 100644
--- a/configs/tegra124.soc
+++ b/configs/tegra124.soc
@@ -14,6 +14,7 @@ soc_drvgroups_have_hsm = True
 soc_drvgroups_have_lpmd = True
 soc_drvgroups_have_schmitt = True
 soc_pins_all_have_od = False
+soc_pins_all_have_parked = False
 soc_pins_all_have_schmitt = False
 soc_pins_have_drvtype = False
 soc_pins_have_e_io_hv = False
@@ -26,6 +27,8 @@ soc_drv_reg_base = 0x868
 soc_mipipadctrl_reg_base = 0x820
 soc_einput_b = 5
 soc_odrain_b = 6
+soc_parked_bank = 0
+soc_parked_bit = 0
 
 gpios = (
     #name,                gpio,  reg,    f0,           f1,         f2,             f3,            od,    ior,   rcv_sel
diff --git a/configs/tegra210.soc b/configs/tegra210.soc
index 786b0950b85a..25e4618111f4 100644
--- a/configs/tegra210.soc
+++ b/configs/tegra210.soc
@@ -10,6 +10,7 @@ soc_drvgroups_have_hsm = False
 soc_drvgroups_have_lpmd = False
 soc_drvgroups_have_schmitt = False
 soc_pins_all_have_od = True
+soc_pins_all_have_parked = True
 soc_pins_all_have_schmitt = True
 soc_pins_have_drvtype = True
 soc_pins_have_e_io_hv = True
@@ -21,6 +22,8 @@ soc_pins_have_schmitt = True
 soc_drv_reg_base = 0x8d4
 soc_einput_b = 6
 soc_odrain_b = 11
+soc_parked_bank = 1
+soc_parked_bit = 5
 
 gpios = (
     #name,              gpio,  reg,    f0,           f1,       f2,      f3,      hsm,   drvtype, e_io_hv
diff --git a/configs/tegra30.soc b/configs/tegra30.soc
index fd6c6ad7e750..ff57b455b1de 100644
--- a/configs/tegra30.soc
+++ b/configs/tegra30.soc
@@ -10,6 +10,7 @@ soc_drvgroups_have_hsm = True
 soc_drvgroups_have_lpmd = True
 soc_drvgroups_have_schmitt = True
 soc_pins_all_have_od = False
+soc_pins_all_have_parked = False
 soc_pins_all_have_schmitt = False
 soc_pins_have_drvtype = False
 soc_pins_have_e_io_hv = False
@@ -21,6 +22,8 @@ soc_pins_have_schmitt = False
 soc_drv_reg_base = 0x868
 soc_einput_b = 5
 soc_odrain_b = 6
+soc_parked_bank = 0
+soc_parked_bit = 0
 
 gpios = (
     #name,              gpio,  reg,    f0,            f1,         f2,         f3,         od,    ior
diff --git a/soc-to-kernel-pinctrl-driver.py b/soc-to-kernel-pinctrl-driver.py
index 46547b194d33..3f69a467e214 100755
--- a/soc-to-kernel-pinctrl-driver.py
+++ b/soc-to-kernel-pinctrl-driver.py
@@ -259,6 +259,17 @@ s += '''\
 		.rcv_sel_bit = %(rcv_sel_val)s
 ''' % globals()
 
+if soc.soc_pins_all_have_parked:
+    s += '''\
+		.parked_reg = PINGROUP_REG(r),
+		.parked_bank = %s,
+		.parked_bit = %s,
+''' % (soc.soc_parked_bank, soc.soc_parked_bit)
+else:
+    s+= '''\
+		.parked_reg = -1,
+'''
+
 if soc.soc_pins_have_hsm:
     s += '''\
 		.hsm_bit = PINGROUP_BIT_##hsm(9),
@@ -358,6 +369,7 @@ s += '''\
 		.rcv_sel_bit = -1,
 		.drv_reg = DRV_PINGROUP_REG(r),
 		.drv_bank = 0,
+		.parked_reg = -1,
 		.hsm_bit = %(hsm_bit_val)s,
 		.schmitt_bit = %(schmitt_bit_val)s,
 		.lpmd_bit = %(lpmd_bit_val)s,
diff --git a/tegra_pmx_soc_parser.py b/tegra_pmx_soc_parser.py
index 2b5d17001e58..a258f8a79139 100644
--- a/tegra_pmx_soc_parser.py
+++ b/tegra_pmx_soc_parser.py
@@ -150,6 +150,7 @@ class Soc(TopLevelParsedObj):
             ('soc_drvgroups_have_lpmd', None),
             ('soc_drvgroups_have_schmitt', None),
             ('soc_pins_all_have_od', None),
+            ('soc_pins_all_have_parked', None),
             ('soc_pins_all_have_schmitt', None),
             ('soc_pins_have_drvtype', None),
             ('soc_pins_have_e_io_hv', None),
@@ -162,6 +163,8 @@ class Soc(TopLevelParsedObj):
             ('soc_mipipadctrl_reg_base', 0),
             ('soc_einput_b', None),
             ('soc_odrain_b', None),
+            ('soc_parked_bank', None),
+            ('soc_parked_bit', None),
         )
         TopLevelParsedObj.__init__(self, name, copy_attrs, data)
 
-- 
1.9.1
