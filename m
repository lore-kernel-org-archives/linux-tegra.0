From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v4 2/6] mtd: rawnand: add an option to specify NAND chip as a
 boot device
Date: Mon, 11 Jun 2018 22:52:20 +0200
Message-ID: <20180611205224.23340-3-stefan@agner.ch>
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

Allow to define a NAND chip as a boot device. This can be helpful
for the selection of the ECC algorithm and strength in case the boot
ROM supports only a subset of controller provided options.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/nand.txt | 4 ++++
 drivers/mtd/nand/raw/nand_base.c               | 3 +++
 include/linux/mtd/rawnand.h                    | 6 ++++++
 3 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index eaef8c657aa5..e949c778e983 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -43,6 +43,10 @@ Optional NAND chip properties:
 		     This is particularly useful when only the in-band area is
 		     used by the upper layers, and you want to make your NAND
 		     as reliable as possible.
+- nand-is-boot-medium: Whether the NAND chip is a boot medium. Drivers might use
+		       this information to select ECC algorithms supported by
+		       the boot ROM or similar restrictions.
+
 - nand-rb: shall contain the native Ready/Busy ids.
 
 The ECC strength and ECC step size properties define the correction capability
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 9eb5678dd6d0..c8fb7c9855e2 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5826,6 +5826,9 @@ static int nand_dt_init(struct nand_chip *chip)
 	if (of_get_nand_bus_width(dn) == 16)
 		chip->options |= NAND_BUSWIDTH_16;
 
+	if (of_property_read_bool(dn, "nand-is-boot-medium"))
+		chip->options |= NAND_IS_BOOT_MEDIUM;
+
 	if (of_get_nand_on_flash_bbt(dn))
 		chip->bbt_options |= NAND_BBT_USE_FLASH;
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 6a82da8c44ce..8e54fcf2fa94 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -212,6 +212,12 @@ enum nand_ecc_algo {
  */
 #define NAND_WAIT_TCCS		0x00200000
 
+/*
+ * Whether the NAND chip is a boot medium. Drivers might use this information
+ * to select ECC algorithms supported by the boot ROM or similar restrictions.
+ */
+#define NAND_IS_BOOT_MEDIUM	0x00400000
+
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
 #define NAND_CONTROLLER_ALLOC	0x80000000
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
