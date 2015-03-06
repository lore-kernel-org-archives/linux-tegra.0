From: Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH] Update Nyan-Big pinmux from ChromeOS
Date: Fri,  6 Mar 2015 20:07:15 +0000
Message-ID: <1425672435-19031-1-git-send-email-daniels@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Update the pinmux, in particular USB and SD/MMC pin configuration, from
downstream ChromeOS kernel. Fixes external USB falling off completely
during heavy eMMC activity.

Signed-off-by: Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 configs/nyan-big.board | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/nyan-big.board b/configs/nyan-big.board
index 6ebe466..03d40d4 100644
--- a/configs/nyan-big.board
+++ b/configs/nyan-big.board
@@ -94,7 +94,7 @@ pins = (
     ('pex_l1_clkreq_n_pdd6',   'rsvd2',       None,      'down', True,  False, False, False),
     ('pex_l1_rst_n_pdd5',      'rsvd2',       None,      'down', True,  False, False, False),
     ('pex_wake_n_pdd3',        'rsvd2',       None,      'down', True,  False, False, False),
-    ('usb_vbus_en2_pff1',      'rsvd2',       None,      'down', True,  False, False, False),
+    ('usb_vbus_en2_pff1',      'rsvd2',       None,      'up',   True,  True,  False, False),
     ('pff2',                   'rsvd2',       None,      'down', True,  False, False, False),
     ('clk2_out_pw5',           'rsvd2',       None,      'down', True,  False, False, False),
     ('clk2_req_pcc5',          'rsvd2',       None,      'down', True,  False, False, False),
@@ -105,16 +105,16 @@ pins = (
     ('sdmmc1_dat1_py6',        'sdmmc1',      None,      'up',   False, True,  False, False),
     ('sdmmc1_dat2_py5',        'sdmmc1',      None,      'up',   False, True,  False, False),
     ('sdmmc1_dat3_py4',        'sdmmc1',      None,      'up',   False, True,  False, False),
-    ('sdmmc3_clk_pa6',         'sdmmc3',      None,      'none', False, False, False, False),
+    ('sdmmc3_clk_pa6',         'sdmmc3',      None,      'none', False, True,  False, False),
     ('sdmmc3_cmd_pa7',         'sdmmc3',      None,      'up',   False, True,  False, False),
     ('sdmmc3_dat0_pb7',        'sdmmc3',      None,      'up',   False, True,  False, False),
     ('sdmmc3_dat1_pb6',        'sdmmc3',      None,      'up',   False, True,  False, False),
     ('sdmmc3_dat2_pb5',        'sdmmc3',      None,      'up',   False, True,  False, False),
     ('sdmmc3_dat3_pb4',        'sdmmc3',      None,      'up',   False, True,  False, False),
-    ('sdmmc3_clk_lb_out_pee4', 'sdmmc3',      None,      'none', False, False, False, False),
+    ('sdmmc3_clk_lb_out_pee4', 'sdmmc3',      None,      'none', False, True,  False, False),
     ('sdmmc3_clk_lb_in_pee5',  'sdmmc3',      None,      'up',   False, True,  False, False),
     ('sdmmc4_clk_pcc4',        'sdmmc4',      None,      'none', False, True,  False, False),
-    ('sdmmc4_cmd_pt7',         'sdmmc4',      None,      'none', False, True,  False, False),
+    ('sdmmc4_cmd_pt7',         'sdmmc4',      None,      'up',   False, True,  False, False),
     ('sdmmc4_dat0_paa0',       'sdmmc4',      None,      'up',   False, True,  False, False),
     ('sdmmc4_dat1_paa1',       'sdmmc4',      None,      'up',   False, True,  False, False),
     ('sdmmc4_dat2_paa2',       'sdmmc4',      None,      'up',   False, True,  False, False),
@@ -183,14 +183,14 @@ pins = (
     ('uart3_rxd_pw7',          'rsvd2',       None,      'down', True,  False, False, False),
     ('uart3_txd_pw6',          'rsvd2',       None,      'down', True,  False, False, False),
     ('owr',                    'rsvd2',       None,      'down', True,  False, False, False),
-    ('hdmi_cec_pee3',          'cec',         None,      'none', False, True,  True,  False),
-    ('hdmi_int_pn7',           None,          'in',      'down', False, True,  False, False),
+    ('hdmi_cec_pee3',          'cec',         None,      'none', False, True,  False, False),
+    ('hdmi_int_pn7',           'rsvd1',       'in',      'down', False, True,  False, False),
     ('ddc_scl_pv4',            'i2c4',        None,      'none', False, True,  False, False),
     ('ddc_sda_pv5',            'i2c4',        None,      'none', False, True,  False, False),
     ('spdif_out_pk5',          'rsvd2',       None,      'down', True,  False, False, False),
     ('spdif_in_pk6',           None,          'out0',    'down', False, False, False, False),
-    ('usb_vbus_en0_pn4',       'usb',         None,      'none', False, True,  True,  False),
-    ('usb_vbus_en1_pn5',       'usb',         None,      'none', False, True,  True,  False),
+    ('usb_vbus_en0_pn4',       'usb',         None,      'up',   False, True,  False, False),
+    ('usb_vbus_en1_pn5',       'usb',         None,      'up',   False, True,  False, False),
     ('dp_hpd_pff0',            'dp',          None,      'none', False, True,  False, False),
 )
 
-- 
2.3.1
