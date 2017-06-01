From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 2/2] arm64: tegra: Add CCPLEX_CLUSTER area in Tegra186
Date: Thu, 1 Jun 2017 11:04:05 +0300
Message-ID: <1496304245-24024-3-git-send-email-mperttunen@nvidia.com>
References: <1496304245-24024-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496304245-24024-1-git-send-email-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra186 CCPLEX_CLUSTER area contains memory-mapped
registers that initiate CPU frequency/voltage transitions.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 3ea5e6369bc3..c023af0be43d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -347,6 +347,13 @@
 		reg-names = "pmc", "wake", "aotag", "scratch";
 	};
 
+	ccplex@e000000 {
+		compatible = "nvidia,tegra186-ccplex-cluster";
+		reg = <0x0 0x0e000000 0x0 0x3fffff>;
+
+		nvidia,bpmp = <&bpmp>;
+	};
+
 	sysram@30000000 {
 		compatible = "nvidia,tegra186-sysram", "mmio-sram";
 		reg = <0x0 0x30000000 0x0 0x50000>;
-- 
2.1.4
