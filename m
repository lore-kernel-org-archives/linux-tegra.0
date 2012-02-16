From: Danny Kukawka <danny.kukawka-2YacvwyR+KOzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] arch/arm/mach-tegra/board-dt-tegra20.c: included asm/hardware/gic.h twice
Date: Thu, 16 Feb 2012 15:44:31 +0100
Message-ID: <1329403471-32438-1-git-send-email-danny.kukawka@bisect.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Danny Kukawka <dkukawka-l3A5Bk7waGM@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

arch/arm/mach-tegra/board-dt-tegra20.c: included 'asm/hardware/gic.h'
twice remove the duplicates.

Signed-off-by: Danny Kukawka <danny.kukawka-2YacvwyR+KOzQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/mach-tegra/board-dt-tegra20.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
index 7a95e0b..2a0351b 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -37,7 +37,6 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/time.h>
 #include <asm/setup.h>
-#include <asm/hardware/gic.h>
 
 #include <mach/iomap.h>
 #include <mach/irqs.h>
-- 
1.7.8.3
