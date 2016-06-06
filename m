From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 8/9] dt-bindings: arm-gic: Add documentation for Tegra210 AGIC
Date: Mon, 6 Jun 2016 12:53:42 +0100
Message-ID: <1465214023-8299-9-git-send-email-jonathanh@nvidia.com>
References: <1465214023-8299-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465214023-8299-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Kevin Hilman <khilman@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra AGIC interrupt controller is compatible with the ARM GIC-400
interrupt controller. Add the compatible string and clock information
for the AGIC to the GIC device-tree binding documentation.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
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
