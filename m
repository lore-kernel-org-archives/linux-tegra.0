From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/9] arm/tegra: Harmony PCIe: Don't touch pinmux
Date: Fri, 16 Dec 2011 15:12:26 -0700
Message-ID: <1324073552-15542-4-git-send-email-swarren@nvidia.com>
References: <1324073552-15542-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324073552-15542-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Harmony pinmux table is already set up to mux the PCIe signals onto
the appropriate pin groups. Don't manually fiddle with the pinmux in the
Harmony PCIe setup code.

Merge note: This will have a merge conflict with Peter De Schrijver's
"arm/tegra: prepare pinmux code for multiple tegra variants" due to
context. When merging the two, make sure to also remove the include
of <mach/pinmux-tegra20.h> that his patch added, since it's no longer
needed after this patch.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony-pcie.c |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony-pcie.c b/arch/arm/mach-tegra/board-harmony-pcie.c
index 6db7d69..33c4fed 100644
--- a/arch/arm/mach-tegra/board-harmony-pcie.c
+++ b/arch/arm/mach-tegra/board-harmony-pcie.c
@@ -22,7 +22,6 @@
 
 #include <asm/mach-types.h>
 
-#include <mach/pinmux.h>
 #include "board.h"
 #include "board-harmony.h"
 
@@ -48,10 +47,6 @@ static int __init harmony_pcie_init(void)
 
 	regulator_enable(regulator);
 
-	tegra_pinmux_set_tristate(TEGRA_PINGROUP_GPV, TEGRA_TRI_NORMAL);
-	tegra_pinmux_set_tristate(TEGRA_PINGROUP_SLXA, TEGRA_TRI_NORMAL);
-	tegra_pinmux_set_tristate(TEGRA_PINGROUP_SLXK, TEGRA_TRI_NORMAL);
-
 	err = tegra_pcie_init(true, true);
 	if (err)
 		goto err_pcie;
@@ -59,10 +54,6 @@ static int __init harmony_pcie_init(void)
 	return 0;
 
 err_pcie:
-	tegra_pinmux_set_tristate(TEGRA_PINGROUP_GPV, TEGRA_TRI_TRISTATE);
-	tegra_pinmux_set_tristate(TEGRA_PINGROUP_SLXA, TEGRA_TRI_TRISTATE);
-	tegra_pinmux_set_tristate(TEGRA_PINGROUP_SLXK, TEGRA_TRI_TRISTATE);
-
 	regulator_disable(regulator);
 	regulator_put(regulator);
 err_reg:
-- 
1.7.0.4
