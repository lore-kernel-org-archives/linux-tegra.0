From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 16/73] ARM: tegra: Add missing #sound-dai-cells property to codecs
Date: Tue, 16 Jun 2020 15:51:41 +0200
Message-ID: <20200616135238.3001888-17-thierry.reding@gmail.com>
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

Audio codecs need a #sound-dai-cells property, so add one to the audio
codecs on various Tegra-based boards that don't have one.

Cc: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: Philippe Schenker <philippe.schenker-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 1 +
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 1 +
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi  | 1 +
 arch/arm/boot/dts/tegra30-apalis.dtsi       | 1 +
 arch/arm/boot/dts/tegra30-colibri.dtsi      | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 3fdc6ff32b0c..0d6890af457e 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1559,6 +1559,7 @@ i2c@7000d000 {
 		sgtl5000: codec@a {
 			compatible = "fsl,sgtl5000";
 			reg = <0x0a>;
+			#sound-dai-cells = <0>;
 			VDDA-supply = <&reg_module_3v3_audio>;
 			VDDD-supply = <&reg_1v8_vddio>;
 			VDDIO-supply = <&reg_1v8_vddio>;
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 29ceeba1e7b1..8857a11332c2 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1552,6 +1552,7 @@ i2c@7000d000 {
 		sgtl5000: codec@a {
 			compatible = "fsl,sgtl5000";
 			reg = <0x0a>;
+			#sound-dai-cells = <0>;
 			VDDA-supply = <&reg_module_3v3_audio>;
 			VDDD-supply = <&reg_1v8_vddio>;
 			VDDIO-supply = <&reg_1v8_vddio>;
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
index 9421063cd86c..fdd3e4e3522b 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
@@ -855,6 +855,7 @@ i2c@7000d000 {
 		sgtl5000: codec@a {
 			compatible = "fsl,sgtl5000";
 			reg = <0x0a>;
+			#sound-dai-cells = <0>;
 			VDDA-supply = <&reg_module_3v3_audio>;
 			VDDD-supply = <&reg_1v8_vio>;
 			VDDIO-supply = <&reg_module_3v3>;
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index d13f6b0c7c0c..90694d1a3b0c 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -846,6 +846,7 @@ i2c@7000d000 {
 		sgtl5000: codec@a {
 			compatible = "fsl,sgtl5000";
 			reg = <0x0a>;
+			#sound-dai-cells = <0>;
 			VDDA-supply = <&reg_module_3v3_audio>;
 			VDDD-supply = <&reg_1v8_vio>;
 			VDDIO-supply = <&reg_module_3v3>;
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index a7bfe26f038d..933087ee45a8 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -723,6 +723,7 @@ i2c@7000d000 {
 		sgtl5000: codec@a {
 			compatible = "fsl,sgtl5000";
 			reg = <0x0a>;
+			#sound-dai-cells = <0>;
 			VDDA-supply = <&reg_module_3v3_audio>;
 			VDDD-supply = <&reg_1v8_vio>;
 			VDDIO-supply = <&reg_module_3v3>;
-- 
2.24.1
