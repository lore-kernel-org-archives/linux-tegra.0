From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 56/73] arm64: tegra: Do not mark host1x as simple bus
Date: Tue, 16 Jun 2020 15:52:21 +0200
Message-ID: <20200616135238.3001888-57-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The host1x is not a simple bus, so drop the corresponding compatible
string.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 3 +--
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index fa5ee55fd4a5..c4d3a88403eb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -81,8 +81,7 @@ pci@2,0 {
 
 	host1x@50000000 {
 		compatible = "nvidia,tegra132-host1x",
-			     "nvidia,tegra124-host1x",
-			     "simple-bus";
+			     "nvidia,tegra124-host1x";
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 184cc0365002..b4150d8cccf5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -934,7 +934,7 @@ smmu: iommu@12000000 {
 	};
 
 	host1x@13e00000 {
-		compatible = "nvidia,tegra186-host1x", "simple-bus";
+		compatible = "nvidia,tegra186-host1x";
 		reg = <0x0 0x13e00000 0x0 0x10000>,
 		      <0x0 0x13e10000 0x0 0x10000>;
 		reg-names = "hypervisor", "vm";
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 72ba5146b0a9..bf696ada856c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1036,7 +1036,7 @@ pmc: pmc@c360000 {
 		};
 
 		host1x@13e00000 {
-			compatible = "nvidia,tegra194-host1x", "simple-bus";
+			compatible = "nvidia,tegra194-host1x";
 			reg = <0x13e00000 0x10000>,
 			      <0x13e10000 0x10000>;
 			reg-names = "hypervisor", "vm";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 6a78056b94f4..02a02ed1b264 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -86,7 +86,7 @@ pci@2,0 {
 	};
 
 	host1x@50000000 {
-		compatible = "nvidia,tegra210-host1x", "simple-bus";
+		compatible = "nvidia,tegra210-host1x";
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
-- 
2.24.1
