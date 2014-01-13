From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: fix tegra_powergate_sequence_power_up() inline
Date: Mon, 13 Jan 2014 15:01:42 -0700
Message-ID: <1389650502-30017-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Remove an invalid semicolon from the inline dummy, thus solving:
In file included from drivers/gpu/drm/tegra/gr3d.c:15:0:
include/linux/tegra-powergate.h:119:1: error: expected identifier or '(' before '{' token

Fixes: 80b28791ff04 ("ARM: tegra: pass reset to tegra_powergate_sequence_power_up()")
Reported-by: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/linux/tegra-powergate.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/tegra-powergate.h b/include/linux/tegra-powergate.h
index e6f2ab3014a7..46f0a07812b4 100644
--- a/include/linux/tegra-powergate.h
+++ b/include/linux/tegra-powergate.h
@@ -115,7 +115,7 @@ static inline int tegra_powergate_remove_clamping(int id)
 }
 
 static inline int tegra_powergate_sequence_power_up(int id, struct clk *clk,
-						    struct reset_control *rst);
+						    struct reset_control *rst)
 {
 	return -ENOSYS;
 }
-- 
1.8.1.5
