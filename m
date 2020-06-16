From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 61/73] arm64: tegra: Update USB connector nodes
Date: Tue, 16 Jun 2020 15:52:26 +0200
Message-ID: <20200616135238.3001888-62-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Use the preferred {id,vbus}-gpios over the {id,vbus}-gpio properties and
fix the ordering of compatible strings (most-specific ones should come
first).

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 15 +++++++--------
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi    | 12 ++++++------
 .../arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 10 +++++-----
 3 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 482ed7b0fcff..4a7a022acabb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -171,19 +171,18 @@ usb2-0 {
 				status = "okay";
 				mode = "otg";
 				vbus-supply = <&vdd_usb0>;
-
 				usb-role-switch;
+
 				connector {
-					compatible = "usb-b-connector",
-						     "gpio-usb-b-connector";
+					compatible = "gpio-usb-b-connector",
+						     "usb-b-connector";
 					label = "micro-USB";
 					type = "micro";
-					vbus-gpio = <&gpio
-						     TEGRA186_MAIN_GPIO(X, 7)
-						     GPIO_ACTIVE_LOW>;
-					id-gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+					vbus-gpios = <&gpio
+						      TEGRA186_MAIN_GPIO(X, 7)
+						      GPIO_ACTIVE_LOW>;
+					id-gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
 				};
-
 			};
 
 			usb2-1 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 4771c1668825..3ba36a52dc89 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1456,17 +1456,17 @@ ports {
 			usb2-0 {
 				status = "okay";
 				vbus-supply = <&vdd_usb_vbus_otg>;
+				usb-role-switch;
 				mode = "otg";
 
-				usb-role-switch;
 				connector {
-					compatible = "usb-b-connector",
-						     "gpio-usb-b-connector";
+					compatible = "gpio-usb-b-connector",
+						     "usb-b-connector";
 					label = "micro-USB";
 					type = "micro";
-					vbus-gpio = <&gpio TEGRA_GPIO(Z, 0)
-						     GPIO_ACTIVE_LOW>;
-					id-gpio = <&pmic 0 0>;
+					vbus-gpios = <&gpio TEGRA_GPIO(Z, 0)
+						      GPIO_ACTIVE_LOW>;
+					id-gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index d7a4eced0149..ac17f5485bf8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -505,15 +505,15 @@ ports {
 			usb2-0 {
 				status = "okay";
 				mode = "peripheral";
-
 				usb-role-switch;
+
 				connector {
-					compatible = "usb-b-connector",
-						     "gpio-usb-b-connector";
+					compatible = "gpio-usb-b-connector",
+						     "usb-b-connector";
 					label = "micro-USB";
 					type = "micro";
-					vbus-gpio = <&gpio TEGRA_GPIO(CC, 4)
-						     GPIO_ACTIVE_LOW>;
+					vbus-gpios = <&gpio TEGRA_GPIO(CC, 4)
+						      GPIO_ACTIVE_LOW>;
 				};
 			};
 
-- 
2.24.1
