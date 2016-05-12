From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V4 8/9] dt-bindings: arm-gic: Add documentation for Tegra210 AGIC
Date: Thu, 12 May 2016 16:19:31 +0100
Message-ID: <1463066372-13115-9-git-send-email-jonathanh@nvidia.com>
References: <1463066372-13115-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463066372-13115-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra AGIC is an interrupt controller that is compatible with the
ARM GIC-400, however, it is a 2nd level controller and requires runtime
power-management because it is outside the main CPU complex. Ideally,
the AGIC would use the existing "arm,gic-400" compatibility string, but
because of the power management requirements it cannot be initialised
early and is initialised by a platform driver. Therefore, to distinguish
between the Tegra AGIC and a normal GIC-400, and to ensure that the
appropriate driver initialises the AGIC, add the compatible string and
clock information for the AGIC to the GIC device-tree binding
documentation.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
index 793c20ff8fcc..5393e2a45a42 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
@@ -21,6 +21,7 @@ Main node required properties:
 	"arm,pl390"
 	"arm,tc11mp-gic"
 	"brcm,brahma-b15-gic"
+	"nvidia,tegra210-agic"
 	"qcom,msm-8660-qgic"
 	"qcom,msm-qgic2"
 - interrupt-controller : Identifies the node as an interrupt controller
@@ -68,7 +69,7 @@ Optional
 	"ic_clk" (for "arm,arm11mp-gic")
 	"PERIPHCLKEN" (for "arm,cortex-a15-gic")
 	"PERIPHCLK", "PERIPHCLKEN" (for "arm,cortex-a9-gic")
-	"clk" (for "arm,gic-400")
+	"clk" (for "arm,gic-400" and "nvidia,tegra210")
 	"gclk" (for "arm,pl390")
 
 - power-domains : A phandle and PM domain specifier as defined by bindings of
-- 
2.1.4
