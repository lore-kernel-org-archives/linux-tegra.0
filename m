From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 24/37] ARM: tegra: colibri_t20: add gpio hog to unreset usb ethernet chip
Date: Sun,  2 Sep 2018 12:08:53 +0200
Message-ID: <20180902100906.25792-25-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add GPIO hog to unreset ASIX AX88772B USB Ethernet chip.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Also replace underscores in node name with dashes.

 arch/arm/boot/dts/tegra20-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 9ec56f49c30c..281e0dd11565 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -749,3 +749,12 @@
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
+
+&gpio {
+	lan-reset-n {
+		gpio-hog;
+		gpios = <TEGRA_GPIO(V, 4) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "LAN_RESET#";
+	};
+};
-- 
2.14.4
