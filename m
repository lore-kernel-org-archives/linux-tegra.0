From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] mtd: rawnand: fix a couple of spelling mistakes
Date: Tue, 26 Jun 2018 11:26:29 +0100
Message-ID: <20180626102629.31083-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trival fix of two spelling mistakes in dev_err error messages:
"supportes" -> "supports" and "strenght" -> "strength"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 4daa88d81413..9f7de36be893 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1002,14 +1002,14 @@ static int tegra_nand_chips_init(struct device *dev,
 	}
 
 	if (chip->ecc.algo == NAND_ECC_BCH && mtd->writesize < 2048) {
-		dev_err(dev, "BCH supportes 2K or 4K page size only\n");
+		dev_err(dev, "BCH supports 2K or 4K page size only\n");
 		return -EINVAL;
 	}
 
 	if (!chip->ecc.strength) {
 		ret = tegra_nand_select_strength(chip, mtd->oobsize);
 		if (ret < 0) {
-			dev_err(dev, "No valid strenght found, minimum %d\n",
+			dev_err(dev, "No valid strength found, minimum %d\n",
 				chip->ecc_strength_ds);
 			return ret;
 		}
-- 
2.17.1
