From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 1/2] dt-bindings: Add documentation for GV11B GPU
Date: Fri, 17 Jul 2020 10:36:08 +0200
Message-ID: <20200717083609.557205-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Debarshi Dutta <ddutta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The GV11B's device tree bindings are the same as for GP10B, though the
GPU is not completely compatible, so all that is needed is a different
compatible string.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v3:
- document the "fuse" clock which needs to be enabled during the GPU
  initialization

 .../devicetree/bindings/gpu/nvidia,gk20a.txt  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
index f32bbba4d3bc..662a3c8a7d29 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
@@ -6,6 +6,7 @@ Required properties:
   - nvidia,gk20a
   - nvidia,gm20b
   - nvidia,gp10b
+  - nvidia,gv11b
 - reg: Physical base address and length of the controller's registers.
   Must contain two entries:
   - first entry for bar0
@@ -25,6 +26,9 @@ Required properties:
 If the compatible string is "nvidia,gm20b", then the following clock
 is also required:
   - ref
+If the compatible string is "nvidia,gv11b", then the following clock is also
+required:
+  - fuse
 - resets: Must contain an entry for each entry in reset-names.
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
@@ -88,3 +92,24 @@ Example for GP10B:
 		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_GPU>;
 		iommus = <&smmu TEGRA186_SID_GPU>;
 	};
+
+Example for GV11B:
+
+	gpu@17000000 {
+		compatible = "nvidia,gv11b";
+		reg = <0x17000000 0x10000000>,
+		      <0x18000000 0x10000000>;
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "stall", "nonstall";
+		clocks = <&bpmp TEGRA194_CLK_GPCCLK>,
+			 <&bpmp TEGRA194_CLK_GPU_PWR>,
+			 <&bpmp TEGRA194_CLK_FUSE>;
+		clock-names = "gpu", "pwr", "fuse";
+		resets = <&bpmp TEGRA194_RESET_GPU>;
+		reset-names = "gpu";
+		dma-coherent;
+
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
+		iommus = <&smmu TEGRA194_SID_GPU>;
+	};
-- 
2.27.0
