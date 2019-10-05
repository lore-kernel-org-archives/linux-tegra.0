From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Assume no CLKREQ presence by default
Date: Sat, 5 Oct 2019 22:12:12 +0530
Message-ID: <20191005164212.3646-2-vidyas@nvidia.com>
References: <20191005164212.3646-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191005164212.3646-1-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, andrew.murray@arm.com
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

Although Tegra194 has support for CLKREQ sideband signal and P2972
has routing of the same till the slot, it is the case most of the time
that the connected device doesn't have CLKREQ support. Hence, it makes
sense to assume that there is no CLKREQ support by default and it can
be enabled on need basis when a card with CLKREQ support is connected.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index a312c051448b..11220d97adb8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1186,7 +1186,6 @@
 
 		nvidia,bpmp = <&bpmp 1>;
 
-		supports-clkreq;
 		nvidia,aspm-cmrt-us = <60>;
 		nvidia,aspm-pwr-on-t-us = <20>;
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
@@ -1232,7 +1231,6 @@
 
 		nvidia,bpmp = <&bpmp 2>;
 
-		supports-clkreq;
 		nvidia,aspm-cmrt-us = <60>;
 		nvidia,aspm-pwr-on-t-us = <20>;
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
@@ -1278,7 +1276,6 @@
 
 		nvidia,bpmp = <&bpmp 3>;
 
-		supports-clkreq;
 		nvidia,aspm-cmrt-us = <60>;
 		nvidia,aspm-pwr-on-t-us = <20>;
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
@@ -1324,7 +1321,6 @@
 
 		nvidia,bpmp = <&bpmp 4>;
 
-		supports-clkreq;
 		nvidia,aspm-cmrt-us = <60>;
 		nvidia,aspm-pwr-on-t-us = <20>;
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
@@ -1370,7 +1366,6 @@
 
 		nvidia,bpmp = <&bpmp 0>;
 
-		supports-clkreq;
 		nvidia,aspm-cmrt-us = <60>;
 		nvidia,aspm-pwr-on-t-us = <20>;
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
@@ -1420,7 +1415,6 @@
 		interrupt-map-mask = <0 0 0 0>;
 		interrupt-map = <0 0 0 0 &gic GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
 
-		supports-clkreq;
 		nvidia,aspm-cmrt-us = <60>;
 		nvidia,aspm-pwr-on-t-us = <20>;
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
-- 
2.17.1
