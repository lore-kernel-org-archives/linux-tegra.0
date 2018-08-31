From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 29/34] ARM: tegra: apalis_t30: hog group for pcie switch reset gpio
Date: Fri, 31 Aug 2018 18:38:11 +0200
Message-ID: <20180831163817.23970-30-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

The Apalis Evaluation Board uses Apalis GPIO7 on MXM3 pin 15 as reset
signal for its PLX PEX 8605 PCIe Switch.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- New patch.

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index bbde98fd9712..9d9dda6c0246 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -240,3 +240,13 @@
 		vin-supply = <&reg_5v0>;
 	};
 };
+
+&gpio {
+	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
+	pex-perst-n {
+		gpio-hog;
+		gpios = <TEGRA_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "PEX_PERST_N";
+	};
+};
-- 
2.14.4
