From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [pinmux scripts PATCH] remove invalid uses of rsvd1 from beaver config
Date: Tue, 23 Feb 2016 21:42:06 +0100
Message-ID: <1456260126-16113-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Replace by actual function names of pinmux option 1.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 configs/beaver.board | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/configs/beaver.board b/configs/beaver.board
index 9202a5e..a2fd0dd 100644
--- a/configs/beaver.board
+++ b/configs/beaver.board
@@ -22,8 +22,8 @@ pins = (
     ('sdmmc3_dat0_pb7',        'sdmmc3',       None,      'up',   False, True,  False),
     ('sdmmc3_dat4_pd1',        'sdmmc3',       None,      'up',   False, True,  False),
     ('sdmmc3_dat5_pd0',        'sdmmc3',       None,      'up',   False, True,  False),
-    ('sdmmc3_dat6_pd3',        'rsvd1',        None,      'none', False, True,  False),
-    ('sdmmc3_dat7_pd4',        'rsvd1',        None,      'none', False, True,  False),
+    ('sdmmc3_dat6_pd3',        'spdif',        None,      'none', False, True,  False),
+    ('sdmmc3_dat7_pd4',        'spdif',        None,      'none', False, True,  False),
     ('sdmmc4_clk_pcc4',        'sdmmc4',       None,      'none', False, True,  False),
     ('sdmmc4_cmd_pt7',         'sdmmc4',       None,      'up',   False, True,  False),
     ('sdmmc4_dat0_paa0',       'sdmmc4',       None,      'up',   False, True,  False),
@@ -48,7 +48,7 @@ pins = (
     ('ulpi_data0_po1',         'uarta',        None,      'none', False, False, False),
     ('ulpi_data1_po2',         'uarta',        None,      'none', False, True,  False),
     ('ulpi_data2_po3',         'uarta',        None,      'none', False, True,  False),
-    ('ulpi_data3_po4',         'rsvd1',        None,      'none', False, True,  False),
+    ('ulpi_data3_po4',         'uarta',        None,      'none', False, True,  False),
     ('ulpi_data4_po5',         'uarta',        None,      'none', False, True,  False),
     ('ulpi_data5_po6',         'uarta',        None,      'none', False, True,  False),
     ('ulpi_data6_po7',         'uarta',        None,      'none', False, True,  False),
@@ -62,7 +62,7 @@ pins = (
     ('dap3_dout_pp2',          'i2s2',         None,      'none', False, True,  False),
     ('dap3_sclk_pp3',          'i2s2',         None,      'none', False, True,  False),
     ('pv2',                    'owr',          None,      'none', False, False, False),
-    ('pv3',                    'rsvd1',        None,      'none', False, False, False),
+    ('pv3',                    'clk_12m_out',  None,      'none', False, False, False),
     ('clk2_out_pw5',           'extperiph2',   None,      'none', False, True,  False),
     ('clk2_req_pcc5',          'dap',          None,      'none', False, True,  False),
     ('lcd_pwr1_pc1',           'displaya',     None,      'none', False, True,  False),
@@ -107,14 +107,14 @@ pins = (
     ('lcd_dc1_pd2',            'displaya',     None,      'none', False, True,  False),
     ('crt_hsync_pv6',          'crt',          None,      'none', False, False, False),
     ('crt_vsync_pv7',          'crt',          None,      'none', False, False, False),
-    ('vi_d0_pt4',              'rsvd1',        None,      'none', False, True,  False),
+    ('vi_d0_pt4',              'ddr',          None,      'none', False, True,  False),
     ('vi_d1_pd5',              'sdmmc2',       None,      'none', False, True,  False),
     ('vi_d2_pl0',              'sdmmc2',       None,      'none', False, True,  False),
     ('vi_d3_pl1',              'sdmmc2',       None,      'none', False, True,  False),
     ('vi_d4_pl2',              'vi',           None,      'none', False, False, False),
     ('vi_d5_pl3',              'sdmmc2',       None,      'none', False, True,  False),
     ('vi_d7_pl5',              'sdmmc2',       None,      'none', False, True,  False),
-    ('vi_d10_pt2',             'rsvd1',        None,      'none', False, True,  False),
+    ('vi_d10_pt2',             'ddr',          None,      'none', False, True,  False),
     ('vi_mclk_pt1',            'vi',           None,      'up',   False, True,  False),
     ('uart2_rxd_pc3',          'uartb',        None,      'none', False, True,  False),
     ('uart2_txd_pc2',          'uartb',        None,      'none', False, False, False),
@@ -124,13 +124,13 @@ pins = (
     ('uart3_txd_pw6',          'uartc',        None,      'none', False, False, False),
     ('uart3_rts_n_pc0',        'uartc',        None,      'none', False, False, False),
     ('uart3_cts_n_pa1',        'uartc',        None,      'none', False, True,  False),
-    ('pu0',                    'rsvd1',        None,      'none', False, True,  False),
+    ('pu0',                    'owr',          None,      'none', False, True,  False),
     ('pu1',                    'rsvd1',        None,      'none', False, False, False),
     ('pu2',                    'rsvd1',        None,      'none', False, True,  False),
-    ('pu3',                    'rsvd1',        None,      'none', False, True,  False),
+    ('pu3',                    'pwm0',         None,      'none', False, True,  False),
     ('pu4',                    'pwm1',         None,      'none', False, False, False),
     ('pu5',                    'pwm2',         None,      'none', False, False, False),
-    ('pu6',                    'rsvd1',        None,      'none', False, True,  False),
+    ('pu6',                    'pwm3',         None,      'none', False, True,  False),
     ('dap4_fs_pp4',            'i2s3',         None,      'none', False, True,  False),
     ('dap4_din_pp5',           'i2s3',         None,      'none', False, True,  False),
     ('dap4_dout_pp6',          'i2s3',         None,      'none', False, True,  False),
@@ -146,8 +146,8 @@ pins = (
     ('gmi_a18_pb1',            'spi4',         None,      'none', False, True,  False),
     ('gmi_a19_pk7',            'spi4',         None,      'none', False, True,  False),
     ('cam_mclk_pcc0',          'vi_alt3',      None,      'up',   False, True,  False),
-    ('pcc1',                   'rsvd1',        None,      'none', False, True,  False),
-    ('pbb0',                   'rsvd1',        None,      'none', False, True,  False),
+    ('pcc1',                   'i2s4',         None,      'none', False, True,  False),
+    ('pbb0',                   'i2s4',         None,      'none', False, True,  False),
     ('pbb3',                   'vgp3',         None,      'none', False, True,  False),
     ('pbb5',                   'vgp5',         None,      'none', False, True,  False),
     ('pbb6',                   'vgp6',         None,      'none', False, True,  False),
@@ -210,9 +210,9 @@ pins = (
     ('pex_l2_rst_n_pcc6',      'pcie',         None,      'none', False, False, False),
     ('pex_l2_clkreq_n_pcc7',   'pcie',         None,      'none', False, True,  False),
     ('hdmi_cec_pee3',          'cec',          None,      'none', False, True,  False),
-    ('hdmi_int_pn7',           'rsvd1',        None,      'none', True,  True,  False),
+    ('hdmi_int_pn7',           'hdmi',         None,      'none', True,  True,  False),
     ('gmi_iordy_pi5',          'rsvd1',        None,      'up',   False, True,  False),
-    ('vi_d11_pt3',             'rsvd1',        None,      'up',   False, True,  False),
+    ('vi_d11_pt3',             'ddr',          None,      'up',   False, True,  False),
     ('gmi_ad12_ph4',           'nand',         None,      'up',   False, True,  False),
     ('gmi_ad14_ph6',           'nand',         None,      'none', False, False, False),
     ('spi2_sck_px2',           'gmi',          None,      'none', False, True,  False),
@@ -221,8 +221,8 @@ pins = (
     ('vi_d8_pl6',              'sdmmc2',       None,      'none', False, True,  False),
     ('vi_d9_pl7',              'sdmmc2',       None,      'none', False, True,  False),
     ('vi_pclk_pt0',            'rsvd1',        None,      'up',   False, True,  False),
-    ('vi_hsync_pd7',           'rsvd1',        None,      'none', False, True,  False),
-    ('vi_vsync_pd6',           'rsvd1',        None,      'none', False, True,  False),
+    ('vi_hsync_pd7',           'ddr',          None,      'none', False, True,  False),
+    ('vi_vsync_pd6',           'ddr',          None,      'none', False, True,  False),
     ('gmi_wait_pi7',           'nand',         None,      'up',   True,  False, False),
     ('gmi_adv_n_pk0',          'nand',         None,      'none', True,  False, False),
     ('gmi_clk_pk1',            'nand',         None,      'none', True,  False, False),
-- 
2.5.0
