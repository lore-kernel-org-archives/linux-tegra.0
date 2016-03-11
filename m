From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 3/5] dt-bindings: Add documentation for GM20B GPU
Date: Fri, 11 Mar 2016 12:51:56 +0900
Message-ID: <1457668318-2821-4-git-send-email-acourbot@nvidia.com>
References: <1457668318-2821-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457668318-2821-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

GM20B's definition is mostly similar to GK20A's, but requires an
additional clock.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 .../devicetree/bindings/gpu/nvidia,gk20a.txt       | 27 ++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
index 1e3748337319..2609b0f3337c 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
@@ -1,9 +1,10 @@
-NVIDIA GK20A Graphics Processing Unit
+NVIDIA Tegra Graphics Processing Units
 
 Required properties:
 - compatible: "nvidia,<gpu>"
   Currently recognized values:
   - nvidia,gk20a
+  - nvidia,gm20b
 - reg: Physical base address and length of the controller's registers.
   Must contain two entries:
   - first entry for bar0
@@ -19,6 +20,9 @@ Required properties:
 - clock-names: Must include the following entries:
   - gpu
   - pwr
+If the compatible string is "nvidia,gm20b", then the following clock
+is also required:
+  - pllg_ref
 - resets: Must contain an entry for each entry in reset-names.
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
@@ -27,7 +31,7 @@ Required properties:
 Optional properties:
 - iommus: A reference to the IOMMU. See ../iommu/iommu.txt for details.
 
-Example:
+Example for GK20A:
 
 	gpu@0,57000000 {
 		compatible = "nvidia,gk20a";
@@ -45,3 +49,22 @@ Example:
 		iommus = <&mc TEGRA_SWGROUP_GPU>;
 		status = "disabled";
 	};
+
+Example for GM20B:
+
+	gpu@0,57000000 {
+		compatible = "nvidia,gm20b";
+		reg = <0x0 0x57000000 0x0 0x01000000>,
+		      <0x0 0x58000000 0x0 0x01000000>;
+		interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "stall", "nonstall";
+		clocks = <&tegra_car TEGRA210_CLK_GPU>,
+			 <&tegra_car TEGRA210_CLK_PLL_P_OUT5>,
+			 <&tegra_car TEGRA210_CLK_PLL_G_REF>;
+		clock-names = "gpu", "pwr", "pllg_ref";
+		resets = <&tegra_car 184>;
+		reset-names = "gpu";
+		iommus = <&mc TEGRA_SWGROUP_GPU>;
+		status = "disabled";
+	};
-- 
2.7.2
