From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [pinmux scripts PATCH 1/2] soc: Avoid parked_reg and parked_bank
Date: Tue, 3 May 2016 00:16:44 +0530
Message-ID: <1462214805-26735-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

NVIDIA's Tegra210 support the park bit to make pinmux configuration
enable/disable. If parked bit is 1 then configuration does not apply
and if it is 0 then pinmux configuration applies. This is to support
to avoid any glitch in pinmux configurations.

The parked bit is part of mux register and mux bank and hence it is
not required to have member for the parked_reg and parked bank very
similar to other bit field of the same register.

Remove the need of the parked register and parked bank and get whether
parked function supported or not by parked_bit.

This is to make the parked bit handling same as other fields of mux
registers.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 configs/tegra114.soc            | 1 -
 configs/tegra124.soc            | 1 -
 configs/tegra210.soc            | 1 -
 configs/tegra30.soc             | 1 -
 soc-to-kernel-pinctrl-driver.py | 8 +++-----
 tegra_pmx_soc_parser.py         | 1 -
 6 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/configs/tegra114.soc b/configs/tegra114.soc
index dd47072..a70bdf9 100644
--- a/configs/tegra114.soc
+++ b/configs/tegra114.soc
@@ -25,7 +25,6 @@ soc_pins_have_schmitt = False
 soc_drv_reg_base = 0x868
 soc_einput_b = 5
 soc_odrain_b = 6
-soc_parked_bank = 0
 soc_parked_bit = 0
 
 gpios = (
diff --git a/configs/tegra124.soc b/configs/tegra124.soc
index 6e8762c..1012c7c 100644
--- a/configs/tegra124.soc
+++ b/configs/tegra124.soc
@@ -27,7 +27,6 @@ soc_drv_reg_base = 0x868
 soc_mipipadctrl_reg_base = 0x820
 soc_einput_b = 5
 soc_odrain_b = 6
-soc_parked_bank = 0
 soc_parked_bit = 0
 
 gpios = (
diff --git a/configs/tegra210.soc b/configs/tegra210.soc
index 25e4618..970802b 100644
--- a/configs/tegra210.soc
+++ b/configs/tegra210.soc
@@ -22,7 +22,6 @@ soc_pins_have_schmitt = True
 soc_drv_reg_base = 0x8d4
 soc_einput_b = 6
 soc_odrain_b = 11
-soc_parked_bank = 1
 soc_parked_bit = 5
 
 gpios = (
diff --git a/configs/tegra30.soc b/configs/tegra30.soc
index ff57b45..28073c1 100644
--- a/configs/tegra30.soc
+++ b/configs/tegra30.soc
@@ -22,7 +22,6 @@ soc_pins_have_schmitt = False
 soc_drv_reg_base = 0x868
 soc_einput_b = 5
 soc_odrain_b = 6
-soc_parked_bank = 0
 soc_parked_bit = 0
 
 gpios = (
diff --git a/soc-to-kernel-pinctrl-driver.py b/soc-to-kernel-pinctrl-driver.py
index 3f69a46..f5851f5 100755
--- a/soc-to-kernel-pinctrl-driver.py
+++ b/soc-to-kernel-pinctrl-driver.py
@@ -261,13 +261,11 @@ s += '''\
 
 if soc.soc_pins_all_have_parked:
     s += '''\
-		.parked_reg = PINGROUP_REG(r),
-		.parked_bank = %s,
 		.parked_bit = %s,
-''' % (soc.soc_parked_bank, soc.soc_parked_bit)
+''' % (soc.soc_parked_bit)
 else:
     s+= '''\
-		.parked_reg = -1,
+		.parked_bit = -1,
 '''
 
 if soc.soc_pins_have_hsm:
@@ -369,7 +367,7 @@ s += '''\
 		.rcv_sel_bit = -1,
 		.drv_reg = DRV_PINGROUP_REG(r),
 		.drv_bank = 0,
-		.parked_reg = -1,
+		.parked_bit = -1,
 		.hsm_bit = %(hsm_bit_val)s,
 		.schmitt_bit = %(schmitt_bit_val)s,
 		.lpmd_bit = %(lpmd_bit_val)s,
diff --git a/tegra_pmx_soc_parser.py b/tegra_pmx_soc_parser.py
index a258f8a..891a68f 100644
--- a/tegra_pmx_soc_parser.py
+++ b/tegra_pmx_soc_parser.py
@@ -163,7 +163,6 @@ class Soc(TopLevelParsedObj):
             ('soc_mipipadctrl_reg_base', 0),
             ('soc_einput_b', None),
             ('soc_odrain_b', None),
-            ('soc_parked_bank', None),
             ('soc_parked_bit', None),
         )
         TopLevelParsedObj.__init__(self, name, copy_attrs, data)
-- 
2.1.4
