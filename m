From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v4 6/6] ARM: dts: tegra: enable NAND flash on Colibri T20
Date: Mon, 11 Jun 2018 22:52:24 +0200
Message-ID: <20180611205224.23340-7-stefan@agner.ch>
References: <20180611205224.23340-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180611205224.23340-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com
Cc: dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, gaireg@gaireg.de, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

This enables the on-module ONFI conformant NAND flash.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/tegra20-colibri-512.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
index 5c202b3e3bb1..0c283fb77214 100644
--- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
@@ -462,6 +462,22 @@
 		};
 	};
 
+	nand-controller@70008000 {
+		status = "okay";
+
+		nand@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			nand-bus-width = <8>;
+			nand-on-flash-bbt;
+			nand-ecc-algo = "bch";
+			nand-is-boot-medium;
+			nand-ecc-maximize;
+			wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	usb@c5004000 {
 		status = "okay";
 		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 1)
-- 
2.17.1
