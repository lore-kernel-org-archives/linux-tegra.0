From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v7 07/18] of: document external-memory-controller property in tegra124-car
Date: Wed, 11 Mar 2015 11:34:20 +0100
Message-ID: <1426070126-26910-8-git-send-email-tomeu.vizoso@collabora.com>
References: <1426070126-26910-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426070126-26910-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This property contains a phandle to the EMC driver that is needed by the
EMC clock to request the EMC driver to do its part of the clock change
sequence.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
index c3891ce..7f02fb4 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
@@ -20,6 +20,7 @@ Required properties :
 - #reset-cells : Should be 1.
   In clock consumers, this cell represents the bit number in the CAR's
   array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
+- nvidia,external-memory-controller : phandle of the EMC driver.
 
 The node should contain a "emc-timings" subnode for each supported RAM type (see
 field RAM_CODE in register PMC_STRAPPING_OPT_A).
@@ -50,6 +51,7 @@ Example SoC include file:
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+		nvidia,external-memory-controller = <&emc>;
 	};
 
 	usb@c5004000 {
-- 
2.1.0
