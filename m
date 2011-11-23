From: Axel Lin <axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: remove declaration of tegra_assert_system_reset
 in board.h
Date: Wed, 23 Nov 2011 19:04:44 +0800
Message-ID: <1322046284.27165.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

commit b2f745 "ARM: restart: tegra: use new restart hook"
changed tegra_assert_system_reset to be static but forgot to
remove the declaration in arch/arm/mach-tegra/board.h.

Remove the declaration of tegra_assert_system_reset in
arch/arm/mach-tegra/board.h to fix below build error:

  CC      arch/arm/mach-tegra/common.o
arch/arm/mach-tegra/common.c:34: error: static declaration of 'tegra_assert_system_reset' follows non-static declaration
arch/arm/mach-tegra/board.h:26: note: previous declaration of 'tegra_assert_system_reset' was here
make[1]: *** [arch/arm/mach-tegra/common.o] Error 1
make: *** [arch/arm/mach-tegra] Error 2

Signed-off-by: Axel Lin <axel.lin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
I got the build error on linux-next tree.
This patch is against linux-next 20111123.

 arch/arm/mach-tegra/board.h |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/board.h b/arch/arm/mach-tegra/board.h
index 1d14df7..f159577 100644
--- a/arch/arm/mach-tegra/board.h
+++ b/arch/arm/mach-tegra/board.h
@@ -23,8 +23,6 @@
 
 #include <linux/types.h>
 
-void tegra_assert_system_reset(char mode, const char *cmd);
-
 void __init tegra_init_early(void);
 void __init tegra_map_common_io(void);
 void __init tegra_init_irq(void);
-- 
1.7.5.4
