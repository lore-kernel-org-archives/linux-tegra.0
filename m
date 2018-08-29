From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 20/31] ARM: tegra: colibri_t20: iris: add gpio wakeup key
Date: Wed, 29 Aug 2018 10:13:56 +0200
Message-ID: <20180829081407.11304-21-marcel@ziswiler.com>
References: <20180829081407.11304-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829081407.11304-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add SODIMM pin 45 as GPIO wakeup key.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index a2364e39c131..f615e3b9490f 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
+#include <dt-bindings/input/input.h>
 #include "tegra20-colibri.dtsi"
 
 / {
@@ -177,6 +178,18 @@
 		pwms = <&pwm 0 5000000>; /* PWM<A> */
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		wakeup {
+			label = "SODIMM pin 45 wakeup";
+			gpios = <&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
+			linux,code = <KEY_WAKEUP>;
+			debounce-interval = <10>;
+			wakeup-source;
+		};
+	};
+
 	panel: panel {
 		/*
 		 * edt,et057090dhu: EDT 5.7" LCD TFT
-- 
2.14.4
