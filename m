From: Stephen Warren <swarren@nvidia.com>
Subject: [RFC PATCH v2 13/13] arm/tegra: Remove temporary gpio/pinmux registration workaround
Date: Mon, 15 Aug 2011 14:28:20 -0600
Message-ID: <1313440100-17131-14-git-send-email-swarren@nvidia.com>
References: <1313440100-17131-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1313440100-17131-1-git-send-email-swarren@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Colin Cross <ccross@android.com>, Erik Gilling <konkers@android.com>, Olof Johansson <olof@lixom.net>
Cc: Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Belisko Marek <marek.belisko@gmail.com>, Jamie Iles <jamie@jamieiles.com>, Shawn Guo <shawn.guo@freescale.com>, Sergei Shtylyov <sshtylyov@mvista.com>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This reverts commit "arm/tegra: Avoid duplicate gpio/pinmux devices with
dt"; board-dt.c no long calls harmony/seaboard_pinmux_init(), so the
workaround is no longer needed.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 arch/arm/mach-tegra/board-harmony-pinmux.c  |    5 +----
 arch/arm/mach-tegra/board-seaboard-pinmux.c |    5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony-pinmux.c b/arch/arm/mach-tegra/board-harmony-pinmux.c
index 130018d..e99b456 100644
--- a/arch/arm/mach-tegra/board-harmony-pinmux.c
+++ b/arch/arm/mach-tegra/board-harmony-pinmux.c
@@ -14,8 +14,6 @@
  *
  */
 
-#include <asm/mach-types.h>
-
 #include <linux/kernel.h>
 #include <linux/gpio.h>
 #include <mach/pinmux.h>
@@ -163,8 +161,7 @@ static struct tegra_gpio_table gpio_table[] = {
 
 void harmony_pinmux_init(void)
 {
-	if (machine_is_harmony())
-		platform_add_devices(pinmux_devices, ARRAY_SIZE(pinmux_devices));
+	platform_add_devices(pinmux_devices, ARRAY_SIZE(pinmux_devices));
 
 	tegra_pinmux_config_table(harmony_pinmux, ARRAY_SIZE(harmony_pinmux));
 
diff --git a/arch/arm/mach-tegra/board-seaboard-pinmux.c b/arch/arm/mach-tegra/board-seaboard-pinmux.c
index bc4dc17..f092298 100644
--- a/arch/arm/mach-tegra/board-seaboard-pinmux.c
+++ b/arch/arm/mach-tegra/board-seaboard-pinmux.c
@@ -12,8 +12,6 @@
  *
  */
 
-#include <asm/mach-types.h>
-
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/gpio.h>
@@ -178,8 +176,7 @@ static struct tegra_gpio_table gpio_table[] = {
 
 void __init seaboard_pinmux_init(void)
 {
-	if (machine_is_seaboard())
-		platform_add_devices(pinmux_devices, ARRAY_SIZE(pinmux_devices));
+	platform_add_devices(pinmux_devices, ARRAY_SIZE(pinmux_devices));
 
 	tegra_pinmux_config_table(seaboard_pinmux, ARRAY_SIZE(seaboard_pinmux));
 
-- 
1.7.0.4
