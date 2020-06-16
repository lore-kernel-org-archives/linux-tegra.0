From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 17/73] ARM: tegra: Name GPIO hog nodes consistently
Date: Tue, 16 Jun 2020 15:51:42 +0200
Message-ID: <20200616135238.3001888-18-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Philippe Schenker <philippe.schenker-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Use the common gpios- prefix for GPIO hog node names to make it clear
that they are all hogs. This helps with json-schema based validation.

Cc: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: Philippe Schenker <philippe.schenker-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-apalis-eval.dts      | 2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts | 2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     | 4 ++--
 arch/arm/boot/dts/tegra124-apalis.dtsi          | 4 ++--
 arch/arm/boot/dts/tegra20-colibri.dtsi          | 6 +++---
 arch/arm/boot/dts/tegra30-apalis-eval.dts       | 2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts  | 2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi          | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index 28c29b6813a7..89fafa39aa2a 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -246,7 +246,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	gpios-pex-perst-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(DD, 1) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
index f3afde410615..441a244ef6c1 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
@@ -248,7 +248,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	gpios-pex-perst-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(DD, 1) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 0d6890af457e..eb5f4ad0fe71 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -2048,7 +2048,7 @@ gpu-shutdown-trip {
 
 &gpio {
 	/* I210 Gigabit Ethernet Controller Reset */
-	lan-reset-n {
+	gpios-lan-reset-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -2056,7 +2056,7 @@ lan-reset-n {
 	};
 
 	/* Control MXM3 pin 26 Reset Module Output Carrier Input */
-	reset-moci-ctrl {
+	gpios-reset-moci-ctrl {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(U, 4) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 8857a11332c2..64a18b525378 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -2040,7 +2040,7 @@ gpu-shutdown-trip {
 
 &gpio {
 	/* I210 Gigabit Ethernet Controller Reset */
-	lan-reset-n {
+	gpios-lan-reset-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -2048,7 +2048,7 @@ lan-reset-n {
 	};
 
 	/* Control MXM3 pin 26 Reset Module Output Carrier Input */
-	reset-moci-ctrl {
+	gpios-reset-moci-ctrl {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(U, 4) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 6162d193e12c..90f317117298 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -743,7 +743,7 @@ sound {
 };
 
 &gpio {
-	lan-reset-n {
+	gpios-lan-reset-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(V, 4) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -751,7 +751,7 @@ lan-reset-n {
 	};
 
 	/* Tri-stating GMI_WR_N on SODIMM pin 99 nPWE */
-	npwe {
+	gpios-npwe {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(T, 5) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -759,7 +759,7 @@ npwe {
 	};
 
 	/* Not tri-stating GMI_WR_N on SODIMM pin 93 RDnWR */
-	rdnwr {
+	gpios-rdnwr {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(T, 6) GPIO_ACTIVE_HIGH>;
 		output-low;
diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 9f653ef41da4..01b2a9db77c8 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -239,7 +239,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	gpios-pex-perst-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
index dc633e529822..d5a244351137 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
@@ -257,7 +257,7 @@ reg_vddio_sdmmc3: regulator-vddio-sdmmc3 {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	gpios-pex-perst-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 933087ee45a8..c209020e13fd 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -1043,7 +1043,7 @@ sound {
 };
 
 &gpio {
-	lan-reset-n {
+	gpios-lan-reset-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
 		output-high;
-- 
2.24.1
