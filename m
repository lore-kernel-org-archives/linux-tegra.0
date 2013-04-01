From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V6 8/9] ARM: tegra: Provide regulator to pwm-backlight
Date: Mon, 1 Apr 2013 14:53:27 -0700
Message-ID: <1364853208-32503-9-git-send-email-achew@nvidia.com>
References: <1364853208-32503-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364853208-32503-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: romain.naour-oid7hba3+9NWj0EZb7rXcA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drwyrm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, laforge-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lost.distance-/E1597aS9LQAvxtiuMwx3w@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gxt-TG0Ac1+ktVePQbnJrJN+5g@public.gmane.org
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openezx-devel-ZwoEplunGu3n3BO9LpVK+9i2O/JbrIOy@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The pwm-backlight driver now takes a mandatory regulator that is gotten
during driver probe.  Initialize a dummy regulator to satisfy this
requirement.

Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-medcom-wide.dts |  1 +
 arch/arm/boot/dts/tegra20-tamonten.dtsi   | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
index a2d6d65..90d665e 100644
--- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
+++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
@@ -32,6 +32,7 @@
 
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
+		power-supply = <&backlight_power_reg>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index 6e9d91f..1ea3e42 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -485,5 +485,15 @@
 			regulator-max-microvolt = <5000000>;
 			regulator-always-on;
 		};
+
+		backlight_power_reg: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+			regulator-name = "lcd_bl_en";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpio 13 0>; /* gpio PB5 */
+			enable-active-high;
+		};
 	};
 };
-- 
1.8.1.5
