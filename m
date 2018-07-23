From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 01/26] ARM: tegra: colibri_t30: enable broken-hpi on emmc
Date: Mon, 23 Jul 2018 14:36:32 +0200
Message-ID: <20180723123658.980-2-marcel@ziswiler.com>
References: <20180723123658.980-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723123658.980-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Avoid eMMC issues by specifying broken-hpi.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-colibri.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 526ed71cf7a3..6293422c977a 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -430,8 +430,16 @@
 	/* eMMC */
 	sdhci@78000600 {
 		status = "okay";
+		#address-cells = <1>;
+		#size-cells = <0>;
 		bus-width = <8>;
 		non-removable;
+
+		emmc: emmc@0 {
+			reg = <0>;
+			compatible = "mmc-card";
+			broken-hpi;
+		};
 	};
 
 	/* EHCI instance 1: USB2_DP/N -> AX88772B */
-- 
2.14.4
