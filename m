From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v2 3/3] ARM: tegra: Add gpio-ranges property
Date: Tue, 14 Jul 2015 10:29:56 +0200
Message-ID: <1436862596-27730-4-git-send-email-tomeu.vizoso@collabora.com>
References: <1436862596-27730-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436862596-27730-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Specify how the GPIOs map to the pins in Tegra SoCs, so the dependency is
explicit.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

Changes in v2:
- Remove outdated comment from the commit changelog

 arch/arm/boot/dts/tegra114.dtsi | 1 +
 arch/arm/boot/dts/tegra124.dtsi | 1 +
 arch/arm/boot/dts/tegra20.dtsi  | 1 +
 arch/arm/boot/dts/tegra30.dtsi  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index f58a3d9d5f13..7e1e1717e46a 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -234,6 +234,7 @@
 		gpio-controller;
 		#interrupt-cells = <2>;
 		interrupt-controller;
+		gpio-ranges = <&pinmux 0 0 246>;
 	};
 
 	apbmisc@70000800 {
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 87318a72f615..4779df336cb6 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -255,6 +255,7 @@
 		gpio-controller;
 		#interrupt-cells = <2>;
 		interrupt-controller;
+		gpio-ranges = <&pinmux 0 0 251>;
 	};
 
 	apbdma: dma@0,60020000 {
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index f444b67f55c6..b44277c63e8e 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -244,6 +244,7 @@
 		gpio-controller;
 		#interrupt-cells = <2>;
 		interrupt-controller;
+		gpio-ranges = <&pinmux 0 0 224>;
 	};
 
 	apbmisc@70000800 {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 782b11b2af6a..28c547f27ecd 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -349,6 +349,7 @@
 		gpio-controller;
 		#interrupt-cells = <2>;
 		interrupt-controller;
+		gpio-ranges = <&pinmux 0 0 248>;
 	};
 
 	apbmisc@70000800 {
-- 
2.4.3
