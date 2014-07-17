From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: [PATCH] ARM: tegra: Fix comment typo 'CONFIG_SLEEP'
Date: Thu, 17 Jul 2014 11:45:57 +0200
Message-ID: <1405590357.4808.15.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
---
Untested! Please shout if that bothers you.

This typo entered linux-next as of today (in next-20140717). Its fix
would be fine for the trivial tree, if trivial would track linux-next.
But it doesn't.

 include/linux/tegra-soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/tegra-soc.h b/include/linux/tegra-soc.h
index 197aa5bd66d2..25caa520b784 100644
--- a/include/linux/tegra-soc.h
+++ b/include/linux/tegra-soc.h
@@ -81,7 +81,7 @@ void tegra_pmc_restart(enum reboot_mode mode, const char *cmd);
 enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void);
 void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode);
 void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode);
-#endif /* CONFIG_SLEEP */
+#endif /* CONFIG_PM_SLEEP */
 
 #ifdef CONFIG_SMP
 bool tegra_pmc_cpu_is_powered(int cpuid);
-- 
1.9.3
