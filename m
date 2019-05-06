From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: enable ACONNECT, ADMA and AGIC
Date: Mon, 6 May 2019 17:28:28 +0530
Message-ID: <1557143908-5850-2-git-send-email-spujar@nvidia.com>
References: <1557143908-5850-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557143908-5850-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Enable ACONNECT, ADMA and AGIC devices for following platforms
  * Jetson TX2
  * Jetson Xavier

Verified driver probe path and devices get registered fine.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 12 ++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 31457f3..21e73db 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -183,4 +183,16 @@
 			vin-supply = <&vdd_5v0_sys>;
 		};
 	};
+
+	aconnect@2a41000 {
+		status = "okay";
+
+		dma@2930000 {
+			status = "okay";
+		};
+
+		agic@2a41000 {
+			status = "okay";
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index b62e969..bca28fc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -169,4 +169,16 @@
 			};
 		};
 	};
+
+	aconnect@2a41000 {
+		status = "okay";
+
+		dma@2930000 {
+			status = "okay";
+		};
+
+		agic@2a41000 {
+			status = "okay";
+		};
+	};
 };
-- 
2.7.4
