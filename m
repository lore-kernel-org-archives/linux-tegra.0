From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: Harmony PCIe: Remove unnecessary include
Date: Wed, 11 Jan 2012 16:10:40 -0700
Message-ID: <1326323440-23977-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This file no longer uses pinmux APIs, and hence doesn't need to include
a pinmux header.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony-pcie.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony-pcie.c b/arch/arm/mach-tegra/board-harmony-pcie.c
index 1fc5c57..33c4fed 100644
--- a/arch/arm/mach-tegra/board-harmony-pcie.c
+++ b/arch/arm/mach-tegra/board-harmony-pcie.c
@@ -22,7 +22,6 @@
 
 #include <asm/mach-types.h>
 
-#include <mach/pinmux-tegra20.h>
 #include "board.h"
 #include "board-harmony.h"
 
-- 
1.7.0.4
