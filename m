From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH 2/2] Only warn about unconfigured pins if they have a register
Date: Tue, 17 Feb 2015 11:56:09 -0700
Message-ID: <1424199369-10937-2-git-send-email-swarren@wwwdotorg.org>
References: <1424199369-10937-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424199369-10937-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Some pins don't have a register and hence can't be configured. Don't warn
that those pins are unconfigured.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra_pmx_board_parser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tegra_pmx_board_parser.py b/tegra_pmx_board_parser.py
index 7b45abe74a00..1ea16efb7dca 100644
--- a/tegra_pmx_board_parser.py
+++ b/tegra_pmx_board_parser.py
@@ -64,7 +64,7 @@ class Board(TopLevelParsedObj):
         return self._pincfgs_by_num
 
     def warn_about_unconfigured_pins(self):
-        unconfigured_gpio_pins = {gpio_pin.fullname for gpio_pin in self.soc.gpios_pins_by_num()}
+        unconfigured_gpio_pins = [gpio_pin.fullname for gpio_pin in self.soc.gpios_pins_by_num() if gpio_pin.reg]
         for gpio_pin in self.pincfgs_by_num():
             unconfigured_gpio_pins.remove(gpio_pin.gpio_pin.fullname)
         for gpio_pin in unconfigured_gpio_pins:
-- 
1.9.1
