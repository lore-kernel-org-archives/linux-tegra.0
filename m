From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH 2/8] pinctrl: Include <linux/bug.h> to prevent compile errors
Date: Fri, 16 Mar 2012 14:54:23 -0600
Message-ID: <1331931269-12262-2-git-send-email-swarren@wwwdotorg.org>
References: <1331931269-12262-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1331931269-12262-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
Cc: Linus Walleij <linus.walleij@stericsson.com>, B29396@freescale.com, s.hauer@pengutronix.de, dongas86@gmail.com, shawn.guo@linaro.org, thomas.abraham@linaro.org, tony@atomide.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

Macros in <linux/pinctrl/machine.h> call ARRAY_SIZE(), the definition of
which eventually calls BUILD_BUG_ON_ZERO(), which is defined in
<linux/bug.h>. Include that so that every .c file using the pinctrl macros
doesn't have to do that itself.

Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>
---
v2: Fix accidental replacing of pinctrl-state.h with pinctrl.h
---
 include/linux/pinctrl/machine.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/linux/pinctrl/machine.h b/include/linux/pinctrl/machine.h
index fee4349..226444e 100644
--- a/include/linux/pinctrl/machine.h
+++ b/include/linux/pinctrl/machine.h
@@ -12,6 +12,8 @@
 #ifndef __LINUX_PINCTRL_MACHINE_H
 #define __LINUX_PINCTRL_MACHINE_H
 
+#include <linux/bug.h>
+
 #include "pinctrl-state.h"
 
 enum pinctrl_map_type {
-- 
1.7.0.4
