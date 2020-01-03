From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v1 2/2] arm64: tegra: Add fuse/apbmisc node on Tegra194
Date: Fri, 3 Jan 2020 16:30:18 +0800
Message-ID: <20200103083018.10575-3-jckuo@nvidia.com>
References: <20200103083018.10575-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200103083018.10575-1-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, robh@kernel.org, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, JC Kuo <jckuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This commit adds Tegra194 fuse and apbmisc device nodes.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 495f692e6a0b..f336bc3e195a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -21,6 +21,12 @@
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		misc@100000 {
+			compatible = "nvidia,tegra194-misc";
+			reg = <0x00100000 0xf000>,
+			      <0x0010f000 0x1000>;
+		};
+
 		gpio: gpio@2200000 {
 			compatible = "nvidia,tegra194-gpio";
 			reg-names = "security", "gpio";
@@ -627,6 +633,13 @@
 			status = "disabled";
 		};
 
+		fuse@3820000 {
+			compatible = "nvidia,tegra194-efuse";
+			reg = <0x03820000 0x10000>;
+			clocks = <&bpmp TEGRA194_CLK_FUSE>;
+			clock-names = "fuse";
+		};
+
 		gic: interrupt-controller@3881000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.17.1
