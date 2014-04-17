From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/3] ARM: tegra: Deprecate nvidia,hpd-gpio property
Date: Thu, 17 Apr 2014 14:02:59 +0200
Message-ID: <1397736181-1593-2-git-send-email-thierry.reding@gmail.com>
References: <1397736181-1593-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1397736181-1593-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Properties referencing GPIOs should use the plural suffix -gpios. This
convention is encoded in the device tree backend of gpiod_get(), which
we'll eventually want to migrate to.

Rename the property to nvidia,hpd-gpios but keep (and deprecate) the
old name to preserve bisectability.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts     | 4 ++++
 arch/arm/boot/dts/tegra20-colibri-512.dtsi | 4 ++++
 arch/arm/boot/dts/tegra20-harmony.dts      | 4 ++++
 arch/arm/boot/dts/tegra20-paz00.dts        | 4 ++++
 arch/arm/boot/dts/tegra20-seaboard.dts     | 4 ++++
 arch/arm/boot/dts/tegra20-tamonten.dtsi    | 4 ++++
 arch/arm/boot/dts/tegra20-trimslice.dts    | 4 ++++
 arch/arm/boot/dts/tegra20-ventana.dts      | 4 ++++
 arch/arm/boot/dts/tegra20-whistler.dts     | 4 ++++
 arch/arm/boot/dts/tegra30-beaver.dts       | 6 +++++-
 10 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index a288a12823ed..c1e5eb33847a 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -29,6 +29,10 @@
 			pll-supply = <&palmas_smps3_reg>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpios =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+
+			/* deprecated */
 			nvidia,hpd-gpio =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
index 8e0066ad9628..57b9b0d08123 100644
--- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
@@ -19,6 +19,10 @@
 			pll-supply = <&hdmi_pll_reg>;
 
 			nvidia,ddc-i2c-bus = <&i2c_ddc>;
+			nvidia,hpd-gpios =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+
+			/* deprecated */
 			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
 				GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index 3fb1f50f6d46..f62fe7059bca 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -32,6 +32,10 @@
 			pll-supply = <&hdmi_pll_reg>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpios =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+
+			/* deprecated */
 			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
 				GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 9a39a8001f78..196578fd007a 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -32,6 +32,10 @@
 			pll-supply = <&hdmi_pll_reg>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpios =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+
+			/* deprecated */
 			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
 				GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index a1d4bf9895d7..7a69d5f4f55d 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -32,6 +32,10 @@
 			pll-supply = <&hdmi_pll_reg>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpios =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+
+			/* deprecated */
 			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
 				GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index a1b0d965757f..af582f8fd636 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -19,6 +19,10 @@
 			pll-supply = <&hdmi_pll_reg>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpios =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+
+			/* deprecated */
 			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
 				GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 216fa6d50c65..4ab1eea59efe 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -24,6 +24,10 @@
 			pll-supply = <&hdmi_pll_reg>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpios =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+
+			/* deprecated */
 			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
 				GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index ca8484cccddc..663fbf4f8b63 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -32,6 +32,10 @@
 			pll-supply = <&hdmi_pll_reg>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpios =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+
+			/* deprecated */
 			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
 				GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/tegra20-whistler.dts b/arch/arm/boot/dts/tegra20-whistler.dts
index 1843725785c9..9b5948f0cbc6 100644
--- a/arch/arm/boot/dts/tegra20-whistler.dts
+++ b/arch/arm/boot/dts/tegra20-whistler.dts
@@ -24,6 +24,10 @@
 			pll-supply = <&hdmi_pll_reg>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			nvidia,hpd-gpios =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+
+			/* deprecated */
 			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
 				GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index e93fe45b7803..e99b9967b2ca 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -43,9 +43,13 @@
 			vdd-supply = <&sys_3v3_reg>;
 			pll-supply = <&vio_reg>;
 
-			nvidia,hpd-gpio =
+			nvidia,hpd-gpios =
 				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 			nvidia,ddc-i2c-bus = <&hdmiddc>;
+
+			/* deprecated */
+			nvidia,hpd-gpio =
+				<&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 		};
 	};
 
-- 
1.9.2
