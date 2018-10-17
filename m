From: Krishna Reddy <vdumpa@nvidia.com>
Subject: [PATCH 2/2] arm64: dts: tegra186: Enable IOMMU for SDHCI
Date: Tue, 16 Oct 2018 19:06:48 -0700
Message-ID: <1539742008-16595-2-git-send-email-vdumpa@nvidia.com>
References: <1539742008-16595-1-git-send-email-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539742008-16595-1-git-send-email-vdumpa@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, avienamo@nvidia.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Krishna Reddy <vdumpa@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Enable IOMMU for all SDHCI controllers in Tegra186.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 230c0c8..996997e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -234,6 +234,7 @@
 		compatible = "nvidia,tegra186-sdhci";
 		reg = <0x0 0x03400000 0x0 0x10000>;
 		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+		iommus = <&smmu TEGRA186_SID_SDMMC1>;
 		clocks = <&bpmp TEGRA186_CLK_SDMMC1>;
 		clock-names = "sdhci";
 		resets = <&bpmp TEGRA186_RESET_SDMMC1>;
@@ -259,6 +260,7 @@
 		compatible = "nvidia,tegra186-sdhci";
 		reg = <0x0 0x03420000 0x0 0x10000>;
 		interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+		iommus = <&smmu TEGRA186_SID_SDMMC2>;
 		clocks = <&bpmp TEGRA186_CLK_SDMMC2>;
 		clock-names = "sdhci";
 		resets = <&bpmp TEGRA186_RESET_SDMMC2>;
@@ -279,6 +281,7 @@
 		compatible = "nvidia,tegra186-sdhci";
 		reg = <0x0 0x03440000 0x0 0x10000>;
 		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+		iommus = <&smmu TEGRA186_SID_SDMMC3>;
 		clocks = <&bpmp TEGRA186_CLK_SDMMC3>;
 		clock-names = "sdhci";
 		resets = <&bpmp TEGRA186_RESET_SDMMC3>;
@@ -301,6 +304,7 @@
 		compatible = "nvidia,tegra186-sdhci";
 		reg = <0x0 0x03460000 0x0 0x10000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+		iommus = <&smmu TEGRA186_SID_SDMMC4>;
 		clocks = <&bpmp TEGRA186_CLK_SDMMC4>;
 		clock-names = "sdhci";
 		assigned-clocks = <&bpmp TEGRA186_CLK_SDMMC4>,
-- 
2.1.4
