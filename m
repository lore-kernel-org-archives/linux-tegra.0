From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 03/19] ARM: tegra: apalis-tk1: reorder padctl properties
Date: Sat,  1 Sep 2018 15:04:48 +0200
Message-ID: <20180901130504.14318-4-marcel@ziswiler.com>
References: <20180901130504.14318-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901130504.14318-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder padctl properties.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 22 +++++++++++-----------
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 22 +++++++++++-----------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 86768ba28d67..f6459588d845 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1815,18 +1815,18 @@
 
 				lanes {
 					usb2-0 {
-						nvidia,function = "xusb";
 						status = "okay";
+						nvidia,function = "xusb";
 					};
 
 					usb2-1 {
-						nvidia,function = "xusb";
 						status = "okay";
+						nvidia,function = "xusb";
 					};
 
 					usb2-2 {
-						nvidia,function = "xusb";
 						status = "okay";
+						nvidia,function = "xusb";
 					};
 				};
 			};
@@ -1836,28 +1836,28 @@
 
 				lanes {
 					pcie-0 {
-						nvidia,function = "usb3-ss";
 						status = "okay";
+						nvidia,function = "usb3-ss";
 					};
 
 					pcie-1 {
-						nvidia,function = "usb3-ss";
 						status = "okay";
+						nvidia,function = "usb3-ss";
 					};
 
 					pcie-2 {
-						nvidia,function = "pcie";
 						status = "okay";
+						nvidia,function = "pcie";
 					};
 
 					pcie-3 {
-						nvidia,function = "pcie";
 						status = "okay";
+						nvidia,function = "pcie";
 					};
 
 					pcie-4 {
-						nvidia,function = "pcie";
 						status = "okay";
+						nvidia,function = "pcie";
 					};
 				};
 			};
@@ -1867,8 +1867,8 @@
 
 				lanes {
 					sata-0 {
-						nvidia,function = "sata";
 						status = "okay";
+						nvidia,function = "sata";
 					};
 				};
 			};
@@ -1900,13 +1900,13 @@
 			};
 
 			usb3-0 {
-				nvidia,usb2-companion = <2>;
 				status = "okay";
+				nvidia,usb2-companion = <2>;
 			};
 
 			usb3-1 {
-				nvidia,usb2-companion = <0>;
 				status = "okay";
+				nvidia,usb2-companion = <0>;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 2c291d210677..8919213d8312 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1844,18 +1844,18 @@
 
 				lanes {
 					usb2-0 {
-						nvidia,function = "xusb";
 						status = "okay";
+						nvidia,function = "xusb";
 					};
 
 					usb2-1 {
-						nvidia,function = "xusb";
 						status = "okay";
+						nvidia,function = "xusb";
 					};
 
 					usb2-2 {
-						nvidia,function = "xusb";
 						status = "okay";
+						nvidia,function = "xusb";
 					};
 				};
 			};
@@ -1865,28 +1865,28 @@
 
 				lanes {
 					pcie-0 {
-						nvidia,function = "usb3-ss";
 						status = "okay";
+						nvidia,function = "usb3-ss";
 					};
 
 					pcie-1 {
-						nvidia,function = "usb3-ss";
 						status = "okay";
+						nvidia,function = "usb3-ss";
 					};
 
 					pcie-2 {
-						nvidia,function = "pcie";
 						status = "okay";
+						nvidia,function = "pcie";
 					};
 
 					pcie-3 {
-						nvidia,function = "pcie";
 						status = "okay";
+						nvidia,function = "pcie";
 					};
 
 					pcie-4 {
-						nvidia,function = "pcie";
 						status = "okay";
+						nvidia,function = "pcie";
 					};
 				};
 			};
@@ -1896,8 +1896,8 @@
 
 				lanes {
 					sata-0 {
-						nvidia,function = "sata";
 						status = "okay";
+						nvidia,function = "sata";
 					};
 				};
 			};
@@ -1929,13 +1929,13 @@
 			};
 
 			usb3-0 {
-				nvidia,usb2-companion = <2>;
 				status = "okay";
+				nvidia,usb2-companion = <2>;
 			};
 
 			usb3-1 {
-				nvidia,usb2-companion = <0>;
 				status = "okay";
+				nvidia,usb2-companion = <0>;
 			};
 		};
 	};
-- 
2.14.4
