From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 19/37] ARM: tegra: colibri_t20: use high speed uart driver
Date: Sun,  2 Sep 2018 12:08:48 +0200
Message-ID: <20180902100906.25792-20-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Use high speed UART driver compatible nvidia,tegra20-hsuart.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index aa2ca3dad32c..86bfe77d9230 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -423,6 +423,14 @@
 			<&gpio TEGRA_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
 	};
 
+	serial@70006040 {
+		compatible = "nvidia,tegra20-hsuart";
+	};
+
+	serial@70006300 {
+		compatible = "nvidia,tegra20-hsuart";
+	};
+
 	nand-controller@70008000 {
 		status = "okay";
 
-- 
2.14.4
