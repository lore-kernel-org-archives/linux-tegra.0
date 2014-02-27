From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2 3/3] ARM: tegra: fix Dalmore PMIC IRQ polarity
Date: Thu, 27 Feb 2014 13:51:21 -0700
Message-ID: <1393534281-30759-3-git-send-email-swarren@wwwdotorg.org>
References: <1393534281-30759-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393534281-30759-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, J Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra PMC's resume-from-sleep logic wants an active-low IRQ input
from the PMIC. However, the PMIC IRQ is also routed to the GIC, which
only supports active high IRQs (or rising edge). Hence, the signal must
be inverted in the PMC before being routed to the GIC. This implies that
the PMC DT property nvidia,invert-interrupt must be set, and it is.

The PMIC's DT interrupts property must represent the IRQ level at the
GIC, since that is the PMIC's parent IRQ controller. Fix the PMIC's
interrupts property to correctly describe the GIC input polarity.

However, the PMIC IRQ output's polarity is programmable in HW, and by
default follows the parent IRQ controller's input polarity. We need to
have an active-low output due to the inversion inside the Tegra PMC.
Hence, add the ti,irq-externally-inverted property to the PMIC.

Reported-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: No change.
---
 arch/arm/boot/dts/tegra114-dalmore.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 8de543777882..2977206cafc9 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -893,7 +893,8 @@
 		palmas: tps65913@58 {
 			compatible = "ti,palmas";
 			reg = <0x58>;
-			interrupts = <0 86 IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <0 86 IRQ_TYPE_LEVEL_HIGH>;
+			ti,irq-externally-inverted;
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
-- 
1.8.1.5
