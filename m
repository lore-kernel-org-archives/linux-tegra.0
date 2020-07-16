From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/2] dt-bindings: Add documentation for GV11B GPU
Date: Thu, 16 Jul 2020 16:33:40 +0200
Message-ID: <20200716143341.545804-1-thierry.reding@gmail.com>
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
 .../devicetree/bindings/gpu/nvidia,gk20a.txt  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
index f32bbba4d3bc..533edb4c3eec 100644
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
@@ -88,3 +89,21 @@ Example for GP10B:
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
+			 <&bpmp TEGRA194_CLK_GPU_PWR>;
+		clock-names = "gpu", "pwr";
+		resets = <&bpmp TEGRA194_RESET_GPU>;
+		reset-names = "gpu";
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
+		iommus = <&smmu TEGRA194_SID_GPU>;
+	};
-- 
2.27.0
