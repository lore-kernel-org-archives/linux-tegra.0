From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] ARM: tegra: Remove deprecated nvidia,hpd-gpio properties
Date: Thu, 17 Apr 2014 14:03:01 +0200
Message-ID: <1397736181-1593-4-git-send-email-thierry.reding@gmail.com>
References: <1397736181-1593-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397736181-1593-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This property has been replaced by one with a more standard name
(nvidia,hpd-gpios) and is now obsolete.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114-dalmore.dts     | 4 ----
 arch/arm/boot/dts/tegra20-colibri-512.dtsi | 4 ----
 arch/arm/boot/dts/tegra20-harmony.dts      | 4 ----
 arch/arm/boot/dts/tegra20-paz00.dts        | 4 ----
 arch/arm/boot/dts/tegra20-seaboard.dts     | 4 ----
 arch/arm/boot/dts/tegra20-tamonten.dtsi    | 4 ----
 arch/arm/boot/dts/tegra20-trimslice.dts    | 4 ----
 arch/arm/boot/dts/tegra20-ventana.dts      | 4 ----
 arch/arm/boot/dts/tegra20-whistler.dts     | 4 ----
 arch/arm/boot/dts/tegra30-beaver.dts       | 4 ----
 10 files changed, 40 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index c1e5eb33847a..df22dfad7db7 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -31,10 +31,6 @@
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpios =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-
-			/* deprecated */
-			nvidia,hpd-gpio =
-				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 		};
 
 		dsi@54300000 {
diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
index 57b9b0d08123..7ab61aef11e0 100644
--- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
@@ -21,10 +21,6 @@
 			nvidia,ddc-i2c-bus = <&i2c_ddc>;
 			nvidia,hpd-gpios =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-
-			/* deprecated */
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index f62fe7059bca..650daf16c37b 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -34,10 +34,6 @@
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpios =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-
-			/* deprecated */
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 196578fd007a..80f1827b219c 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -34,10 +34,6 @@
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpios =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-
-			/* deprecated */
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index 7a69d5f4f55d..aa97216a2683 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -34,10 +34,6 @@
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpios =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-
-			/* deprecated */
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index af582f8fd636..72f07a20aec3 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -21,10 +21,6 @@
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpios =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-
-			/* deprecated */
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 4ab1eea59efe..2affa75c0803 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -26,10 +26,6 @@
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpios =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-
-			/* deprecated */
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 663fbf4f8b63..b66045b53357 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -34,10 +34,6 @@
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpios =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-
-			/* deprecated */
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra20-whistler.dts b/arch/arm/boot/dts/tegra20-whistler.dts
index 9b5948f0cbc6..b0ecff2f71cc 100644
--- a/arch/arm/boot/dts/tegra20-whistler.dts
+++ b/arch/arm/boot/dts/tegra20-whistler.dts
@@ -26,10 +26,6 @@
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpios =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-
-			/* deprecated */
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index e99b9967b2ca..e7a9da968f3b 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -46,10 +46,6 @@
 			nvidia,hpd-gpios =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 			nvidia,ddc-i2c-bus = <&hdmiddc>;
-
-			/* deprecated */
-			nvidia,hpd-gpio =
-				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 		};
 	};
 
-- 
1.9.2
