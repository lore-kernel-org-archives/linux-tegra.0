From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] mtd: rawnand: add NVIDIA Tegra NAND Flash controller
 driver
Date: Tue, 3 Jul 2018 17:19:57 +0300
Message-ID: <20180703141957.j27w6efnkhij5blz@kili.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: stefan@agner.ch
Cc: linux-tegra@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hello Stefan Agner,

The patch d7d9f8ec77fe: "mtd: rawnand: add NVIDIA Tegra NAND Flash
controller driver" from Jun 24, 2018, leads to the following static
checker warning:

	drivers/mtd/nand/raw/tegra_nand.c:476 tegra_nand_select_chip()
	warn: array off by one? 'nand->cs[die_nr]'

drivers/mtd/nand/raw/tegra_nand.c
   465  static void tegra_nand_select_chip(struct mtd_info *mtd, int die_nr)
   466  {
   467          struct nand_chip *chip = mtd_to_nand(mtd);
   468          struct tegra_nand_chip *nand = to_tegra_chip(chip);
   469          struct tegra_nand_controller *ctrl = to_tegra_ctrl(chip->controller);
   470  
   471          if (die_nr < 0 || die_nr > 1) {
   472                  ctrl->cur_cs = -1;
   473                  return;
   474          }
   475  
   476          ctrl->cur_cs = nand->cs[die_nr];
   477  }

The story is that nand->cs[] is a one element array.  Some people use
one element arrays like this as variable size arrays.  It's better to
use a zero size array, but I think that might be a GCC feature and not
everyone knows you can do that.  Smatch treats this one as unknown size
because apparently it can't tie it back to the kmalloc().

But it really is a one element array and the condition is off by one.

But really one element arrays are super weird.  Why not just use a
pointer?

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
