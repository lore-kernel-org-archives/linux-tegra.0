From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v5 1/6] mtd: rawnand: add Reed-Solomon error correction algorithm
Date: Sun, 17 Jun 2018 22:46:00 +0200
Message-ID: <20180617204605.4648-2-stefan@agner.ch>
References: <20180617204605.4648-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180617204605.4648-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com
Cc: dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, gaireg@gaireg.de, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

Add Reed-Solomon (RS) to the enumeration of ECC algorithms.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/nand.txt | 2 +-
 drivers/mtd/nand/raw/nand_base.c               | 1 +
 include/linux/mtd/rawnand.h                    | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index 8bb11d809429d..eaef8c657aa5c 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -25,7 +25,7 @@ Optional NAND chip properties:
 		  Deprecated values:
 		  "soft_bch": use "soft" and nand-ecc-algo instead
 - nand-ecc-algo: string, algorithm of NAND ECC.
-		 Supported values are: "hamming", "bch".
+		 Valid values are: "hamming", "bch", "rs".
 - nand-bus-width : 8 or 16 bus width if not present 8
 - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
 
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 10c4f9919850c..47e9cb9063da4 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5777,6 +5777,7 @@ static int of_get_nand_ecc_mode(struct device_node *np)
 static const char * const nand_ecc_algos[] = {
 	[NAND_ECC_HAMMING]	= "hamming",
 	[NAND_ECC_BCH]		= "bch",
+	[NAND_ECC_RS]		= "rs",
 };
 
 static int of_get_nand_ecc_algo(struct device_node *np)
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 3e8ec3b8a39c7..2d9cb7acbc3d8 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -121,6 +121,7 @@ enum nand_ecc_algo {
 	NAND_ECC_UNKNOWN,
 	NAND_ECC_HAMMING,
 	NAND_ECC_BCH,
+	NAND_ECC_RS,
 };
 
 /*
-- 
2.17.1
