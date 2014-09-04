From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [tegra-pinmux-scripts PATCH] Add APB misc MIPI pad control
Date: Thu,  4 Sep 2014 11:46:57 -0400
Message-ID: <1409845617-22025-1-git-send-email-seanpaul@chromium.org>
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
 configs/jetson-tk1.board | 10 ++++++++++
 configs/norrin.board     | 10 ++++++++++
 configs/tegra124.soc     | 22 ++++++++++++++++++++++
 configs/venice2.board    | 10 ++++++++++
 4 files changed, 52 insertions(+)

diff --git a/configs/jetson-tk1.board b/configs/jetson-tk1.board
index f69b89e..a71bb1d 100644
--- a/configs/jetson-tk1.board
+++ b/configs/jetson-tk1.board
@@ -192,6 +192,16 @@ pins = (
     ('usb_vbus_en0_pn4',       'usb',          None,      'up',   False, True,  True,  False),
     ('usb_vbus_en1_pn5',       'usb',          None,      'up',   False, True,  True,  False),
     ('dp_hpd_pff0',            'dp',           None,      'up',   False, True,  False, False),
+    ('dsi_b_clk_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_clk_p',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d0_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d0_p',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d1_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d1_p',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d2_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d2_p',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d3_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d3_p',	       'csi',         None,      'none', False, False, False, False),
 )
 
 drive_groups = (
diff --git a/configs/norrin.board b/configs/norrin.board
index d96d366..1939e6b 100644
--- a/configs/norrin.board
+++ b/configs/norrin.board
@@ -192,6 +192,16 @@ pins = (
     ('usb_vbus_en0_pn4',       'usb',         None,      'none', False, True,  True,  False),
     ('usb_vbus_en1_pn5',       'usb',         None,      'none', False, True,  True,  False),
     ('dp_hpd_pff0',            'dp',          None,      'up',   False, True,  False, False),
+    ('dsi_b_clk_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_clk_p',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d0_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d0_p',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d1_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d1_p',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d2_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d2_p',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d3_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d3_p',	       'csi',         None,      'none', False, False, False, False),
 )
 
 drive_groups = (
diff --git a/configs/tegra124.soc b/configs/tegra124.soc
index 1e13bba..1f4611a 100644
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
@@ -523,4 +533,16 @@ drive_group_pins = {
     'ao4': (
         'jtag_rtck',
     ),
+    'apb_dsi_b': (
+	'dsi_b_clk_p',
+	'dsi_b_clk_n',
+	'dsi_b_d0_p',
+	'dsi_b_d0_n',
+	'dsi_b_d1_p',
+	'dsi_b_d1_n',
+	'dsi_b_d2_p',
+	'dsi_b_d2_n',
+	'dsi_b_d3_p',
+	'dsi_b_d3_n',
+    ),
 }
diff --git a/configs/venice2.board b/configs/venice2.board
index ea888e8..fb4f6a1 100644
--- a/configs/venice2.board
+++ b/configs/venice2.board
@@ -192,6 +192,16 @@ pins = (
     ('usb_vbus_en0_pn4',       'usb',         None,      'none', False, True,  True,  False),
     ('usb_vbus_en1_pn5',       'usb',         None,      'none', False, True,  True,  False),
     ('dp_hpd_pff0',            'dp',          None,      'up',   False, True,  False, False),
+    ('dsi_b_clk_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_clk_p',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d0_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d0_p',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d1_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d1_p',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d2_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d2_p',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d3_n',	       'csi',         None,      'none', False, False, False, False),
+    ('dsi_b_d3_p',	       'csi',         None,      'none', False, False, False, False),
 )
 
 drive_groups = (
-- 
2.0.0
