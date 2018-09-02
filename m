From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 25/37] ARM: tegra: colibri_t20: add gpio hogs for gmi_wr_n buffers
Date: Sun,  2 Sep 2018 12:08:54 +0200
Message-ID: <20180902100906.25792-26-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add GPIO hogs for GMI_WR_N buffers:
- tri-stating GMI_WR_N on SODIMM pin 99 nPWE
- not tri-stating GMI_WR_N on SODIMM pin 93 RDnWR

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 281e0dd11565..aba56b447bcd 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -757,4 +757,20 @@
 		output-high;
 		line-name = "LAN_RESET#";
 	};
+
+	/* Tri-stating GMI_WR_N on SODIMM pin 99 nPWE */
+	npwe {
+		gpio-hog;
+		gpios = <TEGRA_GPIO(T, 5) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "Tri-state nPWE";
+	};
+
+	/* Not tri-stating GMI_WR_N on SODIMM pin 93 RDnWR */
+	rdnwr {
+		gpio-hog;
+		gpios = <TEGRA_GPIO(T, 6) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "Not tri-state RDnWR";
+	};
 };
-- 
2.14.4
