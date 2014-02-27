From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2 1/3] dt: palmas: support IRQ inversion at the board level
Date: Thu, 27 Feb 2014 13:51:19 -0700
Message-ID: <1393534281-30759-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, J Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Some boards or SoCs have an inverter between the PMIC IRQ output pin and
the IRQ controller input signal.

The IRQ specifier in DT is meant to represent the IRQ flags at the input
to the IRQ controller.

The Palmas HW's IRQ output has configurable polarity. Software needs to
know which polarity to choose for the IRQ output. Software may be tempted
to extract the IRQ polarity from the IRQ specifier in order to make this
choice.

That approach works fine if the IRQ signal is routed directly from the
PMIC to the IRQ controller with no intervening logic. However, if the
signal is inverted between the two, this approach gets the wrong answer.

Add an additional optional DT property which indicates that such an
inversion occurs. This allows DT to give complete information about the
desired IRQ output polarity to software.

An alternative would have been to add a new non-optional DT parameter to
indicate the exact desired output polarity. However, this would have been
an incompatible change to the DT binding.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
v2: Split V1's patch 1/2 into separate patches 1/3 and 2/3.
---
 Documentation/devicetree/bindings/mfd/palmas.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/palmas.txt b/Documentation/devicetree/bindings/mfd/palmas.txt
index e5f0f8303461..76ec509d5f87 100644
--- a/Documentation/devicetree/bindings/mfd/palmas.txt
+++ b/Documentation/devicetree/bindings/mfd/palmas.txt
@@ -18,6 +18,12 @@ Required properties:
   ti,tps659038
 and also the generic series names
   ti,palmas
+- interrupts : Should contain a single entry for the IRQ output.
+- ti,irq-externally-inverted : If missing, the polarity of the Palmas IRQ
+  output should be set to the opposite of the polarity indicated by the IRQ
+  specifier in the interrupts property. If absent, the polarity should be
+  configured to match. This allows the representation of an inverter between
+  the Palmas IRQ output and the interrupt parent's IRQ input.
 - interrupt-controller : palmas has its own internal IRQs
 - #interrupt-cells : should be set to 2 for IRQ number and flags
   The first cell is the IRQ number.
-- 
1.8.1.5
