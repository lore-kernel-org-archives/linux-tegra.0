From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/2] mtd: nand: use unnamed union field
Date: Tue, 22 Jan 2019 16:42:53 +0900
Message-ID: <1548142975-14219-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Lucas Stach <dev@lynxeye.de>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, Jonathan Hunter <jonathanh@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: linux-tegra@vger.kernel.org

The new exec_op() scheme takes advantage of union
in order to store instruction private data, which is mutually
exclusive.

I felt a bit annoyed with the long accessors.
At least, we can omit "ctx." by making the union anonymous.

I converted nand_op_instr and nand_op_parser_pattern_elem.

I still see more instances, e.g.

  struct nand_op_data_instr {
          unsigned int len;
          union {
                  void *in;
                  const void *out;
          } buf;
          bool force_8bit;
  };

We could convert this into:

  struct nand_op_data_instr {
          unsigned int len;
          union {
                  void *ibuf;
                  const void *obuf;
          };
          bool force_8bit;
  };

Or, if we want to match the struct to NAND_OP_*_INSTR,
we can split it into two structures.

  struct nand_op_data_in_instr {
          unsigned int len;
          void *buf;
          bool force_8bit;
  };

  struct nand_op_data_out_instr {
          unsigned int len;
          const void *buf;
          bool force_8bit;
  };

Anyway, let's see if people are positive about
this shortning.



Masahiro Yamada (2):
  mtd: rawnand: use unnamed union in struct nand_op_instr
  mtd: rawnand: use unnamed union in struct nand_op_parser_pattern_elem

 drivers/mtd/nand/raw/ams-delta.c    | 18 +++++------
 drivers/mtd/nand/raw/fsmc_nand.c    | 41 +++++++++++-------------
 drivers/mtd/nand/raw/marvell_nand.c | 16 +++++-----
 drivers/mtd/nand/raw/nand_base.c    | 64 ++++++++++++++++++-------------------
 drivers/mtd/nand/raw/tegra_nand.c   | 10 +++---
 drivers/mtd/nand/raw/vf610_nfc.c    | 14 ++++----
 include/linux/mtd/rawnand.h         | 36 ++++++++++-----------
 7 files changed, 97 insertions(+), 102 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
