From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v4 3/6] mtd: rawnand: tegra: add devicetree binding
Date: Mon, 11 Jun 2018 22:52:21 +0200
Message-ID: <20180611205224.23340-4-stefan@agner.ch>
References: <20180611205224.23340-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180611205224.23340-1-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com
Cc: benjamin.lindqvist@endian.se, Stefan Agner <stefan@agner.ch>, pgaikwad@nvidia.com, dev@lynxeye.de, mirza.krak@gmail.com, richard@nod.at, pdeschrijver@nvidia.com, linux-kernel@vger.kernel.org, krzk@kernel.org, jonathanh@nvidia.com, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, marcel@ziswiler.com, miquel.raynal@bootlin.com, linux-tegra@vger.kernel.org, digetx@gmail.com, gaireg@gaireg.de
List-Id: linux-tegra@vger.kernel.org

This adds the devicetree binding for the Tegra 2 NAND flash
controller.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mtd/nvidia-tegra20-nand.txt      | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt b/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
new file mode 100644
index 000000000000..1c351362f3a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
@@ -0,0 +1,64 @@
+NVIDIA Tegra NAND Flash controller
+
+Required properties:
+- compatible: Must be one of:
+  - "nvidia,tegra20-nand"
+- reg: MMIO address range
+- interrupts: interrupt output of the NFC controller
+- clocks: Must contain an entry for each entry in clock-names.
+  See ../clocks/clock-bindings.txt for details.
+- clock-names: Must include the following entries:
+  - nand
+- resets: Must contain an entry for each entry in reset-names.
+  See ../reset/reset.txt for details.
+- reset-names: Must include the following entries:
+  - nand
+
+Optional children nodes:
+Individual NAND chips are children of the NAND controller node. Currently
+only one NAND chip supported.
+
+Required children node properties:
+- reg: An integer ranging from 1 to 6 representing the CS line to use.
+
+Optional children node properties:
+- nand-ecc-mode: String, operation mode of the NAND ecc mode. Currently only
+		 "hw" is supported.
+- nand-ecc-algo: string, algorithm of NAND ECC.
+		 Supported values with "hw" ECC mode are: "rs", "bch".
+- nand-bus-width : See nand.txt
+- nand-on-flash-bbt: See nand.txt
+- nand-ecc-strength: integer representing the number of bits to correct
+		     per ECC step (always 512). Supported strength using HW ECC
+		     modes are:
+		     - RS: 4, 6, 8
+		     - BCH: 4, 8, 14, 16
+- nand-ecc-maximize: See nand.txt
+- nand-is-boot-medium: Makes sure only ECC strengths supported by the boot ROM
+		       are choosen.
+- wp-gpios: GPIO specifier for the write protect pin.
+
+Optional child node of NAND chip nodes:
+Partitions: see partition.txt
+
+  Example:
+	nand-controller@70008000 {
+		compatible = "nvidia,tegra20-nand";
+		reg = <0x70008000 0x100>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
+		clock-names = "nand";
+		resets = <&tegra_car 13>;
+		reset-names = "nand";
+
+		nand@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			nand-bus-width = <8>;
+			nand-on-flash-bbt;
+			nand-ecc-algo = "bch";
+			nand-ecc-strength = <8>;
+			wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
+		};
+	};
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
