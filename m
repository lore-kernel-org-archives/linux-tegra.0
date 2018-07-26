From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/2] ARM: tegra: readd gpio-ranges properties
Date: Thu, 26 Jul 2018 17:40:25 +0200
Message-ID: <20180726154025.13173-2-stefan@agner.ch>
References: <20180726154025.13173-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726154025.13173-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, linus.walleij@linaro.org
Cc: pdeschrijver@nvidia.co, digetx@gmail.com, keescook@chromium.org, marcel.ziswiler@toradex.com, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

The properties have been commented out to prevent a regression a
while ago. The first regression should be resolved by
commit 44af7927316e ("spi: Map SPI OF client IRQ at probe time").

The second regression is probably addressed by
commit 494fd7b7ad10 ("PM / core: fix deferred probe breaking suspend resume order")
and/or maybe others. Readd the gpio-ranges properties to see whether
regressions still get reported.

This reverts commit 4f1d841475e1f6e9e32496dda11215db56f4ea73
("ARM: tegra: Comment out gpio-ranges properties").

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/tegra114.dtsi | 2 --
 arch/arm/boot/dts/tegra124.dtsi | 2 --
 arch/arm/boot/dts/tegra20.dtsi  | 2 --
 arch/arm/boot/dts/tegra30.dtsi  | 2 --
 4 files changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 84c4358dacac..39253450a974 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -240,9 +240,7 @@
 		gpio-controller;
 		#interrupt-cells = <2>;
 		interrupt-controller;
-		/*
 		gpio-ranges = <&pinmux 0 0 246>;
-		*/
 	};
 
 	apbmisc@70000800 {
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 174092bfac90..47b51376ed36 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -263,9 +263,7 @@
 		gpio-controller;
 		#interrupt-cells = <2>;
 		interrupt-controller;
-		/*
 		gpio-ranges = <&pinmux 0 0 251>;
-		*/
 	};
 
 	apbdma: dma@60020000 {
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 983dd5c14794..cdf018a7568c 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -258,9 +258,7 @@
 		gpio-controller;
 		#interrupt-cells = <2>;
 		interrupt-controller;
-		/*
 		gpio-ranges = <&pinmux 0 0 224>;
-		*/
 	};
 
 	vde@6001a000 {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 09087b9c5e26..b80f35411d72 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -380,9 +380,7 @@
 		gpio-controller;
 		#interrupt-cells = <2>;
 		interrupt-controller;
-		/*
 		gpio-ranges = <&pinmux 0 0 248>;
-		*/
 	};
 
 	vde@6001a000 {
-- 
2.18.0
