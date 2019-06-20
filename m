From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/3] arm64: tegra: Update Jetson TX1 GPU regulator timings
Date: Thu, 20 Jun 2019 09:17:01 +0100
Message-ID: <20190620081702.17209-3-jonathanh@nvidia.com>
References: <20190620081702.17209-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190620081702.17209-1-jonathanh@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The GPU regulator enable ramp delay for Jetson TX1 is set to 1ms which
not sufficient because the enable ramp delay has been measured to be
greater than 1ms. Furthermore, the downstream kernels released by NVIDIA
for Jetson TX1 are using a enable ramp delay 2ms and a settling delay of
160us. Update the GPU regulator enable ramp delay for Jetson TX1 to be
2ms and add a settling delay of 160us.

Cc: stable@vger.kernel.org
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index e8654061ce03..27723829d033 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -341,7 +341,8 @@
 			regulator-max-microvolt = <1320000>;
 			enable-gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 			regulator-ramp-delay = <80>;
-			regulator-enable-ramp-delay = <1000>;
+			regulator-enable-ramp-delay = <2000>;
+			regulator-settling-time-us = <160>;
 		};
 	};
 };
-- 
2.17.1
