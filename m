From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 6/8] ARM: tegra: Add EMC to Tegra124 device tree
Date: Fri, 11 Jul 2014 17:18:31 +0300
Message-ID: <1405088313-20048-7-git-send-email-mperttunen@nvidia.com>
References: <1405088313-20048-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405088313-20048-1-git-send-email-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@linaro.org, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This adds a node for the EMC memory controller. It is always enabled,
but only provides read-only functionality without board-specific
timing tables.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 7cc535b..78d629a6 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -136,6 +136,12 @@
 		#reset-cells = <1>;
 	};
 
+	emc@0,7001b000 {
+		compatible = "nvidia,tegra124-emc";
+		reg = <0x0 0x7001b000 0x0 0x1000>,
+		      <0x0 0x70019000 0x0 0x1000>;
+	};
+
 	gpio: gpio@0,6000d000 {
 		compatible = "nvidia,tegra124-gpio", "nvidia,tegra30-gpio";
 		reg = <0x0 0x6000d000 0x0 0x1000>;
-- 
1.8.1.5
