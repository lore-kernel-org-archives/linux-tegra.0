From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 2/2] ARM: dts: tegra20/tegra30: add pmu interrupt-affinity
Date: Fri, 20 Jul 2018 18:34:26 +0200
Message-ID: <20180720163426.4410-2-marcel@ziswiler.com>
References: <20180720163426.4410-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720163426.4410-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

This is similar to tegra124 and avoids the following being reported
upon boot:

hw perfevents: no interrupt-affinity property for /pmu, guessing.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra20.dtsi | 2 ++
 arch/arm/boot/dts/tegra30.dtsi | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index a22c6a8f8f83..dcad6d6128cf 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -867,5 +867,7 @@
 		compatible = "arm,cortex-a9-pmu";
 		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&{/cpus/cpu@0}>,
+				     <&{/cpus/cpu@1}>;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index a6781f653310..1de10f0d1da7 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -1013,5 +1013,9 @@
 			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&{/cpus/cpu@0}>,
+				     <&{/cpus/cpu@1}>,
+				     <&{/cpus/cpu@2}>,
+				     <&{/cpus/cpu@3}>;
 	};
 };
-- 
2.14.4
