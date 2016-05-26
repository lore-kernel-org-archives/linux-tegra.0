From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 5/5] ARM: tegra: Enable UDC on Jetson TK1
Date: Thu, 26 May 2016 17:40:05 +0200
Message-ID: <20160526154005.11558-6-thierry.reding@gmail.com>
References: <20160526154005.11558-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160526154005.11558-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Override the compatible string of the first USB controller to enable
device mode.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 941f36263c8f..30e92cc85b86 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1726,7 +1726,7 @@
 
 				lanes {
 					usb2-0 {
-						nvidia,function = "xusb";
+						nvidia,function = "snps";
 						status = "okay";
 					};
 
@@ -1833,6 +1833,17 @@
 		};
 	};
 
+	usb@0,7d000000 {
+		compatible = "nvidia,tegra124-udc";
+		status = "okay";
+		dr_mode = "otg";
+	};
+
+	usb-phy@0,7d000000 {
+		status = "okay";
+		dr_mode = "otg";
+	};
+
 	/* mini-PCIe USB */
 	usb@0,7d004000 {
 		status = "okay";
-- 
2.8.3
