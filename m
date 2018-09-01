From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 21/34] ARM: tegra: colibri_t30: add gpio hog to unreset usb ethernet chip
Date: Sat,  1 Sep 2018 10:12:35 +0200
Message-ID: <20180901081248.22639-22-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add GPIO hog to unreset ASIX AX88772B USB Ethernet chip.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Replace underscores in node names with dashes.

 arch/arm/boot/dts/tegra30-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index eb36ae3038a7..aff94707b3fa 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -1027,3 +1027,12 @@
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
+
+&gpio {
+	lan-reset-n {
+		gpio-hog;
+		gpios = <TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "LAN_RESET#";
+	};
+};
-- 
2.14.4
