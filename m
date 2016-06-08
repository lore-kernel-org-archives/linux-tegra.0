From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [PATCH] ARM: tegra: fix missing include of cpuidle.h
Date: Wed,  8 Jun 2016 17:56:39 +0100
Message-ID: <1465404999-16788-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Several files are missing declarations from cpuidle.h so fix
the following warnings by including it:

arch/arm/mach-tegra/cpuidle-tegra20.c:216:6: warning: symbol 'tegra20_cpuidle_pcie_irqs_in_use' was not declared. Should it be static?
arch/arm/mach-tegra/cpuidle-tegra20.c:223:12: warning: symbol 'tegra20_cpuidle_init' was not declared. Should it be static?
arch/arm/mach-tegra/cpuidle-tegra30.c:144:12: warning: symbol 'tegra30_cpuidle_init' was not declared. Should it be static?
arch/arm/mach-tegra/cpuidle-tegra114.c:91:12: warning: symbol 'tegra114_cpuidle_init' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
---
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/arm/mach-tegra/cpuidle-tegra114.c | 1 +
 arch/arm/mach-tegra/cpuidle-tegra20.c  | 1 +
 arch/arm/mach-tegra/cpuidle-tegra30.c  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/mach-tegra/cpuidle-tegra114.c b/arch/arm/mach-tegra/cpuidle-tegra114.c
index 9157546..800bcba 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra114.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra114.c
@@ -28,6 +28,7 @@
 
 #include "pm.h"
 #include "sleep.h"
+#include "cpuidle.h"
 
 #ifdef CONFIG_PM_SLEEP
 #define TEGRA114_MAX_STATES 2
diff --git a/arch/arm/mach-tegra/cpuidle-tegra20.c b/arch/arm/mach-tegra/cpuidle-tegra20.c
index 7469347..8ee8108 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra20.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra20.c
@@ -36,6 +36,7 @@
 #include "pm.h"
 #include "reset.h"
 #include "sleep.h"
+#include "cpuidle.h"
 
 #ifdef CONFIG_PM_SLEEP
 static bool abort_flag;
diff --git a/arch/arm/mach-tegra/cpuidle-tegra30.c b/arch/arm/mach-tegra/cpuidle-tegra30.c
index 4dbe1da..7df3ab0 100644
--- a/arch/arm/mach-tegra/cpuidle-tegra30.c
+++ b/arch/arm/mach-tegra/cpuidle-tegra30.c
@@ -32,6 +32,7 @@
 
 #include "pm.h"
 #include "sleep.h"
+#include "cpuidle.h"
 
 #ifdef CONFIG_PM_SLEEP
 static int tegra30_idle_lp2(struct cpuidle_device *dev,
-- 
2.8.1
