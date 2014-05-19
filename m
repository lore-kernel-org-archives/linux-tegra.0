From: Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 00/10] Tegra XHCI support
Date: Mon, 19 May 2014 11:30:57 -0700
Message-ID: <CAL1qeaHunT7Yw2Vn3_=M-1Ky0doU2DXWiu--bKmi4c5EQerrGA@mail.gmail.com>
References: <1400113986-339-1-git-send-email-abrestic@chromium.org>
	<537A0949.1050509@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537A0949.1050509-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: public-linux-tegra-u79uwXL29TY76Z2rM5mHXA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org
List-Id: linux-tegra@vger.kernel.org




Toumas,

> On Jetson-TK1 I can get USB2 devices to work but the USB3 device I tested
> (JMS539 SuperSpeed SATA II 3.0G  Bridge) just falls back to
> USB2, I wonder if some additional configuration is needed there.

The port mappings on Jetson TK1 are different from those on Venice2.
I don't have a board yet, but I should be getting one within the next
couple of days.  Looking at the schematics, I think this is the
correct DT fragment for Jetson TK1:

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra
index e31fb61..e3838de 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1619,6 +1619,22 @@
                nvidia,sys-clock-req-active-high;
        };

+       usb@0,70090000 {
+               status = "okay";
+               s1p05v-supply = <&vdd_1v05_run>;
+               s3p3v-supply = <&vdd_3v3_lp0>;
+               s1p8v-supply = <&vddio_1v8>;
+       };
+
+       phy@0,7009f000 {
+               status = "okay";
+               nvidia,ss-pads = <0x1>;
+               nvidia,hsic-pads = <0x0>;
+               nvidia,utmi-pads = <0x6>;
+               nvidia,ss-port0-map = <2>;
+               vbus3-supply = <&vdd_usb3_vbus>;
+       };
+
        /* SD card */
        sdhci@0,700b0400 {
                status = "okay";
@@ -1641,25 +1657,6 @@
                };
        };

-       /* mini-PCIe USB */
-       usb@0,7d004000 {
-               status = "okay";
-       };
-
-       usb-phy@0,7d004000 {
-               status = "okay";
-       };
-
-       /* USB A connector */
-       usb@0,7d008000 {
-               status = "okay";
-       };
-
-       usb-phy@0,7d008000 {
-               status = "okay";
-               vbus-supply = <&vdd_usb3_vbus>;
-       };
-
        clocks {
                compatible = "simple-bus";
                #address-cells = <1>;
