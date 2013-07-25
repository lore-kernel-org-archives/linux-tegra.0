From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v5 11/16] ARM: tegra: Enable PCIe controller on Cardhu
Date: Thu, 25 Jul 2013 10:53:25 -0700
Message-ID: <1374774810-18459-12-git-send-email-thierry.reding@gmail.com>
References: <1374774810-18459-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374774810-18459-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jay Agarwal <jagarwal@nvidia.com>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
1.8.1.5
