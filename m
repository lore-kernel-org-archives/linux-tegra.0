From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 4/4] arm64: tegra: Add ACONNECT bus node for Tegra210
Date: Fri, 17 Jun 2016 13:40:34 +0100
Message-ID: <1466167234-8288-5-git-send-email-jonathanh@nvidia.com>
References: <1466167234-8288-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466167234-8288-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add the ACONNECT bus node for Tegra210 which is used to interface to
the various devices in the Audio Processing Engine (APE).

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 5a36c059f878..ebf44f4059f8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -872,6 +872,18 @@
 		#nvidia,mipi-calibrate-cells = <1>;
 	};
 
+	aconnect@702c0000 {
+		compatible = "nvidia,tegra210-aconnect";
+		clocks = <&tegra_car TEGRA210_CLK_APE>,
+			 <&tegra_car TEGRA210_CLK_APB2APE>;
+		clock-names = "ape", "apb2ape";
+		power-domains = <&pd_audio>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x702c0000 0x0 0x702c0000 0x00040000>;
+		status = "disabled";
+	};
+
 	spi@70410000 {
 		compatible = "nvidia,tegra210-qspi";
 		reg = <0x0 0x70410000 0x0 0x1000>;
-- 
2.1.4
