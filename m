From: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 4/4] arm64: tegra: Enable PCIe on Jetson TX2
Date: Wed, 27 Sep 2017 17:28:37 +0530
Message-ID: <1506513517-25870-5-git-send-email-mmaddireddy@nvidia.com>
References: <1506513517-25870-1-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506513517-25870-1-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable x4 PCIe slot on Jetson TX2.

Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2: No change in this patch
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index cf84d7046ad5..a4d96b2a23b4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -378,4 +378,28 @@
 			vin-supply = <&vdd_1v8>;
 		};
 	};
+
+	pcie@10003000 {
+		status = "okay";
+
+		dvdd-pex-supply = <&vdd_pex>;
+		hvdd-pex-pll-supply = <&vdd_1v8>;
+		hvdd-pex-supply = <&vdd_1v8>;
+		vddio-pexctl-aud-supply = <&vdd_1v8>;
+
+		pci@1,0 {
+			nvidia,num-lanes = <4>;
+			status = "okay";
+		};
+
+		pci@2,0 {
+			nvidia,num-lanes = <0>;
+			status = "disabled";
+		};
+
+		pci@3,0 {
+			nvidia,num-lanes = <1>;
+			status = "disabled";
+		};
+	};
 };
-- 
2.1.4
