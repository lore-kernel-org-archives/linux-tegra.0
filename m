From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH] Import latest Jetson TK1 spreadsheet
Date: Thu, 21 Apr 2016 15:58:12 -0600
Message-ID: <1461275892-3798-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This imports v11 of "Jetson TK1 Development Platform Pin Mux" from
https://developer.nvidia.com/embedded/downloads.

The new version defines the mux option for the MIPI pad ctrl selection.
The OWR pin no longer has an entry in the configuration table because
the only mux option it support is OWR, that feature isn't supported, and
hence can't conflict with any other pin. This pin can only usefully be
used as a GPIO.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 configs/jetson-tk1.board | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configs/jetson-tk1.board b/configs/jetson-tk1.board
index 9b029df2f479..57d05935f25d 100644
--- a/configs/jetson-tk1.board
+++ b/configs/jetson-tk1.board
@@ -182,7 +182,6 @@ pins = (
     ('uart3_rts_n_pc0',        'gmi',          None,      'down', True,  False, False, False),
     ('uart3_rxd_pw7',          'rsvd2',        None,      'down', True,  False, False, False),
     ('uart3_txd_pw6',          'rsvd2',        None,      'down', True,  False, False, False),
-    ('owr',                    'rsvd2',        None,      'down', True,  False, False, False),
     ('hdmi_cec_pee3',          'cec',          None,      'none', False, True,  False, False),
     ('hdmi_int_pn7',           None,           'in',      'down', True,  True,  False, False),
     ('ddc_scl_pv4',            'i2c4',         None,      'none', False, True,  False, False),
@@ -196,3 +195,8 @@ pins = (
 
 drive_groups = (
 )
+
+mipi_pad_ctrl_groups = (
+    #pin,     mux
+    ('dsi_b', 'dsi_b'),
+)
-- 
2.8.1
