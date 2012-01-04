From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/6] dt: tegra gpio: Flesh out binding documentation
Date: Wed,  4 Jan 2012 11:39:34 -0700
Message-ID: <1325702378-20863-2-git-send-email-swarren@nvidia.com>
References: <1325702378-20863-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1325702378-20863-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Document the required reg and interrupts properties.
Add a complete example.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio_nvidia.txt       |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt b/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt
index eb4b530..50b363c 100644
--- a/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio_nvidia.txt
@@ -2,7 +2,25 @@ NVIDIA Tegra 2 GPIO controller
 
 Required properties:
 - compatible : "nvidia,tegra20-gpio"
+- reg : Physical base address and length of the controller's registers.
+- interrupts : The interrupt outputs from the controller.
 - #gpio-cells : Should be two. The first cell is the pin number and the
   second cell is used to specify optional parameters:
   - bit 0 specifies polarity (0 for normal, 1 for inverted)
 - gpio-controller : Marks the device node as a GPIO controller.
+
+Example:
+
+gpio: gpio@6000d000 {
+	compatible = "nvidia,tegra20-gpio";
+	reg = < 0x6000d000 0x1000 >;
+	interrupts = < 0 32 0x04
+		       0 33 0x04
+		       0 34 0x04
+		       0 35 0x04
+		       0 55 0x04
+		       0 87 0x04
+		       0 89 0x04 >;
+	#gpio-cells = <2>;
+	gpio-controller;
+};
-- 
1.7.0.4
