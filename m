From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 19/31] ARM: tegra: colibri_t20: use high speed uart driver
Date: Wed, 29 Aug 2018 10:13:55 +0200
Message-ID: <20180829081407.11304-20-marcel@ziswiler.com>
References: <20180829081407.11304-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829081407.11304-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Use high speed UART driver compatible nvidia,tegra20-hsuart.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra20-colibri.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index a7403ce9ee99..3d61175e2a9c 100644
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
