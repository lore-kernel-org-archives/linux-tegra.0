From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/6] ARM: DTS: tegra: add DFLL integration to the Dalmore
 DTS file
Date: Thu, 19 Dec 2013 04:49:44 -0800
Message-ID: <20131219124929.3226.79335.stgit@tamien>
References: <20131219122857.3226.42830.stgit@tamien>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131219122857.3226.42830.stgit@tamien>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthew Longnecker <mlongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Expose the DFLL device on the NVIDIA Tegra114 Dalmore board, and connect
the DFLL (and FCPU cluster) voltage regulator.

Signed-off-by: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Matthew Longnecker <mlongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../bindings/clock/nvidia,tegra114-dfll.txt        |   16 ++++++++++++++++
 arch/arm/boot/dts/tegra114-dalmore.dts             |    4 ++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra114-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra114-dfll.txt
index b868bf97bc3d..c4072b3f16fc 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra114-dfll.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra114-dfll.txt
@@ -41,3 +41,19 @@ dfll@70110000 {
         status = "disabled";
 };
 
+...
+
+NVIDIA Tegra114 DFLL clocksource data in the board DTS file
+
+Optional properties:
+
+- status : device availability -- managed by the DT integration code, not
+           the DFLL driver.  Should be set to "okay" if the DFLL is to be
+           used on this board type.
+
+
+Example:
+
+dfll@70110000 {
+        status = "okay";
+};
diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 88be40cf8845..2e8e7ae60c1a 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1063,6 +1063,10 @@
 		};
 	};
 
+	dfll@70110000 {
+		status = "okay";
+	};
+
 	sdhci@78000400 {
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
 		bus-width = <4>;
