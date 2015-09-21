From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH] p2371-2180: import latest spreadsheet
Date: Mon, 21 Sep 2015 16:44:26 -0600
Message-ID: <1442875466-20031-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In order to avoid any assumptions about any device connected to
P2371-2180's expansion connector, the latest pinmux spreadsheet
configures all muxable pins on that connector to be GPIO inputs, with
on-chip pulls where appropriate.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 configs/p2371-2180.board | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/configs/p2371-2180.board b/configs/p2371-2180.board
index 85de7ec2d318..83a5ea699300 100644
--- a/configs/p2371-2180.board
+++ b/configs/p2371-2180.board
@@ -2,13 +2,13 @@ soc = 'tegra210'
 
 pins = (
     #pin,                    mux,          gpio_init, pull,   tri,   e_inp, od,    e_io_hv
-    ('aud_mclk_pbb0',        'aud',        None,      'none', False, False, False, False),
-    ('gpio_x1_aud_pbb3',     None,         'out0',    'none', False, False, False, False),
-    ('pe6',                  None,         'in',      'up',   False, True,  False, False),
-    ('dap1_din_pb1',         'i2s1',       None,      'none', False, True,  False, False),
-    ('dap1_dout_pb2',        'i2s1',       None,      'none', False, True,  False, False),
-    ('dap1_fs_pb0',          'i2s1',       None,      'none', False, True,  False, False),
-    ('dap1_sclk_pb3',        'i2s1',       None,      'none', False, True,  False, False),
+    ('aud_mclk_pbb0',        None,         'in',      'up',   False, True,  False, False),
+    ('gpio_x1_aud_pbb3',     None,         'in',      'up',   False, True,  False, False),
+    ('pe6',                  None,         'in',      'down', False, True,  False, False),
+    ('dap1_din_pb1',         None,         'in',      'down', False, True,  False, False),
+    ('dap1_dout_pb2',        None,         'in',      'down', False, True,  False, False),
+    ('dap1_fs_pb0',          None,         'in',      'down', False, True,  False, False),
+    ('dap1_sclk_pb3',        None,         'in',      'down', False, True,  False, False),
     ('pk0',                  'i2s5b',      None,      'none', False, True,  False, False),
     ('pk1',                  'i2s5b',      None,      'none', False, True,  False, False),
     ('pk2',                  'i2s5b',      None,      'none', False, True,  False, False),
@@ -21,8 +21,8 @@ pins = (
     ('dap4_dout_pj6',        'i2s4b',      None,      'none', False, True,  False, False),
     ('dap4_fs_pj4',          'i2s4b',      None,      'none', False, True,  False, False),
     ('dap4_sclk_pj7',        'i2s4b',      None,      'none', False, True,  False, False),
-    ('dmic3_clk_pe4',        'dmic3',      None,      'none', False, False, False, False),
-    ('dmic3_dat_pe5',        'dmic3',      None,      'up',   False, True,  False, False),
+    ('dmic3_clk_pe4',        None,         'in',      'down', False, True,  False, False),
+    ('dmic3_dat_pe5',        None,         'in',      'down', False, True,  False, False),
     ('gen1_i2c_scl_pj1',     'i2c1',       None,      'none', False, True,  False, False),
     ('gen1_i2c_sda_pj0',     'i2c1',       None,      'none', False, True,  False, False),
     ('gen2_i2c_scl_pj2',     'i2c2',       None,      'none', False, True,  False, True),
@@ -77,8 +77,8 @@ pins = (
     ('pk7',                  None,         'in',      'up',   False, True,  False, False),
     ('uart1_tx_pu0',         'uarta',      None,      'none', False, False, False, False),
     ('uart1_rx_pu1',         'uarta',      None,      'up',   False, True,  False, False),
-    ('uart1_rts_pu2',        'uarta',      None,      'none', False, False, False, False),
-    ('uart1_cts_pu3',        'uarta',      None,      'up',   False, True,  False, False),
+    ('uart1_rts_pu2',        None,         'in',      'down', False, True,  False, False),
+    ('uart1_cts_pu3',        None,         'in',      'down', False, True,  False, False),
     ('uart3_tx_pd1',         'uartc',      None,      'none', False, False, False, False),
     ('uart3_rx_pd2',         'uartc',      None,      'up',   False, True,  False, False),
     ('uart3_rts_pd3',        'uartc',      None,      'none', False, False, False, False),
@@ -88,15 +88,15 @@ pins = (
     ('uart2_rts_pg2',        'uartb',      None,      'none', False, False, False, False),
     ('uart2_cts_pg3',        'uartb',      None,      'up',   False, True,  False, False),
     ('jtag_rtck',            'jtag',       None,      'none', False, False, False, False),
-    ('als_prox_int_px3',     None,         'in',      'up',   False, True,  False, False),
+    ('als_prox_int_px3',     None,         'in',      'down', False, True,  False, False),
     ('motion_int_px2',       None,         'in',      'up',   False, True,  False, False),
     ('nfc_int_pi1',          None,         'in',      'up',   False, True,  False, False),
-    ('ap_wake_nfc_ph7',      None,         'out0',    'none', False, False, False, False),
+    ('ap_wake_nfc_ph7',      None,         'in',      'down', False, True,  False, False),
     ('gps_en_pi2',           None,         'out0',    'none', False, False, False, False),
     ('ph6',                  None,         'in',      'up',   False, True,  False, False),
     ('pk5',                  None,         'out0',    'none', False, False, False, False),
     ('ap_ready_pv5',         None,         'out0',    'none', False, False, False, False),
-    ('modem_wake_ap_px0',    None,         'in',      'up',   False, True,  False, False),
+    ('modem_wake_ap_px0',    None,         'in',      'down', False, True,  False, False),
     ('pk4',                  None,         'in',      'up',   False, True,  False, False),
     ('pk6',                  None,         'in',      'up',   False, True,  False, False),
     ('pl1',                  None,         'in',      'up',   False, True,  False, False),
@@ -105,11 +105,11 @@ pins = (
     ('spi4_miso_pd0',        'spi4',       None,      'down', False, True,  False, False),
     ('spi4_sck_pc5',         'spi4',       None,      'down', False, True,  False, False),
     ('spi4_cs0_pc6',         'spi4',       None,      'up',   False, True,  False, False),
-    ('spi1_mosi_pc0',        'spi1',       None,      'down', False, True,  False, False),
-    ('spi1_miso_pc1',        'spi1',       None,      'down', False, True,  False, False),
-    ('spi1_sck_pc2',         'spi1',       None,      'down', False, True,  False, False),
-    ('spi1_cs0_pc3',         'spi1',       None,      'up',   False, True,  False, False),
-    ('spi1_cs1_pc4',         'spi1',       None,      'up',   False, True,  False, False),
+    ('spi1_mosi_pc0',        None,         'in',      'down', False, True,  False, False),
+    ('spi1_miso_pc1',        None,         'in',      'down', False, True,  False, False),
+    ('spi1_sck_pc2',         None,         'in',      'down', False, True,  False, False),
+    ('spi1_cs0_pc3',         None,         'in',      'up',   False, True,  False, False),
+    ('spi1_cs1_pc4',         None,         'in',      'up',   False, True,  False, False),
     ('spi2_mosi_pb4',        'spi2',       None,      'none', False, True,  False, False),
     ('spi2_miso_pb5',        'spi2',       None,      'none', False, True,  False, False),
     ('spi2_sck_pb6',         'spi2',       None,      'none', False, True,  False, False),
-- 
1.9.1
