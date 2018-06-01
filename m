From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v3 1/6] mtd: rawnand: add Reed-Solomon error correction
 algorithm
Date: Fri, 1 Jun 2018 11:25:06 +0200
Message-ID: <20180601112506.2157e8b0@bbrezillon>
References: <20180531221637.6017-1-stefan@agner.ch>
        <20180531221637.6017-2-stefan@agner.ch>
        <20180601092600.03c14f53@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180601092600.03c14f53@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pgaikwad@nvidia.com, dev@lynxeye.de, mirza.krak@gmail.com, benjamin.lindqvist@endian.se, pdeschrijver@nvidia.com, miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com, marek.vasut@gmail.com, thierry.reding@gmail.com, linux-mtd@lists.infradead.org, krzk@kernel.org, richard@nod.at, linux-tegra@vger.kernel.org, digetx@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org, marcel@ziswiler.com
List-Id: linux-tegra@vger.kernel.org

On Fri, 1 Jun 2018 09:26:00 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Fri,  1 Jun 2018 00:16:32 +0200
> Stefan Agner <stefan@agner.ch> wrote:
> 
> > Add Reed-Solomon (RS) to the enumeration of ECC algorithms.
> > 
> > Signed-off-by: Stefan Agner <stefan@agner.ch>  
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> 
> > ---
> >  drivers/mtd/nand/raw/nand_base.c | 1 +
> >  include/linux/mtd/rawnand.h      | 1 +

Hm, you forgot to update Documentation/devicetree/bindings/mtd/nand.txt.

> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index f28c3a555861..9eb5678dd6d0 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -5744,6 +5744,7 @@ static int of_get_nand_ecc_mode(struct device_node *np)
> >  static const char * const nand_ecc_algos[] = {
> >  	[NAND_ECC_HAMMING]	= "hamming",
> >  	[NAND_ECC_BCH]		= "bch",
> > +	[NAND_ECC_RS]		= "rs",
> >  };
> >  
> >  static int of_get_nand_ecc_algo(struct device_node *np)
> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index 5dad59b31244..6a82da8c44ce 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -114,6 +114,7 @@ enum nand_ecc_algo {
> >  	NAND_ECC_UNKNOWN,
> >  	NAND_ECC_HAMMING,
> >  	NAND_ECC_BCH,
> > +	NAND_ECC_RS,
> >  };
> >  
> >  /*  
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
