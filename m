From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH] Support Tegra210
Date: Tue, 24 Feb 2015 13:47:54 -0700
Message-ID: <1424810874-21783-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra210 changes the pinmux HW in a few ways; at least:

- The set of drive groups is much more 1:1 with the set of pins. Most
  pins have an associated drive group register as well as an associated
  pinmux register, and most drive groups cover a single pin.
- Some register fields have moved from the drive group registers into
  the pinmux registers.
- The set of available options for each pin and group varies relative to
  previous chips, and hence the register layouts vary a bit too.

This patch updates tegra-pinmux-scripts minimally to handle these
changes, to a level equivalent to the support for previous chips. For
example, some new options such as per-pin schmitt aren't handled since
the syseng-supplied pinmux spreadsheets don't provide a value for this
option.

csv-to-board-tegra124-xlsx.py is renamed to csv-to-board.py since it now
supports boards using different SoCs, and it's not worth encoding all
supported SoCs in the filename (Tegra30/114 aren't supported by it, hence
the previous naming).

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch doesn't add any Tegra210 board files yet. Hopefully they'll
appear soon. I've tested this patch with some board files I created
locally.

 board-to-kernel-dt.py                            |   4 +-
 board-to-uboot.py                                |  66 +-
 configs/tegra114.soc                             |  20 +
 configs/tegra124.soc                             |  20 +
 configs/tegra210.soc                             | 804 +++++++++++++++++++++++
 configs/tegra30.soc                              |  21 +-
 csv-to-board-tegra124-xlsx.py => csv-to-board.py |  67 +-
 kernel-pinctrl-driver-to-soc.py                  | 200 ++++--
 soc-to-kernel-pinctrl-driver.py                  | 390 ++++++++---
 soc-to-uboot-driver.py                           |  47 +-
 tegra_pmx_board_parser.py                        |   4 +-
 tegra_pmx_parser_utils.py                        |   2 +
 tegra_pmx_soc_parser.py                          | 102 ++-
 tegra_pmx_utils.py                               |  52 +-
 14 files changed, 1572 insertions(+), 227 deletions(-)
 create mode 100644 configs/tegra210.soc
 rename csv-to-board-tegra124-xlsx.py => csv-to-board.py (80%)

diff --git a/board-to-kernel-dt.py b/board-to-kernel-dt.py
index 20f27c3899c7..394b4ac6ce9c 100755
--- a/board-to-kernel-dt.py
+++ b/board-to-kernel-dt.py
@@ -56,8 +56,10 @@ for pincfg in board.pincfgs_by_num():
     print('				nvidia,enable-input = <' + mapper_bool(pincfg.e_inp) + '>;')
     if pincfg.gpio_pin.od:
         print('				nvidia,open-drain = <' + mapper_bool(pincfg.od) + '>;')
-    if hasattr(pincfg.gpio_pin, 'rcv_sel') and pincfg.gpio_pin.rcv_sel:
+    if board.soc.soc_pins_have_rcv_sel and pincfg.gpio_pin.rcv_sel and hasattr(pincfg.gpio_pin, 'rcv_sel'):
         print('				nvidia,rcv-sel = <' + mapper_bool(pincfg.rcv_sel) + '>;')
+    if board.soc.soc_pins_have_e_io_hv and pincfg.gpio_pin.e_io_hv and hasattr(pincfg.gpio_pin, 'e_io_hv'):
+        print('				nvidia,io-hv = <' + mapper_bool(pincfg.e_io_hv) + '>;')
     print('			};')
 
 # FIXME: Handle drive groups
diff --git a/board-to-uboot.py b/board-to-uboot.py
index c67919176a3f..f47f6f6c47b3 100755
--- a/board-to-uboot.py
+++ b/board-to-uboot.py
@@ -80,17 +80,48 @@ dump_c_table(headings, 'GPIO_INIT', gpio_table)
 print('''\
 };
 
-#define PINCFG(_pingrp, _mux, _pull, _tri, _io, _od, _rcv_sel)	\\
-	{							\\
-		.pingrp		= PMUX_PINGRP_##_pingrp,	\\
-		.func		= PMUX_FUNC_##_mux,		\\
-		.pull		= PMUX_PULL_##_pull,		\\
-		.tristate	= PMUX_TRI_##_tri,		\\
-		.io		= PMUX_PIN_##_io,		\\
-		.od		= PMUX_PIN_OD_##_od,		\\
-		.rcv_sel	= PMUX_PIN_RCV_SEL_##_rcv_sel,	\\
-		.lock		= PMUX_PIN_LOCK_DEFAULT,	\\
-		.ioreset	= PMUX_PIN_IO_RESET_DEFAULT,	\\
+''', end='')
+
+params = ['_pingrp', '_mux', '_pull', '_tri', '_io', '_od']
+if board.soc.soc_pins_have_rcv_sel:
+    params += ['_rcv_sel',]
+if board.soc.soc_pins_have_e_io_hv:
+    params += ['_e_io_hv',]
+s = gen_wrapped_c_macro_header('PINCFG', params)
+
+s += '''\
+	{
+		.pingrp		= PMUX_PINGRP_##_pingrp,
+		.func		= PMUX_FUNC_##_mux,
+		.pull		= PMUX_PULL_##_pull,
+		.tristate	= PMUX_TRI_##_tri,
+		.io		= PMUX_PIN_##_io,
+		.od		= PMUX_PIN_OD_##_od,
+'''
+
+if board.soc.soc_pins_have_rcv_sel:
+	s += '''\
+		.rcv_sel	= PMUX_PIN_RCV_SEL_##_rcv_sel,
+'''
+
+if board.soc.soc_pins_have_e_io_hv:
+	s += '''\
+		.e_io_hv	= PMUX_PIN_E_IO_HV_##_e_io_hv,
+'''
+
+s += '''\
+		.lock		= PMUX_PIN_LOCK_DEFAULT,
+'''
+
+if board.soc.soc_pins_have_ior:
+	s += '''\
+		.ioreset	= PMUX_PIN_IO_RESET_DEFAULT,
+'''
+
+s = append_aligned_tabs_indent_with_tabs(s)
+print(s)
+
+print('''\
 	}
 
 static const struct pmux_pingrp_config %(board_varname)s_pingrps[] = {
@@ -125,6 +156,11 @@ def mapper_rcv_sel(gpio_pin, val):
         return 'DEFAULT'
     return {False: 'NORMAL', True: 'HIGH'}[val]
 
+def mapper_e_io_hv(gpio_pin, val):
+    if not gpio_pin.e_io_hv:
+        return 'DEFAULT'
+    return {False: 'NORMAL', True: 'HIGH'}[val]
+
 pincfg_table = []
 for pincfg in board.pincfgs_by_num():
     row = (
@@ -135,12 +171,16 @@ for pincfg in board.pincfgs_by_num():
         mapper_e_input(pincfg.e_inp),
         mapper_od(pincfg.gpio_pin, pincfg.od),
     )
-    if board.soc.has_rcv_sel:
+    if board.soc.soc_pins_have_rcv_sel:
         row += (mapper_rcv_sel(pincfg.gpio_pin, pincfg.rcv_sel),)
+    if board.soc.soc_pins_have_e_io_hv:
+        row += (mapper_e_io_hv(pincfg.gpio_pin, pincfg.e_io_hv),)
     pincfg_table.append(row)
 headings = ('pingrp', 'mux', 'pull', 'tri', 'e_input', 'od')
-if board.soc.has_rcv_sel:
+if board.soc.soc_pins_have_rcv_sel:
     headings += ('rcv_sel',)
+if board.soc.soc_pins_have_e_io_hv:
+    headings += ('e_io_hv',)
 dump_c_table(headings, 'PINCFG', pincfg_table)
 
 print('''\
diff --git a/configs/tegra114.soc b/configs/tegra114.soc
index 92ee4e7172e7..64454c0625db 100644
--- a/configs/tegra114.soc
+++ b/configs/tegra114.soc
@@ -5,6 +5,26 @@ kernel_copyright_years = '2012-2013'
 kernel_author = 'Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>'
 uboot_copyright_years = '2010-2014'
 
+soc_has_io_clamping = True
+soc_combine_pin_drvgroup = False
+soc_rsvd_base = 1
+soc_drvgroups_have_drvtype = True
+soc_drvgroups_have_hsm = True
+soc_drvgroups_have_lpmd = True
+soc_drvgroups_have_schmitt = True
+soc_pins_all_have_od = False
+soc_pins_all_have_schmitt = False
+soc_pins_have_drvtype = False
+soc_pins_have_e_io_hv = False
+soc_pins_have_hsm = False
+soc_pins_have_ior = True
+soc_pins_have_od = True
+soc_pins_have_rcv_sel = True
+soc_pins_have_schmitt = False
+soc_drv_reg_base = 0x868
+soc_einput_b = 5
+soc_odrain_b = 6
+
 gpios = (
     #name,                gpio,  reg,    f0,           f1,         f2,             f3,         od,    ior,   rcv_sel
     ('clk_32k_out',       'a0',  0x331c, 'blink',      'soc',      'rsvd3',        'rsvd4',    False, False, False),
diff --git a/configs/tegra124.soc b/configs/tegra124.soc
index 09c6e68bb7f5..daf437419d6c 100644
--- a/configs/tegra124.soc
+++ b/configs/tegra124.soc
@@ -6,6 +6,26 @@ kernel_copyright_years = '2013-2014'
 kernel_author = 'Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>'
 uboot_copyright_years = '2013-2014'
 
+soc_has_io_clamping = True
+soc_combine_pin_drvgroup = False
+soc_rsvd_base = 1
+soc_drvgroups_have_drvtype = True
+soc_drvgroups_have_hsm = True
+soc_drvgroups_have_lpmd = True
+soc_drvgroups_have_schmitt = True
+soc_pins_all_have_od = False
+soc_pins_all_have_schmitt = False
+soc_pins_have_drvtype = False
+soc_pins_have_e_io_hv = False
+soc_pins_have_hsm = False
+soc_pins_have_ior = True
+soc_pins_have_od = True
+soc_pins_have_rcv_sel = True
+soc_pins_have_schmitt = False
+soc_drv_reg_base = 0x868
+soc_einput_b = 5
+soc_odrain_b = 6
+
 gpios = (
     #name,                gpio,  reg,    f0,           f1,         f2,             f3,            od,    ior,   rcv_sel
     ('clk_32k_out',       'a0',  0x331c, 'blink',      'soc',      'rsvd3',        'rsvd4',       False, False, False),
diff --git a/configs/tegra210.soc b/configs/tegra210.soc
new file mode 100644
index 000000000000..786b0950b85a
--- /dev/null
+++ b/configs/tegra210.soc
@@ -0,0 +1,804 @@
+kernel_copyright_years = '2015'
+kernel_author = 'NVIDIA'
+uboot_copyright_years = '2015'
+
+soc_has_io_clamping = True
+soc_combine_pin_drvgroup = True
+soc_rsvd_base = 0
+soc_drvgroups_have_drvtype = False
+soc_drvgroups_have_hsm = False
+soc_drvgroups_have_lpmd = False
+soc_drvgroups_have_schmitt = False
+soc_pins_all_have_od = True
+soc_pins_all_have_schmitt = True
+soc_pins_have_drvtype = True
+soc_pins_have_e_io_hv = True
+soc_pins_have_hsm = True
+soc_pins_have_ior = False
+soc_pins_have_od = True
+soc_pins_have_rcv_sel = False
+soc_pins_have_schmitt = True
+soc_drv_reg_base = 0x8d4
+soc_einput_b = 6
+soc_odrain_b = 11
+
+gpios = (
+    #name,              gpio,  reg,    f0,           f1,       f2,      f3,      hsm,   drvtype, e_io_hv
+    ('pex_l0_rst_n',    'a0',  0x3038, 'pe0',        'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('pex_l0_clkreq_n', 'a1',  0x303c, 'pe0',        'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('pex_wake_n',      'a2',  0x3040, 'pe',         'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('pex_l1_rst_n',    'a3',  0x3044, 'pe1',        'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('pex_l1_clkreq_n', 'a4',  0x3048, 'pe1',        'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('sata_led_active', 'a5',  0x304c, 'sata',       'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('',                'a6',  0x3244, 'sata',       'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('dap1_fs',         'b0',  0x3124, 'i2s1',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('dap1_din',        'b1',  0x3128, 'i2s1',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('dap1_dout',       'b2',  0x312c, 'i2s1',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('dap1_sclk',       'b3',  0x3130, 'i2s1',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('spi2_mosi',       'b4',  0x3064, 'spi2',       'dtv',    'rsvd2', 'rsvd3', True,  True,    False),
+    ('spi2_miso',       'b5',  0x3068, 'spi2',       'dtv',    'rsvd2', 'rsvd3', True,  True,    False),
+    ('spi2_sck',        'b6',  0x306c, 'spi2',       'dtv',    'rsvd2', 'rsvd3', True,  True,    False),
+    ('spi2_cs0',        'b7',  0x3070, 'spi2',       'dtv',    'rsvd2', 'rsvd3', True,  True,    False),
+    ('spi1_mosi',       'c0',  0x3050, 'spi1',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('spi1_miso',       'c1',  0x3054, 'spi1',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('spi1_sck',        'c2',  0x3058, 'spi1',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('spi1_cs0',        'c3',  0x305c, 'spi1',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('spi1_cs1',        'c4',  0x3060, 'spi1',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('spi4_sck',        'c5',  0x3080, 'spi4',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('spi4_cs0',        'c6',  0x3084, 'spi4',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('spi4_mosi',       'c7',  0x3078, 'spi4',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('spi4_miso',       'd0',  0x307c, 'spi4',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('uart3_tx',        'd1',  0x3104, 'uartc',      'spi4',   'rsvd2', 'rsvd3', False, False,   False),
+    ('uart3_rx',        'd2',  0x3108, 'uartc',      'spi4',   'rsvd2', 'rsvd3', False, False,   False),
+    ('uart3_rts',       'd3',  0x310c, 'uartc',      'spi4',   'rsvd2', 'rsvd3', False, False,   False),
+    ('uart3_cts',       'd4',  0x3110, 'uartc',      'spi4',   'rsvd2', 'rsvd3', False, False,   False),
+    ('dmic1_clk',       'e0',  0x30a4, 'dmic1',      'i2s3',   'rsvd2', 'rsvd3', False, False,   False),
+    ('dmic1_dat',       'e1',  0x30a8, 'dmic1',      'i2s3',   'rsvd2', 'rsvd3', False, False,   False),
+    ('dmic2_clk',       'e2',  0x30ac, 'dmic2',      'i2s3',   'rsvd2', 'rsvd3', False, False,   False),
+    ('dmic2_dat',       'e3',  0x30b0, 'dmic2',      'i2s3',   'rsvd2', 'rsvd3', False, False,   False),
+    ('dmic3_clk',       'e4',  0x30b4, 'dmic3',      'i2s5a',  'rsvd2', 'rsvd3', False, False,   False),
+    ('dmic3_dat',       'e5',  0x30b8, 'dmic3',      'i2s5a',  'rsvd2', 'rsvd3', False, False,   False),
+    ('',                'e6',  0x3248, 'rsvd0',      'i2s5a',  'pwm2',  'rsvd3', False, False,   False),
+    ('',                'e7',  0x324c, 'rsvd0',      'i2s5a',  'pwm3',  'rsvd3', False, False,   False),
+    ('gen3_i2c_scl',    'f0',  0x30cc, 'i2c3',       'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('gen3_i2c_sda',    'f1',  0x30d0, 'i2c3',       'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('uart2_tx',        'g0',  0x30f4, 'uartb',      'i2s4a',  'spdif', 'uart',  False, False,   False),
+    ('uart2_rx',        'g1',  0x30f8, 'uartb',      'i2s4a',  'spdif', 'uart',  False, False,   False),
+    ('uart2_rts',       'g2',  0x30fc, 'uartb',      'i2s4a',  'rsvd2', 'uart',  False, False,   False),
+    ('uart2_cts',       'g3',  0x3100, 'uartb',      'i2s4a',  'rsvd2', 'uart',  False, False,   False),
+    ('wifi_en',         'h0',  0x31b4, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('wifi_rst',        'h1',  0x31b8, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('wifi_wake_ap',    'h2',  0x31bc, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('ap_wake_bt',      'h3',  0x31c0, 'rsvd0',      'uartb',  'spdif', 'rsvd3', False, False,   False),
+    ('bt_rst',          'h4',  0x31c4, 'rsvd0',      'uartb',  'spdif', 'rsvd3', False, False,   False),
+    ('bt_wake_ap',      'h5',  0x31c8, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('',                'h6',  0x3250, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('ap_wake_nfc',     'h7',  0x31cc, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('nfc_en',          'i0',  0x31d0, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('nfc_int',         'i1',  0x31d4, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('gps_en',          'i2',  0x31d8, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('gps_rst',         'i3',  0x31dc, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('uart4_tx',        'i4',  0x3114, 'uartd',      'uart',   'rsvd2', 'rsvd3', False, False,   False),
+    ('uart4_rx',        'i5',  0x3118, 'uartd',      'uart',   'rsvd2', 'rsvd3', False, False,   False),
+    ('uart4_rts',       'i6',  0x311c, 'uartd',      'uart',   'rsvd2', 'rsvd3', False, False,   False),
+    ('uart4_cts',       'i7',  0x3120, 'uartd',      'uart',   'rsvd2', 'rsvd3', False, False,   False),
+    ('gen1_i2c_sda',    'j0',  0x30c0, 'i2c1',       'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('gen1_i2c_scl',    'j1',  0x30bc, 'i2c1',       'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('gen2_i2c_scl',    'j2',  0x30c4, 'i2c2',       'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('gen2_i2c_sda',    'j3',  0x30c8, 'i2c2',       'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('dap4_fs',         'j4',  0x3144, 'i2s4b',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('dap4_din',        'j5',  0x3148, 'i2s4b',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('dap4_dout',       'j6',  0x314c, 'i2s4b',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('dap4_sclk',       'j7',  0x3150, 'i2s4b',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('',                'k0',  0x3254, 'iqc0',       'i2s5b',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('',                'k1',  0x3258, 'iqc0',       'i2s5b',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('',                'k2',  0x325c, 'iqc0',       'i2s5b',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('',                'k3',  0x3260, 'iqc0',       'i2s5b',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('',                'k4',  0x3264, 'iqc1',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('',                'k5',  0x3268, 'iqc1',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('',                'k6',  0x326c, 'iqc1',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('',                'k7',  0x3270, 'iqc1',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('',                'l0',  0x3274, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('',                'l1',  0x3278, 'soc',        'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('sdmmc1_clk',      'm0',  0x3000, 'sdmmc1',     'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('sdmmc1_cmd',      'm1',  0x3004, 'sdmmc1',     'spi3',   'rsvd2', 'rsvd3', True,  True,    False),
+    ('sdmmc1_dat3',     'm2',  0x3008, 'sdmmc1',     'spi3',   'rsvd2', 'rsvd3', True,  True,    False),
+    ('sdmmc1_dat2',     'm3',  0x300c, 'sdmmc1',     'spi3',   'rsvd2', 'rsvd3', True,  True,    False),
+    ('sdmmc1_dat1',     'm4',  0x3010, 'sdmmc1',     'spi3',   'rsvd2', 'rsvd3', True,  True,    False),
+    ('sdmmc1_dat0',     'm5',  0x3014, 'sdmmc1',     'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('sdmmc3_clk',      'p0',  0x301c, 'sdmmc3',     'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('sdmmc3_cmd',      'p1',  0x3020, 'sdmmc3',     'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('sdmmc3_dat3',     'p2',  0x3030, 'sdmmc3',     'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('sdmmc3_dat2',     'p3',  0x302c, 'sdmmc3',     'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('sdmmc3_dat1',     'p4',  0x3028, 'sdmmc3',     'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('sdmmc3_dat0',     'p5',  0x3024, 'sdmmc3',     'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('cam1_mclk',       's0',  0x3154, 'extperiph3', 'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('cam2_mclk',       's1',  0x3158, 'extperiph3', 'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('cam_i2c_scl',     's2',  0x30d4, 'i2c3',       'i2cvi',  'rsvd2', 'rsvd3', False, False,   True),
+    ('cam_i2c_sda',     's3',  0x30d8, 'i2c3',       'i2cvi',  'rsvd2', 'rsvd3', False, False,   True),
+    ('cam_rst',         's4',  0x31e0, 'vgp1',       'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('cam_af_en',       's5',  0x31e4, 'vimclk',     'vgp2',   'rsvd2', 'rsvd3', False, False,   False),
+    ('cam_flash_en',    's6',  0x31e8, 'vimclk',     'vgp3',   'rsvd2', 'rsvd3', False, False,   False),
+    ('cam1_pwdn',       's7',  0x31ec, 'vgp4',       'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('cam2_pwdn',       't0',  0x31f0, 'vgp5',       'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('cam1_strobe',     't1',  0x31f4, 'vgp6',       'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('uart1_tx',        'u0',  0x30e4, 'uarta',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('uart1_rx',        'u1',  0x30e8, 'uarta',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('uart1_rts',       'u2',  0x30ec, 'uarta',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('uart1_cts',       'u3',  0x30f0, 'uarta',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('lcd_bl_pwm',      'v0',  0x31fc, 'displaya',   'pwm0',   'sor0',  'rsvd3', False, False,   False),
+    ('lcd_bl_en',       'v1',  0x3200, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('lcd_rst',         'v2',  0x3204, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('lcd_gpio1',       'v3',  0x3208, 'displayb',   'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('lcd_gpio2',       'v4',  0x320c, 'displayb',   'pwm1',   'rsvd2', 'sor1',  False, False,   False),
+    ('ap_ready',        'v5',  0x3210, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('touch_rst',       'v6',  0x3214, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('touch_clk',       'v7',  0x3218, 'touch',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('modem_wake_ap',   'x0',  0x321c, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('touch_int',       'x1',  0x3220, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('motion_int',      'x2',  0x3224, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('als_prox_int',    'x3',  0x3228, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('temp_alert',      'x4',  0x322c, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('button_power_on', 'x5',  0x3230, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('button_vol_up',   'x6',  0x3234, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('button_vol_down', 'x7',  0x3238, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('button_slide_sw', 'y0',  0x323c, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('button_home',     'y1',  0x3240, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('lcd_te',          'y2',  0x31f8, 'displaya',   'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('pwr_i2c_scl',     'y3',  0x30dc, 'i2cpmu',     'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('pwr_i2c_sda',     'y4',  0x30e0, 'i2cpmu',     'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('clk_32k_out',     'y5',  0x3164, 'soc',        'blink',  'rsvd2', 'rsvd3', False, False,   False),
+    ('',                'z0',  0x327c, 'vimclk2',    'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('',                'z1',  0x3280, 'vimclk2',    'sdmmc1', 'rsvd2', 'rsvd3', False, False,   False),
+    ('',                'z2',  0x3284, 'sdmmc3',     'ccla',   'rsvd2', 'rsvd3', False, False,   False),
+    ('',                'z3',  0x3288, 'sdmmc3',     'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('',                'z4',  0x328c, 'sdmmc1',     'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('',                'z5',  0x3290, 'soc',        'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('dap2_fs',         'aa0', 0x3134, 'i2s2',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('dap2_sclk',       'aa1', 0x3140, 'i2s2',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('dap2_din',        'aa2', 0x3138, 'i2s2',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('dap2_dout',       'aa3', 0x313c, 'i2s2',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('aud_mclk',        'bb0', 0x3180, 'aud',        'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('dvfs_pwm',        'bb1', 0x3184, 'rsvd0',      'cldvfs', 'spi3',  'rsvd3', False, False,   False),
+    ('dvfs_clk',        'bb2', 0x3188, 'rsvd0',      'cldvfs', 'spi3',  'rsvd3', False, False,   False),
+    ('gpio_x1_aud',     'bb3', 0x318c, 'rsvd0',      'rsvd1',  'spi3',  'rsvd3', False, False,   False),
+    ('gpio_x3_aud',     'bb4', 0x3190, 'rsvd0',      'rsvd1',  'spi3',  'rsvd3', False, False,   False),
+    ('hdmi_cec',        'cc0', 0x3198, 'cec',        'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('hdmi_int_dp_hpd', 'cc1', 0x319c, 'dp',         'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('spdif_out',       'cc2', 0x31a0, 'spdif',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('spdif_in',        'cc3', 0x31a4, 'spdif',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('usb_vbus_en0',    'cc4', 0x31a8, 'usb',        'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('usb_vbus_en1',    'cc5', 0x31ac, 'usb',        'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('dp_hpd0',         'cc6', 0x31b0, 'dp',         'rsvd1',  'rsvd2', 'rsvd3', False, False,   False),
+    ('',                'cc7', 0x3194, 'rsvd0',      'rsvd1',  'rsvd2', 'rsvd3', False, False,   True),
+    ('spi2_cs1',        'dd0', 0x3074, 'spi2',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('qspi_sck',        'ee0', 0x3088, 'qspi',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('qspi_cs_n',       'ee1', 0x308c, 'qspi',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('qspi_io0',        'ee2', 0x3090, 'qspi',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('qspi_io1',        'ee3', 0x3094, 'qspi',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('qspi_io2',        'ee4', 0x3098, 'qspi',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+    ('qspi_io3',        'ee5', 0x309c, 'qspi',       'rsvd1',  'rsvd2', 'rsvd3', True,  True,    False),
+)
+
+pins = (
+    #name,           reg,    f0,         f1,      f2,      f3,      hsm,   drvtype, e_io_hv
+    ('core_pwr_req', 0x317c, 'core',     'rsvd1', 'rsvd2', 'rsvd3', False, False,   False),
+    ('cpu_pwr_req',  0x3170, 'cpu',      'rsvd1', 'rsvd2', 'rsvd3', False, False,   False),
+    ('pwr_int_n',    0x3174, 'pmi',      'rsvd1', 'rsvd2', 'rsvd3', False, False,   False),
+    ('clk_32k_in',   0x3160, 'clk',      'rsvd1', 'rsvd2', 'rsvd3', False, False,   False),
+    ('jtag_rtck',    0x315c, 'jtag',     'rsvd1', 'rsvd2', 'rsvd3', False, False,   False),
+    ('batt_bcl',     0x3168, 'bcl',      'rsvd1', 'rsvd2', 'rsvd3', False, False,   True),
+    ('clk_req',      0x316c, 'sys',      'rsvd1', 'rsvd2', 'rsvd3', False, False,   False),
+    ('shutdown',     0x3178, 'shutdown', 'rsvd1', 'rsvd2', 'rsvd3', False, False,   False),
+)
+
+drive_groups = (
+    #name, r, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w
+    ('als_prox_int',    0x8e4, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('ap_ready',        0x8e8, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('ap_wake_bt',      0x8ec, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('ap_wake_nfc',     0x8f0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('aud_mclk',        0x8f4, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('batt_bcl',        0x8f8, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('bt_rst',          0x8fc, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('bt_wake_ap',      0x900, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_home',     0x904, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_power_on', 0x908, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_slide_sw', 0x90c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_vol_down', 0x910, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('button_vol_up',   0x914, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam1_mclk',       0x918, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam1_pwdn',       0x91c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam1_strobe',     0x920, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam2_mclk',       0x924, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam2_pwdn',       0x928, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_af_en',       0x92c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_flash_en',    0x930, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_i2c_scl',     0x934, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_i2c_sda',     0x938, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cam_rst',         0x93c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('clk_32k_in',      0x940, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('clk_32k_out',     0x944, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('clk_req',         0x948, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('core_pwr_req',    0x94c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('cpu_pwr_req',     0x950, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dap1_din',        0x954, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap1_dout',       0x958, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap1_fs',         0x95c, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap1_sclk',       0x960, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap2_din',        0x964, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap2_dout',       0x968, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap2_fs',         0x96c, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap2_sclk',       0x970, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('dap4_din',        0x974, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dap4_dout',       0x978, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dap4_fs',         0x97c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dap4_sclk',       0x980, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('sdmmc1',          0xa98, 12, 7,  20, 7,  28, 2,  30, 2),
+    ('sdmmc3',          0xab0, 12, 7,  20, 7,  28, 2,  30, 2),
+    ('sdmmc2',          0xa9c, 2,  6,  8,  6,  28, 2,  30, 2),
+    ('sdmmc4',          0xab4, 2,  6,  8,  6,  28, 2,  30, 2),
+    ('dmic1_clk',       0x984, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic1_dat',       0x988, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic2_clk',       0x98c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic2_dat',       0x990, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic3_clk',       0x994, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dmic3_dat',       0x998, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dp_hpd0',         0x99c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dvfs_clk',        0x9a0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('dvfs_pwm',        0x9a4, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen1_i2c_scl',    0x9a8, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen1_i2c_sda',    0x9ac, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen2_i2c_scl',    0x9b0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen2_i2c_sda',    0x9b4, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen3_i2c_scl',    0x9b8, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gen3_i2c_sda',    0x9bc, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pa6',             0x9c0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pcc7',            0x9c4, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pe6',             0x9c8, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pe7',             0x9cc, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('ph6',             0x9d0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pk0',             0x9d4, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk1',             0x9d8, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk2',             0x9dc, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk3',             0x9e0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk4',             0x9e4, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk5',             0x9e8, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk6',             0x9ec, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pk7',             0x9f0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pl0',             0x9f4, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pl1',             0x9f8, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('pz0',             0x9fc, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz1',             0xa00, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz2',             0xa04, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz3',             0xa08, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz4',             0xa0c, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('pz5',             0xa10, 12, 7,  20, 7,  -1, -1, -1, -1),
+    ('gpio_x1_aud',     0xa14, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gpio_x3_aud',     0xa18, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gps_en',          0xa1c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('gps_rst',         0xa20, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('hdmi_cec',        0xa24, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('hdmi_int_dp_hpd', 0xa28, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('jtag_rtck',       0xa2c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_bl_en',       0xa30, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_bl_pwm',      0xa34, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_gpio1',       0xa38, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_gpio2',       0xa3c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_rst',         0xa40, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('lcd_te',          0xa44, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('modem_wake_ap',   0xa48, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('motion_int',      0xa4c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('nfc_en',          0xa50, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('nfc_int',         0xa54, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_l0_clkreq_n', 0xa58, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_l0_rst_n',    0xa5c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_l1_clkreq_n', 0xa60, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_l1_rst_n',    0xa64, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pex_wake_n',      0xa68, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pwr_i2c_scl',     0xa6c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pwr_i2c_sda',     0xa70, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('pwr_int_n',       0xa74, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('qspi_sck',        0xa90, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('sata_led_active', 0xa94, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('shutdown',        0xac8, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('spdif_in',        0xacc, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('spdif_out',       0xad0, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('spi1_cs0',        0xad4, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi1_cs1',        0xad8, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi1_mosi',       0xae0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi1_miso',       0xadc, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi1_sck',        0xae4, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_cs0',        0xae8, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_cs1',        0xaec, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_mosi',       0xaf4, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_miso',       0xaf0, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi2_sck',        0xaf8, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi4_cs0',        0xafc, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi4_mosi',       0xb04, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi4_miso',       0xb00, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('spi4_sck',        0xb08, -1, -1, -1, -1, 28, 2,  30, 2),
+    ('temp_alert',      0xb0c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('touch_clk',       0xb10, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('touch_int',       0xb14, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('touch_rst',       0xb18, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart1_cts',       0xb1c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart1_rts',       0xb20, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart1_rx',        0xb24, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart1_tx',        0xb28, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart2_cts',       0xb2c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart2_rts',       0xb30, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart2_rx',        0xb34, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart2_tx',        0xb38, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart3_cts',       0xb3c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart3_rts',       0xb40, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart3_rx',        0xb44, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart3_tx',        0xb48, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart4_cts',       0xb4c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart4_rts',       0xb50, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart4_rx',        0xb54, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('uart4_tx',        0xb58, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('usb_vbus_en0',    0xb5c, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('usb_vbus_en1',    0xb60, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('wifi_en',         0xb64, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('wifi_rst',        0xb68, 12, 5,  20, 5,  -1, -1, -1, -1),
+    ('wifi_wake_ap',    0xb6c, 12, 5,  20, 5,  -1, -1, -1, -1),
+)
+
+drive_group_pins = {
+    'als_prox_int': (
+        'als_prox_int_px3',
+    ),
+    'ap_ready': (
+        'ap_ready_pv5',
+    ),
+    'ap_wake_bt': (
+        'ap_wake_bt_ph3',
+    ),
+    'ap_wake_nfc': (
+        'ap_wake_nfc_ph7',
+    ),
+    'aud_mclk': (
+        'aud_mclk_pbb0',
+    ),
+    'batt_bcl': (
+        'batt_bcl',
+    ),
+    'bt_rst': (
+        'bt_rst_ph4',
+    ),
+    'bt_wake_ap': (
+        'bt_wake_ap_ph5',
+    ),
+    'button_home': (
+        'button_home_py1',
+    ),
+    'button_power_on': (
+        'button_power_on_px5',
+    ),
+    'button_slide_sw': (
+        'button_slide_sw_py0',
+    ),
+    'button_vol_down': (
+        'button_vol_down_px7',
+    ),
+    'button_vol_up': (
+        'button_vol_up_px6',
+    ),
+    'cam1_mclk': (
+        'cam1_mclk_ps0',
+    ),
+    'cam1_pwdn': (
+        'cam1_pwdn_ps7',
+    ),
+    'cam1_strobe': (
+        'cam1_strobe_pt1',
+    ),
+    'cam2_mclk': (
+        'cam2_mclk_ps1',
+    ),
+    'cam2_pwdn': (
+        'cam2_pwdn_pt0',
+    ),
+    'cam_af_en': (
+        'cam_af_en_ps5',
+    ),
+    'cam_flash_en': (
+        'cam_flash_en_ps6',
+    ),
+    'cam_i2c_scl': (
+        'cam_i2c_scl_ps2',
+    ),
+    'cam_i2c_sda': (
+        'cam_i2c_sda_ps3',
+    ),
+    'cam_rst': (
+        'cam_rst_ps4',
+    ),
+    'clk_32k_in': (
+        'clk_32k_in',
+    ),
+    'clk_32k_out': (
+        'clk_32k_out_py5',
+    ),
+    'clk_req': (
+        'clk_req',
+    ),
+    'core_pwr_req': (
+        'core_pwr_req',
+    ),
+    'cpu_pwr_req': (
+        'cpu_pwr_req',
+    ),
+    'dap1_din': (
+        'dap1_din_pb1',
+    ),
+    'dap1_dout': (
+        'dap1_dout_pb2',
+    ),
+    'dap1_fs': (
+        'dap1_fs_pb0',
+    ),
+    'dap1_sclk': (
+        'dap1_sclk_pb3',
+    ),
+    'dap2_din': (
+        'dap2_din_paa2',
+    ),
+    'dap2_dout': (
+        'dap2_dout_paa3',
+    ),
+    'dap2_fs': (
+        'dap2_fs_paa0',
+    ),
+    'dap2_sclk': (
+        'dap2_sclk_paa1',
+    ),
+    'dap4_din': (
+        'dap4_din_pj5',
+    ),
+    'dap4_dout': (
+        'dap4_dout_pj6',
+    ),
+    'dap4_fs': (
+        'dap4_fs_pj4',
+    ),
+    'dap4_sclk': (
+        'dap4_sclk_pj7',
+    ),
+    'sdmmc1': (
+        'sdmmc1_clk_pm0',
+        'sdmmc1_cmd_pm1',
+        'sdmmc1_dat3_pm2',
+        'sdmmc1_dat2_pm3',
+        'sdmmc1_dat1_pm4',
+        'sdmmc1_dat0_pm5',
+    ),
+    'sdmmc3': (
+        'sdmmc3_clk_pp0',
+        'sdmmc3_cmd_pp1',
+        'sdmmc3_dat3_pp2',
+        'sdmmc3_dat2_pp3',
+        'sdmmc3_dat1_pp4',
+        'sdmmc3_dat0_pp5',
+    ),
+    'sdmmc2': (
+    ),
+    'sdmmc4': (
+    ),
+    'dmic1_clk': (
+        'dmic1_clk_pe0',
+    ),
+    'dmic1_dat': (
+        'dmic1_dat_pe1',
+    ),
+    'dmic2_clk': (
+        'dmic2_clk_pe2',
+    ),
+    'dmic2_dat': (
+        'dmic2_dat_pe3',
+    ),
+    'dmic3_clk': (
+        'dmic3_clk_pe4',
+    ),
+    'dmic3_dat': (
+        'dmic3_dat_pe5',
+    ),
+    'dp_hpd0': (
+        'dp_hpd0_pcc6',
+    ),
+    'dvfs_clk': (
+        'dvfs_clk_pbb2',
+    ),
+    'dvfs_pwm': (
+        'dvfs_pwm_pbb1',
+    ),
+    'gen1_i2c_scl': (
+        'gen1_i2c_scl_pj1',
+    ),
+    'gen1_i2c_sda': (
+        'gen1_i2c_sda_pj0',
+    ),
+    'gen2_i2c_scl': (
+        'gen2_i2c_scl_pj2',
+    ),
+    'gen2_i2c_sda': (
+        'gen2_i2c_sda_pj3',
+    ),
+    'gen3_i2c_scl': (
+        'gen3_i2c_scl_pf0',
+    ),
+    'gen3_i2c_sda': (
+        'gen3_i2c_sda_pf1',
+    ),
+    'pa6': (
+        'pa6',
+    ),
+    'pcc7': (
+        'pcc7',
+    ),
+    'pe6': (
+        'pe6',
+    ),
+    'pe7': (
+        'pe7',
+    ),
+    'ph6': (
+        'ph6',
+    ),
+    'pk0': (
+        'pk0',
+    ),
+    'pk1': (
+        'pk1',
+    ),
+    'pk2': (
+        'pk2',
+    ),
+    'pk3': (
+        'pk3',
+    ),
+    'pk4': (
+        'pk4',
+    ),
+    'pk5': (
+        'pk5',
+    ),
+    'pk6': (
+        'pk6',
+    ),
+    'pk7': (
+        'pk7',
+    ),
+    'pl0': (
+        'pl0',
+    ),
+    'pl1': (
+        'pl1',
+    ),
+    'pz0': (
+        'pz0',
+    ),
+    'pz1': (
+        'pz1',
+    ),
+    'pz2': (
+        'pz2',
+    ),
+    'pz3': (
+        'pz3',
+    ),
+    'pz4': (
+        'pz4',
+    ),
+    'pz5': (
+        'pz5',
+    ),
+    'gpio_x1_aud': (
+        'gpio_x1_aud_pbb3',
+    ),
+    'gpio_x3_aud': (
+        'gpio_x3_aud_pbb4',
+    ),
+    'gps_en': (
+        'gps_en_pi2',
+    ),
+    'gps_rst': (
+        'gps_rst_pi3',
+    ),
+    'hdmi_cec': (
+        'hdmi_cec_pcc0',
+    ),
+    'hdmi_int_dp_hpd': (
+        'hdmi_int_dp_hpd_pcc1',
+    ),
+    'jtag_rtck': (
+        'jtag_rtck',
+    ),
+    'lcd_bl_en': (
+        'lcd_bl_en_pv1',
+    ),
+    'lcd_bl_pwm': (
+        'lcd_bl_pwm_pv0',
+    ),
+    'lcd_gpio1': (
+        'lcd_gpio1_pv3',
+    ),
+    'lcd_gpio2': (
+        'lcd_gpio2_pv4',
+    ),
+    'lcd_rst': (
+        'lcd_rst_pv2',
+    ),
+    'lcd_te': (
+        'lcd_te_py2',
+    ),
+    'modem_wake_ap': (
+        'modem_wake_ap_px0',
+    ),
+    'motion_int': (
+        'motion_int_px2',
+    ),
+    'nfc_en': (
+        'nfc_en_pi0',
+    ),
+    'nfc_int': (
+        'nfc_int_pi1',
+    ),
+    'pex_l0_clkreq_n': (
+        'pex_l0_clkreq_n_pa1',
+    ),
+    'pex_l0_rst_n': (
+        'pex_l0_rst_n_pa0',
+    ),
+    'pex_l1_clkreq_n': (
+        'pex_l1_clkreq_n_pa4',
+    ),
+    'pex_l1_rst_n': (
+        'pex_l1_rst_n_pa3',
+    ),
+    'pex_wake_n': (
+        'pex_wake_n_pa2',
+    ),
+    'pwr_i2c_scl': (
+        'pwr_i2c_scl_py3',
+    ),
+    'pwr_i2c_sda': (
+        'pwr_i2c_sda_py4',
+    ),
+    'pwr_int_n': (
+        'pwr_int_n',
+    ),
+    'qspi_sck': (
+        'qspi_sck_pee0',
+    ),
+    'sata_led_active': (
+        'sata_led_active_pa5',
+    ),
+    'shutdown': (
+        'shutdown',
+    ),
+    'spdif_in': (
+        'spdif_in_pcc3',
+    ),
+    'spdif_out': (
+        'spdif_out_pcc2',
+    ),
+    'spi1_cs0': (
+        'spi1_cs0_pc3',
+    ),
+    'spi1_cs1': (
+        'spi1_cs1_pc4',
+    ),
+    'spi1_mosi': (
+        'spi1_mosi_pc0',
+    ),
+    'spi1_miso': (
+        'spi1_miso_pc1',
+    ),
+    'spi1_sck': (
+        'spi1_sck_pc2',
+    ),
+    'spi2_cs0': (
+        'spi2_cs0_pb7',
+    ),
+    'spi2_cs1': (
+        'spi2_cs1_pdd0',
+    ),
+    'spi2_mosi': (
+        'spi2_mosi_pb4',
+    ),
+    'spi2_miso': (
+        'spi2_miso_pb5',
+    ),
+    'spi2_sck': (
+        'spi2_sck_pb6',
+    ),
+    'spi4_cs0': (
+        'spi4_cs0_pc6',
+    ),
+    'spi4_mosi': (
+        'spi4_mosi_pc7',
+    ),
+    'spi4_miso': (
+        'spi4_miso_pd0',
+    ),
+    'spi4_sck': (
+        'spi4_sck_pc5',
+    ),
+    'temp_alert': (
+        'temp_alert_px4',
+    ),
+    'touch_clk': (
+        'touch_clk_pv7',
+    ),
+    'touch_int': (
+        'touch_int_px1',
+    ),
+    'touch_rst': (
+        'touch_rst_pv6',
+    ),
+    'uart1_cts': (
+        'uart1_cts_pu3',
+    ),
+    'uart1_rts': (
+        'uart1_rts_pu2',
+    ),
+    'uart1_rx': (
+        'uart1_rx_pu1',
+    ),
+    'uart1_tx': (
+        'uart1_tx_pu0',
+    ),
+    'uart2_cts': (
+        'uart2_cts_pg3',
+    ),
+    'uart2_rts': (
+        'uart2_rts_pg2',
+    ),
+    'uart2_rx': (
+        'uart2_rx_pg1',
+    ),
+    'uart2_tx': (
+        'uart2_tx_pg0',
+    ),
+    'uart3_cts': (
+        'uart3_cts_pd4',
+    ),
+    'uart3_rts': (
+        'uart3_rts_pd3',
+    ),
+    'uart3_rx': (
+        'uart3_rx_pd2',
+    ),
+    'uart3_tx': (
+        'uart3_tx_pd1',
+    ),
+    'uart4_cts': (
+        'uart4_cts_pi7',
+    ),
+    'uart4_rts': (
+        'uart4_rts_pi6',
+    ),
+    'uart4_rx': (
+        'uart4_rx_pi5',
+    ),
+    'uart4_tx': (
+        'uart4_tx_pi4',
+    ),
+    'usb_vbus_en0': (
+        'usb_vbus_en0_pcc4',
+    ),
+    'usb_vbus_en1': (
+        'usb_vbus_en1_pcc5',
+    ),
+    'wifi_en': (
+        'wifi_en_ph0',
+    ),
+    'wifi_rst': (
+        'wifi_rst_ph1',
+    ),
+    'wifi_wake_ap': (
+        'wifi_wake_ap_ph2',
+    ),
+}
diff --git a/configs/tegra30.soc b/configs/tegra30.soc
index d91bccde96e3..fd6c6ad7e750 100644
--- a/configs/tegra30.soc
+++ b/configs/tegra30.soc
@@ -2,8 +2,25 @@ kernel_copyright_years = '2011-2012'
 kernel_author = 'Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>'
 uboot_copyright_years = '2010-2014'
 
-has_rcv_sel = False
-has_drvtype = False
+soc_has_io_clamping = False
+soc_combine_pin_drvgroup = False
+soc_rsvd_base = 1
+soc_drvgroups_have_drvtype = False
+soc_drvgroups_have_hsm = True
+soc_drvgroups_have_lpmd = True
+soc_drvgroups_have_schmitt = True
+soc_pins_all_have_od = False
+soc_pins_all_have_schmitt = False
+soc_pins_have_drvtype = False
+soc_pins_have_e_io_hv = False
+soc_pins_have_hsm = False
+soc_pins_have_ior = True
+soc_pins_have_od = True
+soc_pins_have_rcv_sel = False
+soc_pins_have_schmitt = False
+soc_drv_reg_base = 0x868
+soc_einput_b = 5
+soc_odrain_b = 6
 
 gpios = (
     #name,              gpio,  reg,    f0,            f1,         f2,         f3,         od,    ior
diff --git a/csv-to-board-tegra124-xlsx.py b/csv-to-board.py
similarity index 80%
rename from csv-to-board-tegra124-xlsx.py
rename to csv-to-board.py
index 54f952472b35..2860c029b9f3 100755
--- a/csv-to-board-tegra124-xlsx.py
+++ b/csv-to-board.py
@@ -36,8 +36,8 @@ parser = argparse.ArgumentParser(description='Create a board config' +
     'from a CSV version of the Venice2 pinmux spreadsheet')
 parser.add_argument('--debug', action='store_true', help='Turn on debugging prints')
 parser.add_argument('--csv', default=argparse.SUPPRESS, help='CSV file to parse')
-parser.add_argument('--rsvd-0based', action='store_true', dest='rsvd_0based', default=argparse.SUPPRESS, help='Assume 0-based RSVD numbering')
-parser.add_argument('--rsvd-1based', action='store_false', dest='rsvd_0based', default=argparse.SUPPRESS, help='Assume 1-based RSVD numbering')
+parser.add_argument('--csv-rsvd-0based', action='store_true', dest='csv_rsvd_0based', default=argparse.SUPPRESS, help='Assume 0-based RSVD numbering')
+parser.add_argument('--csv-rsvd-1based', action='store_false', dest='csv_rsvd_0based', default=argparse.SUPPRESS, help='Assume 1-based RSVD numbering')
 parser.add_argument('board', help='Board name')
 args = parser.parse_args()
 if args.debug:
@@ -49,15 +49,20 @@ supported_boards = {
         # Jetson_TK1_customer_pinmux.xlsm worksheet Jetson TK1 Configuration (1-based rsvd) from:
         # https://developer.nvidia.com/hardware-design-and-development
         'filename': 'csv/jetson-tk1.csv',
-        'rsvd_0based': False,
+        'rsvd_base': 1,
+        'soc': 'tegra124',
     },
     'norrin': {
         # PM370_T124_customer_pinmux_1.1.xlsm worksheet Customer_Configuration (0-based rsvd)
         'filename': 'nv-internal-data/PM370_T124_customer_pinmux_1.1.csv',
+        'rsvd_base': 0,
+        'soc': 'tegra124',
     },
     'venice2': {
         # Venice2_T124_customer_pinmux_based_on_P4_rev47_2013-07-12.xlsm worksheet Customer_Configuration (0-based rsvd)
         'filename': 'nv-internal-data/Venice2_T124_customer_pinmux_based_on_P4_rev47_2013-07-12.csv',
+        'rsvd_base': 0,
+        'soc': 'tegra124',
     },
 }
 
@@ -65,16 +70,13 @@ if not args.board in supported_boards:
     print('ERROR: Unsupported board %s' % args.board, file=sys.stderr)
     sys.exit(1)
 board_conf = supported_boards[args.board]
-if not 'rsvd_0based' in board_conf:
-    # FIXME: This should default to False for some future chip
-    board_conf['rsvd_0based'] = True
 if 'csv' in args:
     board_conf['filename'] = args.csv
-if 'rsvd_0based' in args:
-    board_conf['rsvd_0based'] = args.rsvd_0based
+if 'csv_rsvd_0based' in args:
+    board_conf['rsvd_base'] = {True: 0, False: 1}[args.csv_rsvd_0based]
 if dbg: print(board_conf)
 
-soc = tegra_pmx_soc_parser.load_soc('tegra124')
+soc = tegra_pmx_soc_parser.load_soc(board_conf['soc'])
 
 COL_BALL_NAME = 0
 COL_BALL_MID = 1
@@ -109,18 +111,27 @@ col_names = {
     COL_E_INPUT:       'E_Input',
     COL_GPIO_INIT_VAL: 'GPIO Init Value',
     COL_DIRECTION:     'Pin Direction',
-    COL_RCV_SEL:       'High or Normal VIL/VIH',
 }
 
+if soc.soc_pins_have_rcv_sel:
+    col_names[COL_RCV_SEL] = 'High or Normal VIL/VIH'
+
+if soc.soc_pins_have_e_io_hv:
+    col_names[COL_RCV_SEL] = '3.3V Tolerance Enable'
+
 cols = {}
 
 def func_munge(f):
-    if f in ('sdmmc2a', 'sdmmc2b'):
-        return 'sdmmc2'
-    if f in ('ir3_rxd', 'ir3_txd'):
-        return 'irda'
-    if board_conf['rsvd_0based']:
-        return rsvd_0base_to_1base(f)
+    if board_conf['soc'] == 'tegra124':
+        if f in ('sdmmc2a', 'sdmmc2b'):
+            return 'sdmmc2'
+        if f in ('ir3_rxd', 'ir3_txd'):
+            return 'irda'
+    if soc.soc_rsvd_base != board_conf['rsvd_base']:
+        if soc.soc_rsvd_base:
+            return rsvd_0base_to_1base(f)
+        else:
+            raise Exception('CSV 1-based to SoC 0-based not supported')
     return f
 
 def pupd_munge(d):
@@ -156,6 +167,8 @@ def rcv_sel_munge(d):
         '': False,
         'NORMAL': False,
         'HIGH': True,
+        'Disable': False,
+        'Enable': True,
     }[d]
 
 found_header = False
@@ -177,6 +190,8 @@ with open(board_conf['filename'], newline='') as fh:
                 try:
                     cols[colid] = row.index(coltext)
                 except:
+                    if board_conf['soc'] != 'tegra124':
+                        raise
                     if colid != COL_RCV_SEL:
                         print('ERROR: Header column "%s" not found' % coltext, file=sys.stderr)
                         sys.exit(1)
@@ -243,7 +258,7 @@ with open(board_conf['filename'], newline='') as fh:
             print('ERROR: %s: MUX CSV %s not in SOC F0..3 %s' % (ball_name, mux, repr(gpio_pin.funcs)), file=sys.stderr)
             sys.exit(1)
 
-        if ball_name in ('reset_out_n', 'owr', 'hdmi_int', 'ddc_scl', 'ddc_sda'):
+        if (board_conf['soc'] == 'tegra124') and (ball_name in ('reset_out_n', 'owr', 'hdmi_int', 'ddc_scl', 'ddc_sda')):
             # These balls' pad type is always OD, so we don't need to set it
             # FIXME: The SoC data structure should tell us the pad type instead of hard-coding it
             od = False
@@ -251,19 +266,29 @@ with open(board_conf['filename'], newline='') as fh:
         if od and not gpio_pin.od:
             print('WARNING: %s: OD in board file, but pin has no OD' % ball_name, file=sys.stderr)
             od = False
-        if rcv_sel and not gpio_pin.rcv_sel:
-            print('WARNING: %s: RCV_SEL in board file, but pin has no RCV_SEL' % ball_name, file=sys.stderr)
+        pin_has_rcv_sel = False
+        if soc.soc_pins_have_rcv_sel:
+            pin_has_rcv_sel = gpio_pin.rcv_sel
+        if soc.soc_pins_have_e_io_hv:
+            pin_has_rcv_sel = gpio_pin.e_io_hv
+        if rcv_sel and not pin_has_rcv_sel:
+            print('WARNING: %s: RCV_SEL/E_IO_HV in board file, but pin does not support it' % ball_name, file=sys.stderr)
             rcv_sel = False
 
         pin_table.append((repr(gpio_pin.fullname), repr(mux), repr(gpio_init), repr(pupd), repr(tri), repr(e_input), repr(od), repr(rcv_sel)))
 
+headings = ('pin', 'mux', 'gpio_init', 'pull', 'tri', 'e_inp', 'od')
+if soc.soc_pins_have_e_io_hv:
+    headings += ('e_io_hv',)
+if soc.soc_pins_have_rcv_sel:
+    headings += ('rcv_sel',)
+
 cfgfile = os.path.join('configs', args.board + '.board')
 with open(cfgfile, 'wt') as fh:
-    print('soc = \'tegra124\'', file=fh)
+    print('soc = \'%s\'' % board_conf['soc'], file=fh)
     print(file=fh)
     print('pins = (', file=fh)
 
-    headings = ('pin', 'mux', 'gpio_init', 'pull', 'tri', 'e_inp', 'od', 'rcv_sel')
     dump_py_table(headings, pin_table, file=fh)
 
     print(')', file=fh)
diff --git a/kernel-pinctrl-driver-to-soc.py b/kernel-pinctrl-driver-to-soc.py
index feb07dbb3c70..6e70360e18d4 100755
--- a/kernel-pinctrl-driver-to-soc.py
+++ b/kernel-pinctrl-driver-to-soc.py
@@ -41,9 +41,9 @@ re_pins_array_start = re.compile('static const struct pinctrl_pin_desc tegra\d+_
 re_pins_array_entry = re.compile('\s+PINCTRL_PIN\(TEGRA_PIN_([A-Z0-9_]+), "([A-Z0-9_ ]+)"\),')
 
 re_group_pins_array_start = re.compile('static const unsigned ([a-z0-9_]+)_pins\[\] = \{')
-re_group_pins_array_entry = re.compile('\s+TEGRA_PIN_([A-Z0-9_]+),')
+re_group_pins_array_entry = re.compile('\s+TEGRA_PIN_([A-Z0-9_]+),?')
 
-re_mux_array_start = re.compile('enum tegra_mux {')
+re_mux_array_start = re.compile('enum tegra_mux(_dt)? {')
 re_mux_array_entry = re.compile('\s+TEGRA_MUX_([A-Z0-9_]+),')
 
 re_groups_array_start = re.compile('static const struct tegra_pingroup (tegra\d+)_groups\[\] = \{')
@@ -57,8 +57,29 @@ functions = []
 soc = None
 module_author = None
 copyright_years = None
-soc_has_rcv_sel = False
-soc_has_drvtype = False
+
+soc_vars = {
+    'soc_pins_have_od': ['tegra30', 'tegra114', 'tegra124', 'tegra210'],
+    'soc_pins_all_have_od': ['tegra210'],
+    'soc_pins_have_ior': ['tegra30', 'tegra114', 'tegra124'],
+    'soc_pins_have_rcv_sel': ['tegra114', 'tegra124'],
+    'soc_pins_have_schmitt': ['tegra210'],
+    'soc_pins_all_have_schmitt': ['tegra210'],
+    'soc_pins_have_hsm': ['tegra210',],
+    'soc_pins_have_drvtype': ['tegra210',],
+    'soc_pins_have_e_io_hv': ['tegra210',],
+    'soc_drvgroups_have_hsm': ['tegra30', 'tegra114', 'tegra124'],
+    'soc_drvgroups_have_schmitt': ['tegra30', 'tegra114', 'tegra124'],
+    'soc_drvgroups_have_lpmd': ['tegra30', 'tegra114', 'tegra124'],
+    'soc_drvgroups_have_drvtype': ['tegra114', 'tegra124'],
+}
+
+def set_soc(new_soc):
+    global soc
+    soc = new_soc
+
+    for var, socs in soc_vars.items():
+        globals()[var] = (soc in socs)
 
 state = None
 re_state_end = None
@@ -109,7 +130,36 @@ def state_groups_array(l):
     m = re_groups_array_group_entry.match(l)
     if m:
         args = re.split('\s*,\s*', m.group(1))
-        (group, f0, f1, f2, f3, reg, od, ior) = args[0:8]
+        (group, f0, f1, f2, f3, reg) = args[0:6]
+        argbase = 6
+        if soc_pins_have_od and ((not soc_pins_all_have_od) or (soc == 'tegra210')):
+            od = args[argbase]
+            argbase += 1
+            if soc == 'tegra210':
+                if od != 'Y':
+                    raise Exception('od not not expected value for ' + group)
+        if soc_pins_have_ior:
+            ior = args[argbase]
+            argbase += 1
+        if soc_pins_have_rcv_sel:
+            rcv_sel = args[argbase]
+            argbase += 1
+        if soc_pins_have_schmitt and ((not soc_pins_all_have_schmitt) or (soc == 'tegra210')):
+            schmitt = args[argbase]
+            argbase += 1
+            if soc == 'tegra210':
+                if schmitt != '12':
+                    raise Exception('drvtype not expected value for ' + group)
+        if soc_pins_have_hsm:
+            hsm = args[argbase]
+            argbase += 1
+        if soc_pins_have_drvtype:
+            drvtype = args[argbase]
+            argbase += 1
+        if soc_pins_have_e_io_hv:
+            e_io_hv = args[argbase]
+            argbase += 1
+
         group = group.lower()
         f0 = f0.lower()
         f1 = f1.lower()
@@ -122,33 +172,60 @@ def state_groups_array(l):
                 raise Exception('invalid function', f)
         reg = int(reg, 0)
         od = yn_to_boolean(od)
-        ior = yn_to_boolean(ior)
         entry = {
             'is_drive': False,
             'funcs': (f0, f1, f2, f3),
             'reg': reg,
-            'od': od,
-            'ior': ior,
         }
-        if len(args) > 8:
-            global soc_has_rcv_sel
-            soc_has_rcv_sel = True
-            rcv_sel = yn_to_boolean(args[8])
+        if soc_pins_have_od and not soc_pins_all_have_od:
+            od = yn_to_boolean(od)
+            entry['od'] = od
+        if soc_pins_have_ior:
+            ior = yn_to_boolean(ior)
+            entry['ior'] = ior
+        if soc_pins_have_rcv_sel:
+            rcv_sel = yn_to_boolean(rcv_sel)
             entry['rcv_sel'] = rcv_sel
+        if soc_pins_have_schmitt and not soc_pins_all_have_schmitt:
+            schmitt_b = int(schmitt_b)
+            entry['schmitt_b'] = schmitt_b
+        if soc_pins_have_hsm:
+            hsm = (hsm != '-1')
+            entry['hsm'] = hsm
+        if soc_pins_have_drvtype:
+            drvtype = yn_to_boolean(drvtype)
+            entry['drvtype'] = drvtype
+        if soc_pins_have_e_io_hv:
+            e_io_hv = yn_to_boolean(e_io_hv)
+            entry['e_io_hv'] = e_io_hv
         if dbg: print('group entry:', repr(entry))
         groups[group].update(entry)
         return
     m = re_groups_array_drvgroup_entry.match(l)
     if m:
         args = re.split('\s*,\s*', m.group(1))
-        (group, reg, hsm_b, schmitt_b, lpmd_b, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w) = args[0:13]
+
+        (group, reg) = args[0:2]
+        argbase = 2
+        if soc_drvgroups_have_hsm:
+            hsm_b = args[argbase]
+            argbase += 1
+        if soc_drvgroups_have_schmitt:
+            schmitt_b = args[argbase]
+            argbase += 1
+        if soc_drvgroups_have_lpmd:
+            lpmd_b = args[argbase]
+            argbase += 1
+        (drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w) = args[argbase:(argbase + 8)]
+        argbase += 8
+        if soc_drvgroups_have_drvtype:
+            drvtype = args[argbase]
+            argbase += 1
+
         group = 'drive_' + group
         if not group in groups:
             raise Exception('invalid group', group)
         reg = int(reg, 0)
-        hsm_b = int(hsm_b, 0)
-        schmitt_b = int(schmitt_b, 0)
-        lpmd_b = int(lpmd_b, 0)
         drvdn_b = int(drvdn_b, 0)
         drvdn_w = int(drvdn_w, 0)
         drvup_b = int(drvup_b, 0)
@@ -160,9 +237,6 @@ def state_groups_array(l):
         entry = {
             'is_drive': True,
             'reg': reg,
-            'hsm_b': hsm_b,
-            'schmitt_b': schmitt_b,
-            'lpmd_b': lpmd_b,
             'drvdn_b': drvdn_b,
             'drvdn_w': drvdn_w,
             'drvup_b': drvup_b,
@@ -172,10 +246,17 @@ def state_groups_array(l):
             'slwf_b': slwf_b,
             'slwf_w': slwf_w,
         }
-        if len(args) > 13:
-            global soc_has_drvtype
-            soc_has_drvtype = True
-            drvtype = yn_to_boolean(args[13])
+        if soc_drvgroups_have_hsm:
+            hsm_b = int(hsm_b, 0)
+            entry['hsm_b'] = hsm_b
+        if soc_drvgroups_have_schmitt:
+            schmitt_b = int(schmitt_b, 0)
+            entry['schmitt_b'] = schmitt_b
+        if soc_drvgroups_have_lpmd:
+            lpmd_b = int(lpmd_b, 0)
+            entry['lpmd_b'] = lpmd_b
+        if soc_drvgroups_have_drvtype:
+            drvtype = yn_to_boolean(drvtype)
             entry['drvtype'] = drvtype
         if dbg: print('group entry:', repr(entry))
         groups[group].update(entry)
@@ -185,7 +266,6 @@ def state_groups_array(l):
 def state_global(l):
     global num_pin_gpios
     global state_group
-    global soc
     global copyright_years
     global module_author
 
@@ -209,8 +289,8 @@ def state_global(l):
 
     m = re_groups_array_start.match(l)
     if m:
-        soc = m.group(1)
-        if dbg: print('groups array (soc %s):'% soc)
+        set_soc(m.group(1))
+        if dbg: print('groups array (soc %s):' % soc)
         set_state(state_groups_array, re_close_brace)
         return
 
@@ -315,19 +395,30 @@ def main():
 
     print('kernel_copyright_years =', repr(copyright_years))
     print('kernel_author =', repr(module_author))
-    if not soc_has_rcv_sel:
-        print('has_rcv_sel =', repr(soc_has_rcv_sel))
-    if not soc_has_drvtype:
-        print('has_drvtype =', repr(soc_has_drvtype))
+    print()
+    for var in sorted(soc_vars.keys()):
+        print('%s = %s' % (var, repr(globals()[var])))
     print()
 
     def dump_pins(dump_gpios):
         headings = ('name',)
         if dump_gpios:
             headings += ('gpio',)
-        headings += ('reg', 'f0', 'f1', 'f2', 'f3', 'od', 'ior')
-        if soc_has_rcv_sel:
+        headings += ('reg', 'f0', 'f1', 'f2', 'f3')
+        if soc_pins_have_od and not soc_pins_all_have_od:
+            headings += ('od',)
+        if soc_pins_have_ior:
+            headings += ('ior',)
+        if soc_pins_have_rcv_sel:
             headings += ('rcv_sel',)
+        if soc_pins_have_schmitt and not soc_pins_all_have_schmitt:
+            headings += ('schmitt_b',)
+        if soc_pins_have_hsm:
+            headings += ('hsm',)
+        if soc_pins_have_drvtype:
+            headings += ('drvtype',)
+        if soc_pins_have_e_io_hv:
+            headings += ('e_io_hv',)
 
         rows = []
         for pin in pins:
@@ -355,10 +446,21 @@ def main():
                 row += ('0x%x' % g['reg'],)
                 for func in g['funcs']:
                     row += (repr(func),)
-                row += (repr(g['od']), repr(g['ior']))
-                if soc_has_rcv_sel:
-                    row += (repr(g['rcv_sel']),)
 
+                if soc_pins_have_od and not soc_pins_all_have_od:
+                    row += (repr(g['od']),)
+                if soc_pins_have_ior:
+                    row += (repr(g['ior']),)
+                if soc_pins_have_rcv_sel:
+                    row += (repr(g['rcv_sel']),)
+                if soc_pins_have_schmitt and not soc_pins_all_have_schmitt:
+                    row += (repr(g['schmitt_b']),)
+                if soc_pins_have_hsm:
+                    row += (repr(g['hsm']),)
+                if soc_pins_have_drvtype:
+                    row += (repr(g['drvtype']),)
+                if soc_pins_have_e_io_hv:
+                    row += (repr(g['e_io_hv']),)
             rows.append(row)
 
         dump_py_table(headings, rows)
@@ -372,10 +474,17 @@ def main():
     print(')')
     print()
     print('drive_groups = (')
-    print('    #name, r, hsm_b, schmitt_b, lpmd_b, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w', end='')
-    if soc_has_drvtype:
-        print(', drvtype', end='')
-    print()
+    heading = '    #name, r'
+    if soc_drvgroups_have_hsm:
+        heading += ', hsm_b'
+    if soc_drvgroups_have_schmitt:
+        heading += ', schmitt_b'
+    if soc_drvgroups_have_lpmd:
+        heading += ', lpmd_b'
+    heading += ', drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w'
+    if soc_drvgroups_have_drvtype:
+        heading += ', drvtype'
+    print(heading)
     rows = []
     for group in groups:
         g = groups[group]
@@ -384,9 +493,14 @@ def main():
         row = (
             repr(group[6:]),
             '0x%x' % g['reg'],
-            repr(g['hsm_b']),
-            repr(g['schmitt_b']),
-            repr(g['lpmd_b']),
+        )
+        if soc_drvgroups_have_hsm:
+            row += (repr(g['hsm_b']),)
+        if soc_drvgroups_have_schmitt:
+            row += (repr(g['schmitt_b']),)
+        if soc_drvgroups_have_lpmd:
+            row += (repr(g['lpmd_b']),)
+        row += (
             repr(g['drvdn_b']),
             repr(g['drvdn_w']),
             repr(g['drvup_b']),
@@ -396,7 +510,7 @@ def main():
             repr(g['slwf_b']),
             repr(g['slwf_w']),
         )
-        if soc_has_drvtype:
+        if soc_drvgroups_have_drvtype:
             row += (repr(g['drvtype']),)
         rows.append(row)
     dump_py_table(None, rows)
diff --git a/soc-to-kernel-pinctrl-driver.py b/soc-to-kernel-pinctrl-driver.py
index 51c5009433b0..f7743e0d4097 100755
--- a/soc-to-kernel-pinctrl-driver.py
+++ b/soc-to-kernel-pinctrl-driver.py
@@ -116,6 +116,8 @@ if soc.name == 'tegra30':
 else:
     f = soc.drive_groups_by_reg
 for group in f():
+    if group.has_matching_pin:
+        continue
     print('''\
 
 static const unsigned %s_pins[] = {
@@ -155,125 +157,223 @@ static struct tegra_function %s_functions[] = {
 for func in soc.functions_by_alpha():
     print('\tFUNCTION(%s),' % func.name)
 
+drv_pingroup_val = "0x%x" % soc.soc_drv_reg_base
 print('''\
 };
 
-#define DRV_PINGROUP_REG_A		0x868	/* bank 0 */
+#define DRV_PINGROUP_REG_A		%(drv_pingroup_val)s	/* bank 0 */
 #define PINGROUP_REG_A			0x3000	/* bank 1 */
-''', end='')
+''' % globals(), end='')
 
 if len(soc.mipi_pad_ctrl_groups_by_reg()):
     print('#define MIPI_PAD_CTRL_PINGROUP_REG_A	0x820	/* bank 2 */''')
 
 print('''\
 
+#define DRV_PINGROUP_REG(r)		((r) - DRV_PINGROUP_REG_A)
 #define PINGROUP_REG(r)			((r) - PINGROUP_REG_A)
+''', end='')
+
+if len(soc.mipi_pad_ctrl_groups_by_reg()):
+    print('''\
+#define MIPI_PAD_CTRL_PINGROUP_REG_Y(r)	((r) - MIPI_PAD_CTRL_PINGROUP_REG_A)
+''', end='')
+
+print('''\
 
 #define PINGROUP_BIT_Y(b)		(b)
 #define PINGROUP_BIT_N(b)		(-1)
 
 ''', end='')
 
-if soc.has_rcv_sel:
-    print('#define PINGROUP(pg_name, f0, f1, f2, f3, r, od, ior, rcv_sel)		\\')
-    tab = '\t'
+params = ['pg_name', 'f0', 'f1', 'f2', 'f3', 'r']
+if soc.soc_pins_have_od and not soc.soc_pins_all_have_od:
+    params += ['od',]
+if soc.soc_pins_have_ior:
+    params += ['ior',]
+if soc.soc_pins_have_rcv_sel:
+    params += ['rcv_sel',]
+if soc.soc_pins_have_hsm:
+    params += ['hsm',]
+if soc.soc_pins_have_schmitt and not soc.soc_pins_all_have_schmitt:
+    params += ['schmitt',]
+if soc.soc_pins_have_drvtype:
+    params += ['drvtype',]
+if soc.soc_pins_have_e_io_hv:
+    params += ['e_io_hv',]
+drive_params = ['drvdn_b', 'drvdn_w', 'drvup_b', 'drvup_w', 'slwr_b', 'slwr_w', 'slwf_b', 'slwf_w']
+if soc.soc_combine_pin_drvgroup:
+    params += ['rdrv',]
+    params += drive_params
+
+s = gen_wrapped_c_macro_header('PINGROUP', params)
+
+einput_val = str(soc.soc_einput_b)
+
+if soc.soc_pins_have_od:
+    if soc.soc_pins_all_have_od:
+        odrain_val = str(soc.soc_odrain_b)
+    else:
+        odrain_val = 'PINGROUP_BIT_##od(%s)' % str(soc.soc_odrain_b)
 else:
-    print('#define PINGROUP(pg_name, f0, f1, f2, f3, r, od, ior)		\\')
-    tab = ''
+        odrain_val = '-1'
 
-print('''\
-	{							%(tab)s\\
-		.name = #pg_name,				%(tab)s\\
-		.pins = pg_name##_pins,				%(tab)s\\
-		.npins = ARRAY_SIZE(pg_name##_pins),		%(tab)s\\
-		.funcs = {					%(tab)s\\
-			TEGRA_MUX_##f0,				%(tab)s\\
-			TEGRA_MUX_##f1,				%(tab)s\\
-			TEGRA_MUX_##f2,				%(tab)s\\
-			TEGRA_MUX_##f3,				%(tab)s\\
-		},						%(tab)s\\
-		.mux_reg = PINGROUP_REG(r),			%(tab)s\\
-		.mux_bank = 1,					%(tab)s\\
-		.mux_bit = 0,					%(tab)s\\
-		.pupd_reg = PINGROUP_REG(r),			%(tab)s\\
-		.pupd_bank = 1,					%(tab)s\\
-		.pupd_bit = 2,					%(tab)s\\
-		.tri_reg = PINGROUP_REG(r),			%(tab)s\\
-		.tri_bank = 1,					%(tab)s\\
-		.tri_bit = 4,					%(tab)s\\
-		.einput_bit = PINGROUP_BIT_Y(5),		%(tab)s\\
-		.odrain_bit = PINGROUP_BIT_##od(6),		%(tab)s\\
-		.lock_bit = PINGROUP_BIT_Y(7),			%(tab)s\\
-		.ioreset_bit = PINGROUP_BIT_##ior(8),		%(tab)s\\
-''' % {'tab': tab}, end='')
-
-if soc.has_rcv_sel:
-    print('''\
-		.rcv_sel_bit = PINGROUP_BIT_##rcv_sel(9),	%(tab)s\\
-''' % {'tab': tab}, end='')
+if soc.soc_pins_have_ior:
+    ioreset_val = 'PINGROUP_BIT_##ior(8)'
 else:
-    print('''\
-		.rcv_sel_bit = -1,				%(tab)s\\
-''' % {'tab': tab}, end='')
+    ioreset_val = '-1'
+
+# rcv_sel and e_io_hv are different names for essentially the same thing.
+# Re-use the field to save space
+if soc.soc_pins_have_rcv_sel:
+    rcv_sel_val = 'PINGROUP_BIT_##rcv_sel(9),'
+elif soc.soc_pins_have_e_io_hv:
+    rcv_sel_val = 'PINGROUP_BIT_##e_io_hv(10),'
+else:
+    rcv_sel_val = '-1,'
+
+s += '''\
+	{
+		.name = #pg_name,
+		.pins = pg_name##_pins,
+		.npins = ARRAY_SIZE(pg_name##_pins),
+		.funcs = {
+			TEGRA_MUX_##f0,
+			TEGRA_MUX_##f1,
+			TEGRA_MUX_##f2,
+			TEGRA_MUX_##f3,
+		},
+		.mux_reg = PINGROUP_REG(r),
+		.mux_bank = 1,
+		.mux_bit = 0,
+		.pupd_reg = PINGROUP_REG(r),
+		.pupd_bank = 1,
+		.pupd_bit = 2,
+		.tri_reg = PINGROUP_REG(r),
+		.tri_bank = 1,
+		.tri_bit = 4,
+		.einput_bit = %(einput_val)s,
+		.odrain_bit = %(odrain_val)s,
+		.lock_bit = 7,
+		.ioreset_bit = %(ioreset_val)s,
+		.rcv_sel_bit = %(rcv_sel_val)s
+''' % globals()
+
+if soc.soc_pins_have_hsm:
+    s += '''\
+		.hsm_bit = PINGROUP_BIT_##hsm(9),
+'''
+
+if soc.soc_pins_have_schmitt:
+    if soc.soc_pins_all_have_schmitt:
+        s += '''\
+		.schmitt_bit = 12,
+'''
+    else:
+        s += '''\
+		.schmitt_bit = PINGROUP_BIT_##schmitt(12),
+'''
+
+if soc.soc_pins_have_drvtype:
+    s += '''\
+		.drvtype_bit = PINGROUP_BIT_##drvtype(13),
+'''
+
+if soc.soc_combine_pin_drvgroup:
+    # FIXME: if !soc.soc_pins_have_hsm, then we should include hsm_bit
+    # here. Same for schmitt and drvtype. However, no SoCs have that
+    # combination at present, so I don't feel like cluttering the code.
+    # We should also handle !soc_drvgroups_have_lpmd.
+    s += '''\
+		.drv_reg = DRV_PINGROUP_REG(rdrv),
+		.drv_bank = 0,
+		.lpmd_bit = -1,
+		.drvdn_bit = drvdn_b,
+		.drvdn_width = drvdn_w,
+		.drvup_bit = drvup_b,
+		.drvup_width = drvup_w,
+		.slwr_bit = slwr_b,
+		.slwr_width = slwr_w,
+		.slwf_bit = slwf_b,
+		.slwf_width = slwf_w,
+'''
+else:
+    s += '''\
+		.drv_reg = -1,
+'''
+
+s = append_aligned_tabs_indent_with_tabs(s)
+print(s)
 
 print('''\
-		.drv_reg = -1,					%(tab)s\\
 	}
 
-#define DRV_PINGROUP_REG(r)		((r) - DRV_PINGROUP_REG_A)
+''', end='')
 
-''' % {'tab': tab}, end='')
+params = ['pg_name', 'r']
+if soc.soc_drvgroups_have_hsm:
+    params += ['hsm_b',]
+if soc.soc_drvgroups_have_schmitt:
+    params += ['schmitt_b',]
+if soc.soc_drvgroups_have_lpmd:
+    params += ['lpmd_b',]
+params += drive_params
+if soc.soc_drvgroups_have_drvtype:
+    params += ['drvtype',]
+
+s = gen_wrapped_c_macro_header('DRV_PINGROUP', params)
+
+if soc.soc_drvgroups_have_hsm:
+    hsm_bit_val = 'hsm_b'
+else:
+    hsm_bit_val = '-1'
 
-if soc.has_drvtype:
-    print('''\
-#define DRV_PINGROUP(pg_name, r, hsm_b, schmitt_b, lpmd_b,		\\
-		     drvdn_b, drvdn_w, drvup_b, drvup_w,		\\
-		     slwr_b, slwr_w, slwf_b, slwf_w,			\\
-		     drvtype)						\\
-''', end='')
+if soc.soc_drvgroups_have_schmitt:
+    schmitt_bit_val = 'schmitt_b'
 else:
-    print('''\
-#define DRV_PINGROUP(pg_name, r, hsm_b, schmitt_b, lpmd_b,	\\
-		     drvdn_b, drvdn_w, drvup_b, drvup_w,	\\
-		     slwr_b, slwr_w, slwf_b, slwf_w)		\\
-''', end='')
+    schmitt_bit_val = '-1'
 
-print('''\
-	{							%(tab)s\\
-		.name = "drive_" #pg_name,			%(tab)s\\
-		.pins = drive_##pg_name##_pins,			%(tab)s\\
-		.npins = ARRAY_SIZE(drive_##pg_name##_pins),	%(tab)s\\
-		.mux_reg = -1,					%(tab)s\\
-		.pupd_reg = -1,					%(tab)s\\
-		.tri_reg = -1,					%(tab)s\\
-		.einput_bit = -1,				%(tab)s\\
-		.odrain_bit = -1,				%(tab)s\\
-		.lock_bit = -1,					%(tab)s\\
-		.ioreset_bit = -1,				%(tab)s\\
-		.rcv_sel_bit = -1,				%(tab)s\\
-		.drv_reg = DRV_PINGROUP_REG(r),			%(tab)s\\
-		.drv_bank = 0,					%(tab)s\\
-		.hsm_bit = hsm_b,				%(tab)s\\
-		.schmitt_bit = schmitt_b,			%(tab)s\\
-		.lpmd_bit = lpmd_b,				%(tab)s\\
-		.drvdn_bit = drvdn_b,				%(tab)s\\
-		.drvdn_width = drvdn_w,				%(tab)s\\
-		.drvup_bit = drvup_b,				%(tab)s\\
-		.drvup_width = drvup_w,				%(tab)s\\
-		.slwr_bit = slwr_b,				%(tab)s\\
-		.slwr_width = slwr_w,				%(tab)s\\
-		.slwf_bit = slwf_b,				%(tab)s\\
-		.slwf_width = slwf_w,				%(tab)s\\
-''' % {'tab': tab}, end='')
-
-if soc.has_drvtype:
-    print('''\
-		.drvtype_bit = PINGROUP_BIT_##drvtype(6),	%(tab)s\\
-''' % {'tab': tab}, end='')
+if soc.soc_drvgroups_have_lpmd:
+    lpmd_bit_val = 'lpmd_b'
 else:
-    print('''\
-		.drvtype_bit = -1,				%(tab)s\\
-''' % {'tab': tab}, end='')
+    lpmd_bit_val = '-1'
+
+if soc.soc_drvgroups_have_drvtype:
+    drvtype_bit_val = 'PINGROUP_BIT_##drvtype(6),'
+else:
+    drvtype_bit_val = '-1,'
+
+s += '''\
+	{
+		.name = "drive_" #pg_name,
+		.pins = drive_##pg_name##_pins,
+		.npins = ARRAY_SIZE(drive_##pg_name##_pins),
+		.mux_reg = -1,
+		.pupd_reg = -1,
+		.tri_reg = -1,
+		.einput_bit = -1,
+		.odrain_bit = -1,
+		.lock_bit = -1,
+		.ioreset_bit = -1,
+		.rcv_sel_bit = -1,
+		.drv_reg = DRV_PINGROUP_REG(r),
+		.drv_bank = 0,
+		.hsm_bit = %(hsm_bit_val)s,
+		.schmitt_bit = %(schmitt_bit_val)s,
+		.lpmd_bit = %(lpmd_bit_val)s,
+		.drvdn_bit = drvdn_b,
+		.drvdn_width = drvdn_w,
+		.drvup_bit = drvup_b,
+		.drvup_width = drvup_w,
+		.slwr_bit = slwr_b,
+		.slwr_width = slwr_w,
+		.slwf_bit = slwf_b,
+		.slwf_width = slwf_w,
+		.drvtype_bit = %(drvtype_bit_val)s
+''' % globals()
+
+s = append_aligned_tabs_indent_with_tabs(s)
+print(s)
 
 print('''\
 	}
@@ -282,8 +382,6 @@ print('''\
 
 if len(soc.mipi_pad_ctrl_groups_by_reg()):
     print('''\
-#define MIPI_PAD_CTRL_PINGROUP_REG_Y(r)	((r) - MIPI_PAD_CTRL_PINGROUP_REG_A)
-
 #define MIPI_PAD_CTRL_PINGROUP(pg_name, r, b, f0, f1)			\\
 	{								\\
 		.name = "mipi_pad_ctrl_" #pg_name,			\\
@@ -310,7 +408,6 @@ if len(soc.mipi_pad_ctrl_groups_by_reg()):
 
 ''', end='')
 
-
 print('''\
 static const struct tegra_pingroup %s_groups[] = {
 ''' % soc.name, end='')
@@ -324,7 +421,7 @@ if soc.name == 'tegra30':
     max_f3_len = 12
     yn_width = 1
     col_widths = (max_gpio_pin_len, max_f0_len, max_f1_len, max_f2_len, max_f3_len, 6, yn_width, yn_width)
-    if soc.has_rcv_sel:
+    if soc.soc_pins_have_rcv_sel:
         col_widths += (yn_width,)
     right_justifies = None
 elif soc.name in ('tegra114', 'tegra124'):
@@ -335,16 +432,31 @@ elif soc.name in ('tegra114', 'tegra124'):
     max_f3_len = 11
     yn_width = 2
     col_widths = (max_gpio_pin_len, max_f0_len, max_f1_len, max_f2_len, max_f3_len, 6, yn_width, yn_width)
-    if soc.has_rcv_sel:
+    if soc.soc_pins_have_rcv_sel:
         col_widths += (yn_width,)
     right_justifies = (False, False, False, False, False, False, False, True, True, True)
 else:
     col_widths = None
     right_justifies = None
 
-headings = ('pg_name', 'f0', 'f1', 'f2', 'f3', 'r', 'od', 'ior',)
-if soc.has_rcv_sel:
-    headings += ('rcv_sel',)
+headings = ['pg_name', 'f0', 'f1', 'f2', 'f3', 'r']
+if soc.soc_pins_have_od and not soc.soc_pins_all_have_od:
+    headings += ['od',]
+if soc.soc_pins_have_ior:
+    headings += ['ior',]
+if soc.soc_pins_have_rcv_sel:
+    headings += ['rcv_sel',]
+if soc.soc_pins_have_hsm:
+    headings += ['hsm',]
+if soc.soc_pins_have_schmitt and not soc.soc_pins_all_have_schmitt:
+    headings += ['schmitt',]
+if soc.soc_pins_have_drvtype:
+    headings += ['drvtype',]
+if soc.soc_pins_have_e_io_hv:
+    headings += ['e_io_hv',]
+if soc.soc_combine_pin_drvgroup:
+    headings += ['rdrv',]
+    headings += drive_params
 
 rows = []
 # Do not add any more exceptions here; new SoCs should be formatted correctly
@@ -362,11 +474,46 @@ for pin in f():
         pin.f2.upper(),
         pin.f3.upper(),
         '0x%x' % pin.reg,
-        boolean_to_yn(pin.od),
-        boolean_to_yn(pin.ior),
     )
-    if soc.has_rcv_sel:
+    if soc.soc_pins_have_od and not soc.soc_pins_all_have_od:
+        row += (boolean_to_yn(pin.od),)
+    if soc.soc_pins_have_ior:
+        row += (boolean_to_yn(pin.ior),)
+    if soc.soc_pins_have_rcv_sel:
         row += (boolean_to_yn(pin.rcv_sel),)
+    if soc.soc_pins_have_hsm:
+        row += (boolean_to_yn(pin.hsm),)
+    if soc.soc_pins_have_schmitt and not soc.soc_pins_all_have_schmitt:
+        row += (boolean_to_yn(pin.schmitt),)
+    if soc.soc_pins_have_drvtype:
+        row += (boolean_to_yn(pin.drvtype),)
+    if soc.soc_pins_have_e_io_hv:
+        row += (boolean_to_yn(pin.e_io_hv),)
+    if soc.soc_combine_pin_drvgroup:
+        if pin.per_pin_drive_group:
+            row += (
+                '0x%x' % pin.per_pin_drive_group.reg,
+                repr(pin.per_pin_drive_group.drvdn_b),
+                repr(pin.per_pin_drive_group.drvdn_w),
+                repr(pin.per_pin_drive_group.drvup_b),
+                repr(pin.per_pin_drive_group.drvup_w),
+                repr(pin.per_pin_drive_group.slwr_b),
+                repr(pin.per_pin_drive_group.slwr_w),
+                repr(pin.per_pin_drive_group.slwf_b),
+                repr(pin.per_pin_drive_group.slwf_w),
+            )
+        else:
+            row += (
+                '-1',
+                '-1',
+                '-1',
+                '-1',
+                '-1',
+                '-1',
+                '-1',
+                '-1',
+                '-1',
+            )
     rows.append(row)
 dump_c_table(headings, 'PINGROUP', rows, col_widths=col_widths, right_justifies=right_justifies)
 
@@ -376,8 +523,15 @@ if soc.name != 'tegra30':
 
 max_drvgrp_len = max([len(drvgroup.name) for drvgroup in soc.drive_groups_by_reg()])
 
-print('\t/* pg_name, r, hsm_b, schmitt_b, lpmd_b, drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w', end='')
-if soc.has_drvtype:
+print('\t/* pg_name, r, ', end='')
+if soc.soc_drvgroups_have_hsm:
+    print('hsm_b, ', end='')
+if soc.soc_drvgroups_have_schmitt:
+    print('schmitt_b, ', end='')
+if soc.soc_drvgroups_have_lpmd:
+    print('lpmd_b, ', end='')
+print('drvdn_b, drvdn_w, drvup_b, drvup_w, slwr_b, slwr_w, slwf_b, slwf_w', end='')
+if soc.soc_drvgroups_have_drvtype:
     print(', drvtype', end='')
 print(' */')
 
@@ -387,15 +541,27 @@ if soc.name == 'tegra30':
     f = soc.drive_groups_by_alpha
 else:
     f = soc.drive_groups_by_reg
-col_widths = (0, 0, 2, 2, 2, 3, 2, 3, 2, 3, 2, 3, 2, 2)
-right_justifies = (False, False, True, True, True, True, True, True, True, True, True, True, True, True)
+# Do not add any more exceptions here; new SoCs should be formatted correctly
+if soc.name in ('tegra30', 'tegra114', 'tegra124'):
+    col_widths = (0, 0, 2, 2, 2, 3, 2, 3, 2, 3, 2, 3, 2, 2)
+    right_justifies = (False, False, True, True, True, True, True, True, True, True, True, True, True, True)
+else:
+    col_widths = None
+    right_justifies = None
 for drvgroup in f():
+    if drvgroup.has_matching_pin:
+        continue
     row = (
         drvgroup.name,
         '0x%x' % drvgroup.reg,
-        repr(drvgroup.hsm_b),
-        repr(drvgroup.schmitt_b),
-        repr(drvgroup.lpmd_b),
+    )
+    if soc.soc_drvgroups_have_hsm:
+        row += (repr(drvgroup.hsm_b),)
+    if soc.soc_drvgroups_have_schmitt:
+        row += (repr(drvgroup.schmitt_b),)
+    if soc.soc_drvgroups_have_lpmd:
+        row += (repr(drvgroup.lpmd_b),)
+    row += (
         repr(drvgroup.drvdn_b),
         repr(drvgroup.drvdn_w),
         repr(drvgroup.drvup_b),
@@ -405,7 +571,7 @@ for drvgroup in f():
         repr(drvgroup.slwf_b),
         repr(drvgroup.slwf_w),
     )
-    if soc.has_drvtype:
+    if soc.soc_drvgroups_have_drvtype:
         row += (boolean_to_yn(drvgroup.drvtype),)
     rows.append(row)
 dump_c_table(None, 'DRV_PINGROUP', rows, col_widths=col_widths, right_justifies=right_justifies)
@@ -429,6 +595,9 @@ socvars = {
     'author': soc.kernel_author,
     'soc': soc.name,
     'usoc': soc.titlename,
+    'hsm_in_mux': boolean_to_c_bool(soc.soc_pins_have_hsm),
+    'schmitt_in_mux': boolean_to_c_bool(soc.soc_pins_have_schmitt),
+    'drvtype_in_mux': boolean_to_c_bool(soc.soc_pins_have_drvtype),
 }
 
 print('''\
@@ -442,6 +611,9 @@ static const struct tegra_pinctrl_soc_data %(soc)s_pinctrl = {
 	.nfunctions = ARRAY_SIZE(%(soc)s_functions),
 	.groups = %(soc)s_groups,
 	.ngroups = ARRAY_SIZE(%(soc)s_groups),
+	.hsm_in_mux = %(hsm_in_mux)s,
+	.schmitt_in_mux = %(schmitt_in_mux)s,
+	.drvtype_in_mux = %(drvtype_in_mux)s,
 };
 
 static int %(soc)s_pinctrl_probe(struct platform_device *pdev)
diff --git a/soc-to-uboot-driver.py b/soc-to-uboot-driver.py
index 3ef29ecc78b6..8469af94dec2 100755
--- a/soc-to-uboot-driver.py
+++ b/soc-to-uboot-driver.py
@@ -73,10 +73,10 @@ print('''\
 enum pmux_drvgrp {
 ''', file=f, end='')
 
-last_reg = 0x868 - 4
+last_reg = soc.soc_drv_reg_base - 4
 for group in soc.drive_groups_by_reg():
     if group.reg != last_reg + 4:
-        eqs = ' = (0x%x / 4)' % (group.reg - 0x868)
+        eqs = ' = (0x%x / 4)' % (group.reg - soc.soc_drv_reg_base)
     else:
         eqs = ''
     print('\tPMUX_DRVGRP_%s%s,' % (group.fullname.upper()[6:], eqs), file=f)
@@ -97,21 +97,46 @@ for func in soc.functions_by_alpha():
 
 
 print('''\
-	PMUX_FUNC_RSVD1,
-	PMUX_FUNC_RSVD2,
-	PMUX_FUNC_RSVD3,
-	PMUX_FUNC_RSVD4,
+	PMUX_FUNC_RSVD%d,
+	PMUX_FUNC_RSVD%d,
+	PMUX_FUNC_RSVD%d,
+	PMUX_FUNC_RSVD%d,
 	PMUX_FUNC_COUNT,
 };
 
-#define TEGRA_PMX_HAS_PIN_IO_BIT_ETC
-''', file=f, end='')
+''' % tuple(soc.soc_rsvd_base + i for i in range(4)), file=f, end='')
+
+print('#define TEGRA_PMX_SOC_DRV_GROUP_BASE_REG 0x%x' % soc.soc_drv_reg_base, file=f)
+if soc.soc_has_io_clamping:
+    print('#define TEGRA_PMX_SOC_HAS_IO_CLAMPING', file=f)
+
+print('#define TEGRA_PMX_SOC_HAS_DRVGRPS', file=f)
+
+if soc.soc_drvgroups_have_lpmd:
+    print('#define TEGRA_PMX_GRPS_HAVE_LPMD', file=f)
+
+if soc.soc_drvgroups_have_schmitt:
+    print('#define TEGRA_PMX_GRPS_HAVE_SCHMT', file=f)
+
+if soc.soc_drvgroups_have_hsm:
+    print('#define TEGRA_PMX_GRPS_HAVE_HSM', file=f)
+
+print('#define TEGRA_PMX_PINS_HAVE_E_INPUT', file=f)
+print('#define TEGRA_PMX_PINS_HAVE_LOCK', file=f)
+
+if soc.soc_pins_have_od:
+    print('#define TEGRA_PMX_PINS_HAVE_OD', file=f)
+
+if soc.soc_pins_have_ior:
+    print('#define TEGRA_PMX_PINS_HAVE_IO_RESET', file=f)
+
+if soc.soc_pins_have_rcv_sel:
+    print('#define TEGRA_PMX_PINS_HAVE_RCV_SEL', file=f)
 
-if soc.has_rcv_sel:
-    print('#define TEGRA_PMX_HAS_RCV_SEL', file=f)
+if soc.soc_pins_have_e_io_hv:
+    print('#define TEGRA_PMX_PINS_HAVE_E_IO_HV', file=f)
 
 print('''\
-#define TEGRA_PMX_HAS_DRVGRPS
 #include <asm/arch-tegra/pinmux.h>
 
 #endif /* _%s_PINMUX_H_ */
diff --git a/tegra_pmx_board_parser.py b/tegra_pmx_board_parser.py
index 1ea16efb7dca..b72bc8bffc06 100644
--- a/tegra_pmx_board_parser.py
+++ b/tegra_pmx_board_parser.py
@@ -29,8 +29,10 @@ configs_dir = os.path.join(script_dir, 'configs')
 class PinConfig(ReprDictObj):
     def __init__(self, soc, data):
         fields = ('fullname', 'mux', 'gpio_init', 'pull', 'tri', 'e_inp', 'od')
-        if soc.has_rcv_sel:
+        if soc.soc_pins_have_rcv_sel:
             fields += ('rcv_sel', )
+        if soc.soc_pins_have_e_io_hv:
+            fields += ('e_io_hv', )
         for i, field in enumerate(fields):
             self.__setattr__(field, data[i])
         self.gpio_pin = soc.gpio_or_pin_by_fullname(self.fullname)
diff --git a/tegra_pmx_parser_utils.py b/tegra_pmx_parser_utils.py
index cb0606173602..3119b6e78875 100644
--- a/tegra_pmx_parser_utils.py
+++ b/tegra_pmx_parser_utils.py
@@ -34,5 +34,7 @@ class TopLevelParsedObj(ReprDictObj):
             if attr in data:
                 val = data[attr]
             else:
+                if default is None:
+                    raise Exception('Missing variable ' + attr)
                 val = default
             self.__setattr__(attr, val)
diff --git a/tegra_pmx_soc_parser.py b/tegra_pmx_soc_parser.py
index e6335dd87cbe..a07c303d7df9 100644
--- a/tegra_pmx_soc_parser.py
+++ b/tegra_pmx_soc_parser.py
@@ -26,7 +26,7 @@ script_dir = os.path.dirname(os.path.abspath(__file__))
 configs_dir = os.path.join(script_dir, 'configs')
 
 class PinBase(ReprDictObj):
-    def __init__(self, has_rcv_sel, signal, gpio, num, data):
+    def __init__(self, soc, signal, gpio, num, data):
         self.signal = signal
         self.gpio = gpio
         self.num = num
@@ -45,12 +45,32 @@ class PinBase(ReprDictObj):
         if not data:
             self.reg = None
             return
-        fields = ('reg', 'f0', 'f1', 'f2', 'f3', 'od', 'ior')
-        if has_rcv_sel:
+        fields = ('reg', 'f0', 'f1', 'f2', 'f3',)
+        if soc.soc_pins_all_have_od:
+            self.od = True
+        elif soc.soc_pins_have_od:
+            fields += ('od',)
+        if soc.soc_pins_have_ior:
+            fields += ('ior',)
+        if soc.soc_pins_have_rcv_sel:
             fields += ('rcv_sel', )
+        if soc.soc_pins_have_hsm:
+            fields += ('hsm', )
+        if soc.soc_pins_all_have_schmitt:
+            self.schmitt = True
+        elif soc.soc_pins_have_schmitt:
+            fields += ('schmitt', )
+        if soc.soc_pins_have_drvtype:
+            fields += ('drvtype', )
+        if soc.soc_pins_have_e_io_hv:
+            fields += ('e_io_hv', )
         for i, field in enumerate(fields):
             self.__setattr__(field, data[i])
         self.funcs = (self.f0, self.f1, self.f2, self.f3)
+        self.per_pin_drive_group = None
+
+    def set_per_pin_drive_group(self, g):
+        self.per_pin_drive_group = g
 
     def sort_by_num_key(self):
         return (self.__class__ == Pin, self.num)
@@ -65,28 +85,42 @@ def _gpio_number(gpion):
     return (bank * 8) + index
 
 class Gpio(PinBase):
-    def __init__(self, data, has_rcv_sel):
+    def __init__(self, soc, data):
         num = _gpio_number(data[1])
-        PinBase.__init__(self, has_rcv_sel, data[0], data[1], num, data[2:])
+        PinBase.__init__(self, soc, data[0], data[1], num, data[2:])
 
 class Pin(PinBase):
-    def __init__(self, num, data, has_rcv_sel):
-        PinBase.__init__(self, has_rcv_sel, data[0], '', num, data[1:])
+    def __init__(self, soc, num, data):
+        PinBase.__init__(self, soc, data[0], '', num, data[1:])
 
 class DriveGroup(ReprDictObj):
-    def __init__(self, data, gpios_pins, has_drvtype):
-        fields = ('name', 'reg', 'hsm_b', 'schmitt_b', 'lpmd_b', 'drvdn_b',
-                'drvdn_w', 'drvup_b', 'drvup_w', 'slwr_b', 'slwr_w', 'slwf_b',
-                'slwf_w')
-        if has_drvtype:
+    def __init__(self, soc, data, gpios_pins):
+        fields = ('name', 'reg', )
+        if soc.soc_drvgroups_have_hsm:
+            fields += ('hsm_b',)
+        if soc.soc_drvgroups_have_schmitt:
+            fields += ('schmitt_b',)
+        if soc.soc_drvgroups_have_lpmd:
+            fields += ('lpmd_b',)
+        fields += ('drvdn_b', 'drvdn_w', 'drvup_b', 'drvup_w', 'slwr_b',
+            'slwr_w', 'slwf_b', 'slwf_w')
+        if soc.soc_drvgroups_have_drvtype:
             fields += ('drvtype', )
         for i, field in enumerate(fields):
             self.__setattr__(field, data[i])
         self.gpios_pins = gpios_pins
         self.fullname = 'drive_' + self.name
+        self.has_matching_pin = (
+            soc.soc_combine_pin_drvgroup and
+            (len(gpios_pins) == 1) and
+            (gpios_pins[0].shortname == self.name)
+        )
+        if self.has_matching_pin:
+            gpios_pins[0].set_per_pin_drive_group(self)
+
 
 class MipiPadCtrlGroup(ReprDictObj):
-    def __init__(self, data, gpios_pins):
+    def __init__(self, soc, data, gpios_pins):
         fields = ('name', 'reg', 'bit', 'f0', 'f1')
         for i, field in enumerate(fields):
             self.__setattr__(field, data[i])
@@ -107,23 +141,43 @@ class Soc(TopLevelParsedObj):
             ('kernel_copyright_years', 2014),
             ('kernel_author', 'NVIDIA'),
             ('uboot_copyright_years', 2014),
-            ('has_rcv_sel', True),
-            ('has_drvtype', True),
+            ('soc_has_io_clamping', None),
+            ('soc_combine_pin_drvgroup', None),
+            ('soc_rsvd_base', None),
+            ('soc_drvgroups_have_drvtype', None),
+            ('soc_drvgroups_have_hsm', None),
+            ('soc_drvgroups_have_lpmd', None),
+            ('soc_drvgroups_have_schmitt', None),
+            ('soc_pins_all_have_od', None),
+            ('soc_pins_all_have_schmitt', None),
+            ('soc_pins_have_drvtype', None),
+            ('soc_pins_have_e_io_hv', None),
+            ('soc_pins_have_hsm', None),
+            ('soc_pins_have_ior', None),
+            ('soc_pins_have_od', None),
+            ('soc_pins_have_rcv_sel', None),
+            ('soc_pins_have_schmitt', None),
+            ('soc_drv_reg_base', None),
+            ('soc_einput_b', None),
+            ('soc_odrain_b', None),
         )
         TopLevelParsedObj.__init__(self, name, copy_attrs, data)
 
-        gpios_pins_by_name = {}
+        gpios_pins_by_fullname = {}
+        gpios_pins_by_shortname = {}
 
         self._gpios = []
         for gpiodata in data['gpios']:
-            gpio = Gpio(gpiodata, self.has_rcv_sel)
-            gpios_pins_by_name[gpio.fullname] = gpio
+            gpio = Gpio(self, gpiodata)
+            gpios_pins_by_fullname[gpio.fullname] = gpio
+            gpios_pins_by_shortname[gpio.shortname] = gpio
             self._gpios.append(gpio)
 
         self._pins = []
         for num, pindata in enumerate(data['pins']):
-            pin = Pin(num, pindata, self.has_rcv_sel)
-            gpios_pins_by_name[pin.fullname] = pin
+            pin = Pin(self, num, pindata)
+            gpios_pins_by_fullname[pin.fullname] = pin
+            gpios_pins_by_shortname[pin.shortname] = pin
             self._pins.append(pin)
 
         self._drive_groups = []
@@ -131,16 +185,16 @@ class Soc(TopLevelParsedObj):
             names = data['drive_group_pins'][drive_group[0]]
             gpios_pins = []
             for name in names:
-                gpios_pins.append(gpios_pins_by_name[name])
-            self._drive_groups.append(DriveGroup(drive_group, gpios_pins, self.has_drvtype))
+                gpios_pins.append(gpios_pins_by_fullname[name])
+            self._drive_groups.append(DriveGroup(self, drive_group, gpios_pins))
 
         self._mipi_pad_ctrl_groups = []
         for group in data.get('mipi_pad_ctrl_groups', []):
             names = data['mipi_pad_ctrl_group_pins'][group[0]]
             gpios_pins = []
             for name in names:
-                gpios_pins.append(gpios_pins_by_name[name])
-            self._mipi_pad_ctrl_groups.append(MipiPadCtrlGroup(group, gpios_pins))
+                gpios_pins.append(gpios_pins_by_fullname[name])
+            self._mipi_pad_ctrl_groups.append(MipiPadCtrlGroup(self, group, gpios_pins))
 
         self._generate_derived_data()
 
diff --git a/tegra_pmx_utils.py b/tegra_pmx_utils.py
index 0635ab899724..ece3c1606dc0 100644
--- a/tegra_pmx_utils.py
+++ b/tegra_pmx_utils.py
@@ -20,14 +20,17 @@
 
 import sys
 
-def emit_tab_padding_to(curpos, targetpos):
+def gen_tab_padding_to(curpos, targetpos):
     curpos -= 1
     targetpos -= 1
     if (targetpos & 7):
         raise Exception(str(targetpos) + ' is not a TAB stop')
     left = targetpos - curpos
     tabs = (left + 7) // 8
-    print('\t' * tabs, end='')
+    return '\t' * tabs
+
+def emit_tab_padding_to(curpos, targetpos):
+    print(gen_tab_padding_to(curpos, targetpos), end='')
 
 def emit_padded_field(s, maxl, skip_comma=False, right_justify=False, file=sys.stdout):
     pad = (' ' * (maxl - len(s)))
@@ -46,12 +49,57 @@ def emit_define(define, value, valuecol):
     emit_tab_padding_to(len(s) + 1, valuecol)
     print(value)
 
+def gen_wrapped_c_macro_header(macro, params):
+    intro = '#define %s(' % macro
+    intro_space = ' ' * len(intro)
+    s = ''
+    l = intro
+    for i, param in enumerate(params):
+        if i != 0:
+            prefix = ' '
+        else:
+            prefix = ''
+        if i == len(params) - 1:
+            suffix = ')'
+        else:
+            suffix = ','
+        #           ', '             ','
+        if (len(l) + len(prefix) + len(param) + len(suffix)) < 71:
+            l += prefix + param + suffix
+        else:
+            s += l + '\n'
+            l = intro_space + param + suffix
+    if l:
+        s += l
+        s += '\n'
+    return s
+
+def append_aligned_tabs_indent_with_tabs(s):
+    lines = s.split('\n')
+    if lines[-1].strip() == '':
+        del lines[-1]
+    for i, l in enumerate(lines):
+        lines[i] = l.replace('\t', '        ')
+    max_len = 0
+    for l in lines:
+        max_len = max(max_len, len(l))
+    tabpos = (max_len + 7) // 8
+    for i, l in enumerate(lines):
+        remaining = 72 - len(l)
+        lines[i] += gen_tab_padding_to(len(l) + 1, 73) + '\\'
+    for i, l in enumerate(lines):
+        lines[i] = l.replace('        ', '\t')
+    return '\n'.join(lines)
+
 def yn_to_boolean(s):
     return {'N': False, 'Y': True}[s]
 
 def boolean_to_yn(val):
     return {True: 'Y', False: 'N'}[val]
 
+def boolean_to_c_bool(val):
+    return {True: 'true', False: 'false'}[val]
+
 def dump_table(heading_prefix, heading_suffix, headings, row_prefix, row_suffix, rows, col_widths, file, right_justifies):
     num_cols = 0
     if headings:
-- 
1.9.1
