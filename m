From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] mtd: rawnand: tegra: check bounds of die_nr properly
Date: Wed,  4 Jul 2018 11:13:10 +0200
Message-ID: <20180704091310.22003-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, dan.carpenter@oracle.com, dev@lynxeye.de, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, mirza.krak@gmail.com, gaireg@gaireg.de, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

The Tegra driver currently only support a single chip select, hence
check boundaries accordingly. This fixes a off by one issue catched
with Smatch:
    drivers/mtd/nand/raw/tegra_nand.c:476 tegra_nand_select_chip()
    warn: array off by one? 'nand->cs[die_nr]'

Also warn in case the stack asks for a chip select we currently do
not support.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/mtd/nand/raw/tegra_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 4daa88d814134..e65ef584df0b9 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -468,7 +468,9 @@ static void tegra_nand_select_chip(struct mtd_info *mtd, int die_nr)
 	struct tegra_nand_chip *nand = to_tegra_chip(chip);
 	struct tegra_nand_controller *ctrl = to_tegra_ctrl(chip->controller);
 
-	if (die_nr < 0 || die_nr > 1) {
+	WARN_ON(die_nr >= ARRAY_SIZE(nand->cs));
+
+	if (die_nr < 0 || die_nr > 0) {
 		ctrl->cur_cs = -1;
 		return;
 	}
-- 
2.18.0
