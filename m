From: Wei Ni <wni@nvidia.com>
Subject: [PATCH 1/2] ARM: dt: t30 cardhu: add dt entry for lm90
Date: Thu, 4 Jul 2013 17:09:38 +0800
Message-ID: <1372928979-26938-2-git-send-email-wni@nvidia.com>
References: <1372928979-26938-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372928979-26938-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, acourbot@nvidia.com, linux@arm.linux.org.uk
Cc: MLongnecker@nvidia.com, linux-arm-kernel@lists.infradead.org, lm-sensors@lm-sensors.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Enable thermal sensor lm90 for t30 cardhu.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 arch/arm/boot/dts/tegra30-cardhu.dtsi |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index f65b53d..8778c94 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -286,6 +286,13 @@
 				};
 			};
 		};
+
+		nct1008: nct1008 {
+			compatible = "lm90,nct1008";
+			reg = <0x4c>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(CC, 2) IRQ_TYPE_LEVEL_LOW>;
+		};
 	};
 
 	spi@7000da00 {
-- 
1.7.9.5
