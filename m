From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v4 4/6] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Date: Tue, 12 Jun 2018 07:08:32 +0800
Message-ID: <201806120747.RxEPI6T2%fengguang.wu@intel.com>
References: <20180611205224.23340-5-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180611205224.23340-5-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, gaireg@gaireg.de, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: linux-tegra@vger.kernel.org

Hi Stefan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on v4.17 next-20180608]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Stefan-Agner/mtd-rawnand-add-NVIDIA-Tegra-NAND-flash-support/20180612-045611
base:   git://git.infradead.org/linux-mtd.git nand/next
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

   drivers/mtd/nand/raw/tegra_nand.c:422:41: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:425:41: sparse: expression using sizeof(void)
>> drivers/mtd/nand/raw/tegra_nand.c:656:56: sparse: Using plain integer as NULL pointer
   drivers/mtd/nand/raw/tegra_nand.c:667:56: sparse: Using plain integer as NULL pointer
   drivers/mtd/nand/raw/tegra_nand.c:693:56: sparse: Using plain integer as NULL pointer
   drivers/mtd/nand/raw/tegra_nand.c:759:48: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:759:48: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:762:24: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:762:24: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:792:56: sparse: Using plain integer as NULL pointer
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:814:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:818:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:823:15: sparse: expression using sizeof(void)
   drivers/mtd/nand/raw/tegra_nand.c:823:15: sparse: expression using sizeof(void)

vim +656 drivers/mtd/nand/raw/tegra_nand.c

   651	
   652	static int tegra_nand_read_page_raw(struct mtd_info *mtd,
   653					    struct nand_chip *chip,
   654					    uint8_t *buf, int oob_required, int page)
   655	{
 > 656		void *oob_buf = oob_required ? chip->oob_poi : 0;
   657	
   658		return tegra_nand_page_xfer(mtd, chip, buf, oob_buf,
   659					    mtd->oobsize, page, true);
   660	}
   661	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
