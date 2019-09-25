From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] arm64: tegra: Fix 'active-low' warning for Jetson Xavier regulator
Date: Wed, 25 Sep 2019 15:12:28 +0100
Message-ID: <20190925141229.10992-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, vidyas@nvidia.com, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Commit 4fdbfd60a3a2 ("arm64: tegra: Add PCIe slot supply information
in p2972-0000 platform") added regulators for the PCIe slot on the
Jetson Xavier platform. One of these regulators has an active-low enable
and this commit incorrectly added an active-low specifier for the GPIO
which causes the following warning to occur on boot ...

 WARNING KERN regulator@3 GPIO handle specifies active low - ignored

The fixed-regulator binding does not use the active-low flag from the
gpio specifier and purely relies of the presence of the
'enable-active-high' property to determine if it is active high or low
(if this property is omitted). Fix this warning by setting the GPIO
to active-high in the GPIO specifier. Finally, remove the
'enable-active-low' as this is not a valid property.

Fixes: 4fdbfd60a3a2 ("arm64: tegra: Add PCIe slot supply information in p2972-0000 platform")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 4c38426a6969..02909a48dfcd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -309,9 +309,8 @@
 			regulator-name = "VDD_12V";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
-			gpio = <&gpio TEGRA194_MAIN_GPIO(A, 1) GPIO_ACTIVE_LOW>;
+			gpio = <&gpio TEGRA194_MAIN_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
 			regulator-boot-on;
-			enable-active-low;
 		};
 	};
 };
-- 
2.17.1
