From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL] ARM: tegra: dt2 branch
Date: Mon, 14 May 2012 20:37:08 +0000
Message-ID: <201205142037.08752.arnd@arndb.de>
References: <1337016017-30537-1-git-send-email-swarren@wwwdotorg.org> <201205141854.34331.arnd@arndb.de> <4FB1572D.90500@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FB1572D.90500-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Monday 14 May 2012, Stephen Warren wrote:
> On 05/14/2012 12:54 PM, Arnd Bergmann wrote:

> > 
> > I can't see anything wrong with your commits but please check again that it all makes
> > sense and let me know if I should really pull this version.
> 
> I think that looks OK. I probably just generated the diffstat backwards.

Ok, thanks for the confirmation.

I've pulled it into next/dt2 now. In order to merge this with the drivers/mmc branch
that contains the common mmc binding, I used the complex resolution below, adding
bus-width properties to both the dtsi and the dts files.

	Arnd

diff --cc arch/arm/boot/dts/tegra-cardhu.dts
index e14bb45,67c6511..0000000
--- a/arch/arm/boot/dts/tegra-cardhu.dts
+++ b/arch/arm/boot/dts/tegra-cardhu.dts
@@@ -139,32 -54,19 +139,34 @@@
  		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
  		wp-gpios = <&gpio 155 0>; /* gpio PT3 */
  		power-gpios = <&gpio 31 0>; /* gpio PD7 */
+ 		bus-width = <4>;
  	};
  
 -	sdhci@78000200 {
 -		status = "disable";
 -	};
 -
 -	sdhci@78000400 {
 -		status = "disable";
 -	};
 -
 -	sdhci@78000400 {
 +	sdhci@78000600 {
 +		status = "okay";
  		support-8bit;
+ 		bus-width = <8>;
  	};
 +
 +	sound {
 +		compatible = "nvidia,tegra-audio-wm8903-cardhu",
 +			     "nvidia,tegra-audio-wm8903";
 +		nvidia,model = "NVIDIA Tegra Cardhu";
 +
 +		nvidia,audio-routing =
 +			"Headphone Jack", "HPOUTR",
 +			"Headphone Jack", "HPOUTL",
 +			"Int Spk", "ROP",
 +			"Int Spk", "RON",
 +			"Int Spk", "LOP",
 +			"Int Spk", "LON",
 +			"Mic Jack", "MICBIAS",
 +			"IN1L", "Mic Jack";
 +
 +		nvidia,i2s-controller = <&tegra_i2s1>;
 +		nvidia,audio-codec = <&wm8903>;
 +
 +		nvidia,spkr-en-gpios = <&wm8903 2 0>;
 +		nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
 +	};
  };
diff --cc arch/arm/boot/dts/tegra-harmony.dts
index 6bcdad3,e9cae68..0000000
--- a/arch/arm/boot/dts/tegra-harmony.dts
+++ b/arch/arm/boot/dts/tegra-harmony.dts
@@@ -277,36 -44,8 +277,38 @@@
  		clock-frequency = <400000>;
  	};
  
 -	i2s@70002a00 {
 -		status = "disable";
 +	pmc {
 +		nvidia,invert-interrupt;
 +	};
 +
 +	usb@c5000000 {
 +		status = "okay";
 +	};
 +
 +	usb@c5004000 {
 +		status = "okay";
 +		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
 +	};
 +
 +	usb@c5008000 {
 +		status = "okay";
 +	};
 +
 +	sdhci@c8000200 {
 +		status = "okay";
 +		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
 +		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
 +		power-gpios = <&gpio 155 0>; /* gpio PT3 */
++		bus-width = <4>;
 +	};
 +
 +	sdhci@c8000600 {
 +		status = "okay";
 +		cd-gpios = <&gpio 58 0>; /* gpio PH2 */
 +		wp-gpios = <&gpio 59 0>; /* gpio PH3 */
 +		power-gpios = <&gpio 70 0>; /* gpio PI6 */
 +		support-8bit;
++		bus-width = <8>;
  	};
  
  	sound {
diff --cc arch/arm/boot/dts/tegra-ventana.dts
index 15d8fdb,29e54c7..0000000
--- a/arch/arm/boot/dts/tegra-ventana.dts
+++ b/arch/arm/boot/dts/tegra-ventana.dts
@@@ -291,29 -40,8 +291,31 @@@
  		clock-frequency = <400000>;
  	};
  
 -	i2s@70002a00 {
 -		status = "disable";
 +	usb@c5000000 {
 +		status = "okay";
 +	};
 +
 +	usb@c5004000 {
 +		status = "okay";
 +		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
 +	};
 +
 +	usb@c5008000 {
 +		status = "okay";
 +	};
 +
 +	sdhci@c8000400 {
 +		status = "okay";
 +		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
 +		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
 +		power-gpios = <&gpio 70 0>; /* gpio PI6 */
++		bus-width = <4>;
 +	};
 +
 +	sdhci@c8000600 {
 +		status = "okay";
 +		support-8bit;
++		bus-width = <8>;
  	};
  
  	sound {
diff --git a/arch/arm/boot/dts/tegra-trimslice.dts b/arch/arm/boot/dts/tegra-trimslice.dts
index 6fc52af..9de5636 100644
--- a/arch/arm/boot/dts/tegra-trimslice.dts
+++ b/arch/arm/boot/dts/tegra-trimslice.dts
@@ -288,12 +288,14 @@
 
 	sdhci@c8000000 {
 		status = "okay";
+		bus-width = <4>;
 	};
 
 	sdhci@c8000600 {
 		status = "okay";
 		cd-gpios = <&gpio 121 0>; /* gpio PP1 */
 		wp-gpios = <&gpio 122 0>; /* gpio PP2 */
+		bus-width = <4>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index c417d67..26f4299 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -214,6 +214,7 @@
 		reg = <0xc8000000 0x200>;
 		interrupts = <0 14 0x04>;
 		status = "disable";
+		bus-width = <4>;
 	};
 
 	sdhci@c8000200 {
@@ -221,6 +222,7 @@
 		reg = <0xc8000200 0x200>;
 		interrupts = <0 15 0x04>;
 		status = "disable";
+		bus-width = <4>;
 	};
 
 	sdhci@c8000400 {
@@ -228,6 +230,7 @@
 		reg = <0xc8000400 0x200>;
 		interrupts = <0 19 0x04>;
 		status = "disable";
+		bus-width = <4>;
 	};
 
 	sdhci@c8000600 {
@@ -235,6 +238,7 @@
 		reg = <0xc8000600 0x200>;
 		interrupts = <0 31 0x04>;
 		status = "disable";
+		bus-width = <4>;
 	};
 
 	pmu {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 2dcc09e..95fa6e3c 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -238,6 +238,7 @@
 		reg = <0x78000000 0x200>;
 		interrupts = <0 14 0x04>;
 		status = "disable";
+		bus-width = <4>;
 	};
 
 	sdhci@78000200 {
@@ -245,6 +246,7 @@
 		reg = <0x78000200 0x200>;
 		interrupts = <0 15 0x04>;
 		status = "disable";
+		bus-width = <4>;
 	};
 
 	sdhci@78000400 {
@@ -252,6 +254,7 @@
 		reg = <0x78000400 0x200>;
 		interrupts = <0 19 0x04>;
 		status = "disable";
+		bus-width = <4>;
 	};
 
 	sdhci@78000600 {
@@ -259,6 +262,7 @@
 		reg = <0x78000600 0x200>;
 		interrupts = <0 31 0x04>;
 		status = "disable";
+		bus-width = <4>;
 	};
 
 	pmu {
