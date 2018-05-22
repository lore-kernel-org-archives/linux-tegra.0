From: Stefan Agner <stefan@agner.ch>
Subject: [RESEND PATCH 5/5] ARM: tegra: enable NAND flash on Colibri T20
Date: Tue, 22 May 2018 14:07:09 +0200
Message-ID: <7f2d12d5a82843a633ea3cd11ff67ea572fb51c3.1526990589.git.stefan@agner.ch>
References: <cover.1526990589.git.stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1526990589.git.stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, mturquette@baylibre.com, sboyd@kernel.org
Cc: dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

From: Lucas Stach <dev@lynxeye.de>

This enables the on-module ONFI conformant NAND flash.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/tegra20-colibri-512.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
index 5c202b3e3bb1..6e5dd31c4036 100644
--- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
@@ -462,6 +462,13 @@
 		};
 	};
 
+	nand@70008000 {
+		status = "okay";
+		nand-bus-width = <8>;
+		nand-on-flash-bbt;
+		wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_HIGH>;
+	};
+
 	usb@c5004000 {
 		status = "okay";
 		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 1)
-- 
2.17.0
