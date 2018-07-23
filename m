From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 22/26] ARM: tegra: colibri_t30: add gpio hog to unreset usb ethernet chip
Date: Mon, 23 Jul 2018 14:36:53 +0200
Message-ID: <20180723123658.980-23-marcel@ziswiler.com>
References: <20180723123658.980-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723123658.980-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add GPIO hog to unreset ASIX AX88772B USB Ethernet chip.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index e32109475bc8..7f7a693f6e08 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -1034,3 +1034,12 @@
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
+
+&gpio {
+	lan_reset_n {
+		gpio-hog;
+		gpios = <TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "LAN_RESET#";
+	};
+};
-- 
2.14.4
