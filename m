From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 47/73] arm64: tegra: Fixup I/O and PLL supply names for HDMI/DP
Date: Tue, 16 Jun 2020 15:52:12 +0200
Message-ID: <20200616135238.3001888-48-thierry.reding@gmail.com>
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

The I/O and PLL supplies used for HDMI/DP have alternative names. Use
the names that are given in the hardware documentation for consistency.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 1af7f9ffb7b6..f35b0ba29cb5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -286,8 +286,8 @@ sor@15540000 {
 		sor@15580000 {
 			status = "okay";
 
-			avdd-io-supply = <&vdd_hdmi_1v05>;
-			vdd-pll-supply = <&vdd_1v8_ap>;
+			avdd-io-hdmi-dp-supply = <&vdd_hdmi_1v05>;
+			vdd-hdmi-dp-pll-supply = <&vdd_1v8_ap>;
 			hdmi-supply = <&vdd_hdmi>;
 
 			nvidia,ddc-i2c-bus = <&ddc>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index e15d1eac05f5..9a7d136b467f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -145,8 +145,8 @@ sor@15b40000 {
 			sor@15b80000 {
 				status = "okay";
 
-				avdd-io-supply = <&vdd_1v0>;
-				vdd-pll-supply = <&vdd_1v8hs>;
+				avdd-io-hdmi-dp-supply = <&vdd_1v0>;
+				vdd-hdmi-dp-pll-supply = <&vdd_1v8hs>;
 				hdmi-supply = <&vdd_hdmi>;
 
 				nvidia,ddc-i2c-bus = <&ddc>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 5c3771e8d683..f72afdf547ee 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -27,8 +27,8 @@ csi@838 {
 		sor@54580000 {
 			status = "okay";
 
-			avdd-io-supply = <&avdd_1v05>;
-			vdd-pll-supply = <&vdd_1v8>;
+			avdd-io-hdmi-dp-supply = <&avdd_1v05>;
+			vdd-hdmi-dp-pll-supply = <&vdd_1v8>;
 			hdmi-supply = <&vdd_hdmi>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index ced01d15e457..e7ebf1afeb7a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -74,8 +74,8 @@ sor@54540000 {
 		sor@54580000 {
 			status = "okay";
 
-			avdd-io-supply = <&avdd_1v05>;
-			vdd-pll-supply = <&vdd_1v8>;
+			avdd-io-hdmi-dp-supply = <&avdd_1v05>;
+			vdd-hdmi-dp-pll-supply = <&vdd_1v8>;
 			hdmi-supply = <&vdd_hdmi>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
-- 
2.24.1
