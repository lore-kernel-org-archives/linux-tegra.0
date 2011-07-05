From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] dt: docs: tegra: Use engineering names in DT compatible
	property
Date: Tue,  5 Jul 2011 14:29:22 -0600
Message-ID: <1309897762-23564-4-git-send-email-swarren@nvidia.com>
References: <1309897762-23564-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1309897762-23564-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Engineering names are more stable than marketing names. Hence, use them
for Device Tree compatible properties instead.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/usage-model |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/usage-model b/Documentation/devicetree/usage-model
index 03a56b3..45e03b8 100644
--- a/Documentation/devicetree/usage-model
+++ b/Documentation/devicetree/usage-model
@@ -240,7 +240,7 @@ About now is a good time to lay out an example.  Here is part of the
 device tree for the NVIDIA Tegra board.
 
 /{
-	compatible = "nvidia,harmony", "nvidia,tegra250";
+	compatible = "nvidia,harmony", "nvidia,tegra20";
 	#address-cells = <1>;
 	#size-cells = <1>;
 	interrupt-parent = <&intc>;
@@ -254,33 +254,33 @@ device tree for the NVIDIA Tegra board.
 	};
 
 	soc {
-		compatible = "nvidia,tegra250-soc", "simple-bus";
+		compatible = "nvidia,tegra20-soc", "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
 
 		intc: interrupt-controller@50041000 {
-			compatible = "nvidia,tegra250-gic";
+			compatible = "nvidia,tegra20-gic";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			reg = <0x50041000 0x1000>, < 0x50040100 0x0100 >;
 		};
 
 		serial@70006300 {
-			compatible = "nvidia,tegra250-uart";
+			compatible = "nvidia,tegra20-uart";
 			reg = <0x70006300 0x100>;
 			interrupts = <122>;
 		};
 
 		i2s-1: i2s@70002800 {
-			compatible = "nvidia,tegra250-i2s";
+			compatible = "nvidia,tegra20-i2s";
 			reg = <0x70002800 0x100>;
 			interrupts = <77>;
 			codec = <&wm8903>;
 		};
 
 		i2c@7000c000 {
-			compatible = "nvidia,tegra250-i2c";
+			compatible = "nvidia,tegra20-i2c";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x7000c000 0x100>;
-- 
1.7.0.4
