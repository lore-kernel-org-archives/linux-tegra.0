From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 10/10] arm64: tegra: Enable PCIe on Jetson TX1
Date: Fri, 25 Nov 2016 11:57:18 +0100
Message-ID: <20161125105718.3866-10-thierry.reding@gmail.com>
References: <20161125105718.3866-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125105718.3866-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Enable the x4 PCIe and M.2 Key E slots on Jetson TX1. The Key E slot is
currently untested due to lack of hardware.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 983775e637a4..4c1ea7a08d43 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -7,6 +7,32 @@
 	model = "NVIDIA Jetson TX1 Developer Kit";
 	compatible = "nvidia,p2371-2180", "nvidia,tegra210";
 
+	pcie-controller@01003000 {
+		status = "okay";
+
+		avdd-pll-uerefe-supply = <&avdd_1v05_pll>;
+		hvddio-pex-supply = <&vdd_1v8>;
+		dvddio-pex-supply = <&vdd_pex_1v05>;
+		dvdd-pex-pll-supply = <&vdd_pex_1v05>;
+		hvdd-pex-pll-e-supply = <&vdd_1v8>;
+		vddio-pex-ctl-supply = <&vdd_1v8>;
+
+		pci@1,0 {
+			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-0}>,
+			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-1}>,
+			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-2}>,
+			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-3}>;
+			phy-names = "pcie-0", "pcie-1", "pcie-2", "pcie-3";
+			status = "okay";
+		};
+
+		pci@2,0 {
+			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-4}>;
+			phy-names = "pcie-0";
+			status = "okay";
+		};
+	};
+
 	host1x@50000000 {
 		dsi@54300000 {
 			status = "okay";
-- 
2.10.2
