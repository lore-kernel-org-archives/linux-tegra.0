From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2] mtd: rawnand: tegra: check bounds of die_nr properly
Date: Tue, 17 Jul 2018 10:46:18 +0200
Message-ID: <20180717084618.25249-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, boris.brezillon@bootlin.com, miquel.raynal@bootlin.com
Cc: dev@lynxeye.de, mirza.krak@gmail.com, benjamin.lindqvist@endian.se, krzk@kernel.org, marek.vasut@gmail.com, richard@nod.at, digetx@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org, dan.carpenter@oracle.com, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Stefan Agner <stefan@agner.ch>

The Tegra driver currently only support a single chip select, hence
check boundaries accordingly. This fixes a off by one issue catched
with Smatch:
    drivers/mtd/nand/raw/tegra_nand.c:476 tegra_nand_select_chip()
    warn: array off by one? 'nand->cs[die_nr]'

Also warn in case the stack asks for a chip select we currently do
not support.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Fixed comparison between signed integer die_nr and unsigned ARRAY_SIZE.

 drivers/mtd/nand/raw/tegra_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 9f7de36be893..56c0aa1bc81f 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -468,7 +468,9 @@ static void tegra_nand_select_chip(struct mtd_info *mtd, int die_nr)
 	struct tegra_nand_chip *nand = to_tegra_chip(chip);
 	struct tegra_nand_controller *ctrl = to_tegra_ctrl(chip->controller);
 
-	if (die_nr < 0 || die_nr > 1) {
+	WARN_ON(die_nr >= (int)ARRAY_SIZE(nand->cs));
+
+	if (die_nr < 0 || die_nr > 0) {
 		ctrl->cur_cs = -1;
 		return;
 	}
-- 
2.14.4
