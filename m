Received: from terefe.re (terefe.re [5.255.96.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2482C2AD00;
	Thu, 22 Aug 2024 18:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.255.96.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724352366; cv=none; b=lpgd11D3emqD6tQpj0yCFZfxf0YsXB6XXyNbJYHdf4I0erMy2z648CtKlVlH1QqFb8zO33uBT+ewel555gvvkjMF0nf07Ju+bsdTHA5GtnRHtnW4H/ACWVCAXLpk3y6fHzIQ7rzipO4uBFO0UKjgZJ4HVlCwZerUEIJWqfUlNt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724352366; c=relaxed/simple;
	bh=zfOiErGOf9PASUESkcUjB4NpTO1hs1IUST0d42YNoL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2IQXkOifkWnKjs4PAx6P7MlMF+1mSGncFPoSbxyqkaAaj9cGz9IkS8+4x5O3OnD7a9h+fSMUVm0WX/OgRnRuAWKA0jhEUXTvrZvbjvHZJ+tH5GXt3QG2WrEOHlg4OwFqMeZWrzCn/PbWwdx68fx/BOxu4q6BtF5+xshXU6GnHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=terefe.re; spf=pass smtp.mailfrom=terefe.re; dkim=pass (2048-bit key) header.d=terefe.re header.i=@terefe.re header.b=fheAtz0J; arc=none smtp.client-ip=5.255.96.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=terefe.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=terefe.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=terefe.re header.i=@terefe.re header.b="fheAtz0J"
Received: from localhost.localdomain (unknown [212.106.161.95])
	by terefe.re (Postfix) with ESMTPSA id C6E341FFBF;
	Thu, 22 Aug 2024 20:46:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=terefe.re; s=default;
	t=1724352361; bh=zfOiErGOf9PASUESkcUjB4NpTO1hs1IUST0d42YNoL0=;
	h=From:To:Cc:Subject:Date:From;
	b=fheAtz0J9Uyql+rN9sp41We6TAegcHo5BYGHrpKz4ipGBUw5IX4Y/g2jSbN9rbAHp
	 /MRHanJPor6D4XFReQW1UNCEA8uuqJOcYgBx28XyWJZuXiogO2PvltL+prv4EN2zHi
	 Jrf4qg7Fz5/phfLgEYi4e5BLIm8QrOJn+m6BpCQUMoTMys3FQlPoEruLMwJVS2P8l0
	 jvBrLwMV1IQAaBn7jlv5g1avhMDo7jq+JCAjZRa10EVdLbKbjOysQES0fd3B6QRNpK
	 dfVspQ82bOPrQXa1fcSRZo6gD1y8HDTpl6/tgGRUv4ZFmTzZVTwi3d3f9BXRO3e/PN
	 pR4bCrNxIRAuw==
From: Tomasz Maciej Nowak <tmn505@terefe.re>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomasz Maciej Nowak <tmn505@gmail.com>
Subject: [PATCH v2] ARM: tegra: wire up two front panel LEDs on TrimSlice
Date: Thu, 22 Aug 2024 20:41:02 +0200
Message-ID: <20240822184555.20353-1-tmn505@terefe.re>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Maciej Nowak <tmn505@gmail.com>

Pins responsible for controlling these LEDs need to have tristate
control removed if we want them as GPIOs. This change alings with pinmux
configuration of "dte" pin group in downstream kernel[1].
These LEDs had no function assigned on vendor kernel and there is no
label on the case, the only markings are on PCB which are part of node
names (ds1 marking is on power LED controlled by PMIC), so generic term
is assigned as the function.

1. https://github.com/compulab/trimslice-android-kernel/blob/upstream/arch/arm/mach-tegra/board-trimslice-pinmux.c#L45

Signed-off-by: Tomasz Maciej Nowak <tmn505@gmail.com>
---
Previous version: https://lore.kernel.org/linux-tegra/20180219201623.6987-1-tmn505@gmail.com
Changes in v2:
- rebase
- reword commit title and message
- align to changes in leds subsystem
- align to dtschema recomendations

 .../arm/boot/dts/nvidia/tegra20-trimslice.dts | 30 +++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-trimslice.dts b/arch/arm/boot/dts/nvidia/tegra20-trimslice.dts
index 7cae6ad57544..4caeeb9f1e1d 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-trimslice.dts
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include "tegra20.dtsi"
 #include "tegra20-cpu-opp.dtsi"
 
@@ -201,16 +202,17 @@ uca {
 			conf_ata {
 				nvidia,pins = "ata", "atc", "atd", "ate",
 					"crtp", "dap2", "dap3", "dap4", "dta",
-					"dtb", "dtc", "dtd", "dte", "gmb",
-					"gme", "i2cp", "pta", "slxc", "slxd",
-					"spdi", "spdo", "uda";
+					"dtb", "dtc", "dtd", "gmb", "gme",
+					"i2cp", "pta", "slxc", "slxd", "spdi",
+					"spdo", "uda";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 			};
 			conf_atb {
 				nvidia,pins = "atb", "cdev1", "cdev2", "dap1",
-					"gma", "gmc", "gmd", "gpu", "gpu7",
-					"gpv", "sdio1", "slxa", "slxk", "uac";
+					"dte", "gma", "gmc", "gmd", "gpu",
+					"gpu7", "gpv", "sdio1", "slxa", "slxk",
+					"uac";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
@@ -408,6 +410,24 @@ key-power {
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led-ds2 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
+			gpios = <&gpio TEGRA_GPIO(D, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		led-ds3 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <3>;
+			gpios = <&gpio TEGRA_GPIO(BB, 5) GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	poweroff {
 		compatible = "gpio-poweroff";
 		gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
-- 
2.46.0

