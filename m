From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH] arm64: tegra: dts: enable aconnect, adma and agic
Date: Tue, 12 Mar 2019 19:55:04 +0530
Message-ID: <1552400705-1179-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, treding@nvidia.com
Cc: jonathanh@nvidia.com, josephl@nvidia.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Enable aconnect, adma and agic for Tegra Jetson TX1.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 9fad0d2..5a57396 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -99,4 +99,16 @@
 		pinctrl-0 = <&dvfs_pwm_active_state>;
 		pinctrl-1 = <&dvfs_pwm_inactive_state>;
 	};
+
+	aconnect@702c0000 {
+		status = "okay";
+
+		dma@702e2000 {
+			status = "okay";
+		};
+
+		agic@702f9000 {
+			status = "okay";
+		};
+	};
 };
-- 
2.7.4
