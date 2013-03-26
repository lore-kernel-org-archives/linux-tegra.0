From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V5 6/9] ARM: mxs: Provide regulator to pwm-backlight
Date: Mon, 25 Mar 2013 18:21:50 -0700
Message-ID: <1364260913-25490-7-git-send-email-achew@nvidia.com>
References: <1364260913-25490-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364260913-25490-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: romain.naour-oid7hba3+9NWj0EZb7rXcA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drwyrm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, laforge-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lost.distance-/E1597aS9LQAvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gxt-TG0Ac1+ktVePQbnJrJN+5g@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openezx-devel-ZwoEplunGu3n3BO9LpVK+9i2O/JbrIOy@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The pwm-backlight driver now takes a mandatory regulator that is gotten
during driver probe.  Initialize a dummy regulator to satisfy this
requirement.

Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Moved backlight power regulator into top-level regulators node.

 arch/arm/boot/dts/imx23-evk.dts      |  6 ++++++
 arch/arm/boot/dts/imx28-apf28dev.dts |  6 ++++++
 arch/arm/boot/dts/imx28-cfa10049.dts |  6 ++++++
 arch/arm/boot/dts/imx28-evk.dts      |  6 ++++++
 arch/arm/boot/dts/imx28-tx28.dts     | 11 +++++++++++
 5 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/imx23-evk.dts b/arch/arm/boot/dts/imx23-evk.dts
index 035c13f..ce5048e 100644
--- a/arch/arm/boot/dts/imx23-evk.dts
+++ b/arch/arm/boot/dts/imx23-evk.dts
@@ -95,6 +95,11 @@
 			regulator-max-microvolt = <3300000>;
 			gpio = <&gpio1 29 0>;
 		};
+
+		reg_backlight_power: fixed-regulator {
+			compatible = "regulator-fixed";
+			regulator-name = "backlight-power";
+	        };
 	};
 
 	backlight {
@@ -102,5 +107,6 @@
 		pwms = <&pwm 2 5000000>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
+		power-supply = <&reg_backlight_power>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx28-apf28dev.dts b/arch/arm/boot/dts/imx28-apf28dev.dts
index 6d8865b..e354dc5 100644
--- a/arch/arm/boot/dts/imx28-apf28dev.dts
+++ b/arch/arm/boot/dts/imx28-apf28dev.dts
@@ -132,6 +132,11 @@
 			regulator-max-microvolt = <5000000>;
 			gpio = <&gpio1 23 1>;
 		};
+
+		reg_backlight_power: fixed-regulator {
+			compatible = "regulator-fixed";
+			regulator-name = "backlight-power";
+		};
 	};
 
 	leds {
@@ -150,5 +155,6 @@
 		pwms = <&pwm 3 191000>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
+		power-supply = <&reg_backlight_power>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx28-cfa10049.dts b/arch/arm/boot/dts/imx28-cfa10049.dts
index a0d3e9f..a6eddd6 100644
--- a/arch/arm/boot/dts/imx28-cfa10049.dts
+++ b/arch/arm/boot/dts/imx28-cfa10049.dts
@@ -205,6 +205,11 @@
 			regulator-max-microvolt = <5000000>;
 			gpio = <&gpio0 7 1>;
 		};
+
+		reg_backlight_power: fixed-regulator {
+			compatible = "regulator-fixed";
+			regulator-name = "backlight-power";
+		};
 	};
 
 	ahb@80080000 {
@@ -304,5 +309,6 @@
 		pwms = <&pwm 3 5000000>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
+		power-supply = <&reg_backlight_power>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx28-evk.dts b/arch/arm/boot/dts/imx28-evk.dts
index 2da316e..7ba7216 100644
--- a/arch/arm/boot/dts/imx28-evk.dts
+++ b/arch/arm/boot/dts/imx28-evk.dts
@@ -285,6 +285,11 @@
 			gpio = <&gpio3 8 0>;
 			enable-active-high;
 		};
+
+		reg_backlight_power: fixed-regulator {
+			compatible = "regulator-fixed";
+			regulator-name = "backlight-power";
+		};
 	};
 
 	sound {
@@ -312,5 +317,6 @@
 		pwms = <&pwm 2 5000000>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
+		power-supply = <&reg_backlight_power>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/imx28-tx28.dts
index 37be532..7fa5a44 100644
--- a/arch/arm/boot/dts/imx28-tx28.dts
+++ b/arch/arm/boot/dts/imx28-tx28.dts
@@ -97,6 +97,16 @@
 		};
 	};
 
+	regulators {
+		compatible = "simple-bus";
+
+		reg_backlight_power: fixed-regulator {
+			compatible = "regulator-fixed";
+			regulator-name = "backlight-power";
+		};
+	};
+
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -112,5 +122,6 @@
 		pwms = <&pwm 0 5000000>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
+		power-supply = <&reg_backlight_power>;
 	};
 };
-- 
1.8.1.5
