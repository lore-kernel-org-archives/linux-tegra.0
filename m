From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: gpio: Use engineering names in DT compatible property
Date: Tue,  5 Jul 2011 14:15:18 -0600
Message-ID: <1309896918-22496-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Engineering names are more stable than marketing names. Hence, use them
for Device Tree compatible properties instead.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Grant, This patch is physically against devicetree/arm, but also makes
sense to apply to devicetree/test. This patch will cause conflicts
somewhere, given you previously posted a patch to move gpio.c into
drivers/gpio.

 .../devicetree/bindings/gpio/gpio_nvidia.txt       |    2 +-
 arch/arm/mach-tegra/gpio.c                         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt b/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt
index afb3ff3..64aac39 100644
--- a/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt
@@ -1,7 +1,7 @@
 NVIDIA Tegra 2 GPIO controller
 
 Required properties:
-- compatible : "nvidia,tegra250-gpio"
+- compatible : "nvidia,tegra20-gpio"
 - #gpio-cells : Should be two. The first cell is the pin number and the
   second cell is used to specify optional parameters (currently unused).
 - gpio-controller : Marks the device node as a GPIO controller.
diff --git a/arch/arm/mach-tegra/gpio.c b/arch/arm/mach-tegra/gpio.c
index 13afb88..747eb40 100644
--- a/arch/arm/mach-tegra/gpio.c
+++ b/arch/arm/mach-tegra/gpio.c
@@ -347,7 +347,7 @@ static int __init tegra_gpio_init(void)
 	 * driver is converted into a platform_device
 	 */
 	tegra_gpio_chip.of_node = of_find_compatible_node(NULL, NULL,
-						"nvidia,tegra250-gpio");
+						"nvidia,tegra20-gpio");
 #endif /* CONFIG_OF_GPIO */
 
 	gpiochip_add(&tegra_gpio_chip);
-- 
1.7.0.4
