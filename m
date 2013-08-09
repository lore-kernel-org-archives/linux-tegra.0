From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v6 09/14] ARM: tegra: Enable PCIe controller on Cardhu
Date: Fri,  9 Aug 2013 16:49:27 +0200
Message-ID: <1376059772-16669-10-git-send-email-treding@nvidia.com>
References: <1376059772-16669-1-git-send-email-treding@nvidia.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1376059772-16669-1-git-send-email-treding@nvidia.com>
Sender: linux-pci-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Jay Agarwal <jagarwal@nvidia.com>

Root port 2 is routed to the bottom connector on Cardhu and is used by
the development dock to provide gigabit ethernet and USB functionality.

Signed-off-by: Jay Agarwal <jagarwal@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra30-cardhu.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index c011b67..ee8fff8 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -31,6 +31,26 @@
 		reg = <0x80000000 0x40000000>;
 	};
 
+	pcie-controller {
+		status = "okay";
+		pex-clk-supply = <&pex_hvdd_3v3_reg>;
+		vdd-supply = <&ldo1_reg>;
+		avdd-supply = <&ldo2_reg>;
+
+		pci@1,0 {
+			nvidia,num-lanes = <4>;
+		};
+
+		pci@2,0 {
+			nvidia,num-lanes = <1>;
+		};
+
+		pci@3,0 {
+			status = "okay";
+			nvidia,num-lanes = <1>;
+		};
+	};
+
 	pinmux {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
-- 
1.8.3.4
