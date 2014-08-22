From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux PATCH] Jetson TK1: add missing PCIe-related pin configuration
Date: Fri, 22 Aug 2014 15:02:33 -0600
Message-ID: <1408741353-10259-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Jetson TK1 spreadsheet is missing configuration for the PCIe clk_req,
rst, and wake pins. This causes the generated pinmux tables to also omit
any configuration for these pins, which in turn causes U-Boot's and the
Linux Kernel's PCIe support to fail.

Manually add configuration for these pins. The values here match the
values found in the downstream L4T kernel, and common sense based on the
usage of these pins.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 configs/jetson-tk1.board | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configs/jetson-tk1.board b/configs/jetson-tk1.board
index 1df628406985..f69b89ec0af8 100644
--- a/configs/jetson-tk1.board
+++ b/configs/jetson-tk1.board
@@ -89,6 +89,11 @@ pins = (
     ('pi7',                    'rsvd1',        None,      'down', True,  False, False, False),
     ('pc7',                    None,           'in',      'up',   False, True,  False, False),
     ('pi0',                    None,           'out0',    'none', False, False, False, False),
+    ('pex_l0_clkreq_n_pdd2',   'pe0',          None,      'up',   False, True,  False, False),
+    ('pex_l0_rst_n_pdd1',      'pe0',          None,      'none', False, False, False, False),
+    ('pex_l1_clkreq_n_pdd6',   'pe1',          None,      'up',   False, True,  False, False),
+    ('pex_l1_rst_n_pdd5',      'pe1',          None,      'none', False, False, False, False),
+    ('pex_wake_n_pdd3',        'pe',           None,      'up',   False, True,  False, False),
     ('usb_vbus_en2_pff1',      None,           'out0',    'none', False, False, False, False),
     ('pff2',                   None,           'in',      'up',   False, True,  False, False),
     ('clk2_out_pw5',           'extperiph2',   None,      'none', False, False, False, False),
-- 
2.1.0.rc2.3.g67de23d
