From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH tegra-pinmux-scripts 1/2] fix kernel dt generation for Tegra 3
Date: Mon,  5 Jan 2015 22:47:26 +0100
Message-ID: <1420494447-18510-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

There is no attribute rcv_sel on Tegra 3.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 board-to-kernel-dt.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board-to-kernel-dt.py b/board-to-kernel-dt.py
index 86739db..20f27c3 100755
--- a/board-to-kernel-dt.py
+++ b/board-to-kernel-dt.py
@@ -56,7 +56,7 @@ for pincfg in board.pincfgs_by_num():
     print('				nvidia,enable-input = <' + mapper_bool(pincfg.e_inp) + '>;')
     if pincfg.gpio_pin.od:
         print('				nvidia,open-drain = <' + mapper_bool(pincfg.od) + '>;')
-    if pincfg.gpio_pin.rcv_sel:
+    if hasattr(pincfg.gpio_pin, 'rcv_sel') and pincfg.gpio_pin.rcv_sel:
         print('				nvidia,rcv-sel = <' + mapper_bool(pincfg.rcv_sel) + '>;')
     print('			};')
 
-- 
2.1.0
