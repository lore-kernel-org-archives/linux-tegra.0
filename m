From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 7/8] ARM: tegra: Enable UDC on Jetson TK1
Date: Thu, 27 Jul 2017 19:46:11 +0300
Message-ID: <3590851985968e4b39673e60712faa2b2b408cd9.1501173271.git.digetx@gmail.com>
References: <cover.1501173271.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1501173271.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1501173271.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1501173271.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Override the compatible string of the first USB controller to enable
device mode.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 7bacb2954f58..61873d642a45 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1722,7 +1722,7 @@
 
 				lanes {
 					usb2-0 {
-						nvidia,function = "xusb";
+						nvidia,function = "snps";
 						status = "okay";
 					};
 
@@ -1829,6 +1829,16 @@
 		};
 	};
 
+	usb@7d000000 {
+		compatible = "nvidia,tegra124-udc";
+		status = "okay";
+		dr_mode = "peripheral";
+	};
+
+	usb-phy@7d000000 {
+		status = "okay";
+	};
+
 	/* mini-PCIe USB */
 	usb@7d004000 {
 		status = "okay";
-- 
2.13.3
