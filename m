From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: Add documentation for GP10B GPU
Date: Thu, 30 Mar 2017 18:18:30 +0900
Message-ID: <20170330091831.18322-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

GP10B's definition is mostly similar to GK20A's and GM20B's. The only
noticeable difference is the use of power domains instead of a regulator
for power supply.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/gpu/nvidia,gk20a.txt       | 25 +++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
index ff3db65e50de..b7e4c7444510 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
@@ -5,6 +5,7 @@ Required properties:
   Currently recognized values:
   - nvidia,gk20a
   - nvidia,gm20b
+  - nvidia,gp10b
 - reg: Physical base address and length of the controller's registers.
   Must contain two entries:
   - first entry for bar0
@@ -14,7 +15,8 @@ Required properties:
 - interrupt-names: Must include the following entries:
   - stall
   - nonstall
-- vdd-supply: regulator for supply voltage.
+- vdd-supply: regulator for supply voltage. Only required for GPUs not using
+  power domains.
 - clocks: Must contain an entry for each entry in clock-names.
   See ../clocks/clock-bindings.txt for details.
 - clock-names: Must include the following entries:
@@ -27,6 +29,8 @@ is also required:
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
   - gpu
+- power-domains: GPUs that make use of power domains can define this property
+  instead of vdd-supply. Currently "nvidia,gp10b" makes use of this.
 
 Optional properties:
 - iommus: A reference to the IOMMU. See ../iommu/iommu.txt for details.
@@ -68,3 +72,22 @@ Example for GM20B:
 		iommus = <&mc TEGRA_SWGROUP_GPU>;
 		status = "disabled";
 	};
+
+Example for GP10B:
+
+	gpu@17000000 {
+		compatible = "nvidia,gp10b";
+		reg = <0x0 0x17000000 0x0 0x1000000>,
+		      <0x0 0x18000000 0x0 0x1000000>;
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "stall", "nonstall";
+		clocks = <&bpmp TEGRA186_CLK_GPCCLK>,
+			 <&bpmp TEGRA186_CLK_GPU>;
+		clock-names = "gpu", "pwr";
+		resets = <&bpmp TEGRA186_RESET_GPU>;
+		reset-names = "gpu";
+		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_GPU>;
+		iommus = <&smmu TEGRA186_SID_GPU>;
+		status = "disabled";
+	};
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
