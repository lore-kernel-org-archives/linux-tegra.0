From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 4/4] ARM: tegra: roth: add display DT node
Date: Tue,  8 Jul 2014 21:32:14 +0900
Message-ID: <1404822734-8603-5-git-send-email-acourbot@nvidia.com>
References: <1404822734-8603-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1404822734-8603-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Terje Bergstrom <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

Tegra DSI support has been fixed to support continuous clock behavior that
the panel used on SHIELD requires, so finally add its device tree node
since it is functional.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 arch/arm/boot/dts/tegra114-roth.dts | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index d20898e..78df4ee 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -28,6 +28,22 @@
 		reg = <0x80000000 0x79600000>;
 	};
 
+	host1x@50000000 {
+		dsi@54300000 {
+			status = "okay";
+
+			vdd-supply = <&vdd_1v2_ap>;
+
+			panel@0 {
+				compatible = "lg,lh500wx1-sd03";
+				reg = <0>;
+
+				power-supply = <&vdd_lcd>;
+				backlight = <&backlight>;
+			};
+		};
+	};
+
 	pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -823,7 +839,6 @@
 						regulator-name = "vdd-1v8";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
-						regulator-always-on;
 						regulator-boot-on;
 					};
 
@@ -870,10 +885,11 @@
 						regulator-name = "vdd-2v8-display";
 						regulator-min-microvolt = <2800000>;
 						regulator-max-microvolt = <2800000>;
+						regulator-always-on;
 						regulator-boot-on;
 					};
 
-					ldo3 {
+					vdd_1v2_ap: ldo3 {
 						regulator-name = "avdd-1v2";
 						regulator-min-microvolt = <1200000>;
 						regulator-max-microvolt = <1200000>;
@@ -1069,7 +1085,7 @@
 			regulator-boot-on;
 		};
 
-		regulator@1 {
+		vdd_lcd: regulator@1 {
 			compatible = "regulator-fixed";
 			reg = <1>;
 			regulator-name = "vdd_lcd_1v8";
-- 
2.0.0
