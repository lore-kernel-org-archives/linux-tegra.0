From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 1/6] mtd: rawnand: add Reed-Solomon error correction algorithm
Date: Sun, 27 May 2018 23:54:37 +0200
Message-ID: <20180527215442.14760-2-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, mturquette@baylibre.com, sboyd@kernel.org
Cc: dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

Add Reed-Solomon (RS) to the enumeration of ECC algorithms.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/mtd/nand/raw/nand_base.c | 1 +
 include/linux/mtd/rawnand.h      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index f28c3a555861..9eb5678dd6d0 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5744,6 +5744,7 @@ static int of_get_nand_ecc_mode(struct device_node *np)
 static const char * const nand_ecc_algos[] = {
 	[NAND_ECC_HAMMING]	= "hamming",
 	[NAND_ECC_BCH]		= "bch",
+	[NAND_ECC_RS]		= "rs",
 };
 
 static int of_get_nand_ecc_algo(struct device_node *np)
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5dad59b31244..6a82da8c44ce 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -114,6 +114,7 @@ enum nand_ecc_algo {
 	NAND_ECC_UNKNOWN,
 	NAND_ECC_HAMMING,
 	NAND_ECC_BCH,
+	NAND_ECC_RS,
 };
 
 /*
-- 
2.17.0
