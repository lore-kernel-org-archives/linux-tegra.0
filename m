From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] mtd: rawnand: tegra: check bounds of die_nr properly
Date: Thu, 12 Jul 2018 16:44:21 +0300
Message-ID: <20180712134421.unczwgmvfdhezq3v@mwanda>
References: <20180704091310.22003-1-stefan@agner.ch>
 <1531402315.1390.6.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531402315.1390.6.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "stefan@agner.ch" <stefan@agner.ch>, "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "krzk@kernel.org" <krzk@kernel.org>, "dev@lynxeye.de" <dev@lynxeye.de>, "benjamin.lindqvist@endian.se" <benjamin.lindqvist@endian.se>, "digetx@gmail.com" <digetx@gmail.com>, "mirza.krak@gmail.com" <mirza.krak@gmail.com>, "gaireg@gaireg.de" <gaireg@gaireg.de>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, richard@nod.at
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 12, 2018 at 01:31:57PM +0000, Marcel Ziswiler wrote:
> On Wed, 2018-07-04 at 11:13 +0200, Stefan Agner wrote:
> > The Tegra driver currently only support a single chip select, hence
> > check boundaries accordingly. This fixes a off by one issue catched
> > with Smatch:
> >     drivers/mtd/nand/raw/tegra_nand.c:476 tegra_nand_select_chip()
> >     warn: array off by one? 'nand->cs[die_nr]'
> > 
> > Also warn in case the stack asks for a chip select we currently do
> > not support.
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
> > ---
> >  drivers/mtd/nand/raw/tegra_nand.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/tegra_nand.c
> > b/drivers/mtd/nand/raw/tegra_nand.c
> > index 4daa88d814134..e65ef584df0b9 100644
> > --- a/drivers/mtd/nand/raw/tegra_nand.c
> > +++ b/drivers/mtd/nand/raw/tegra_nand.c
> > @@ -468,7 +468,9 @@ static void tegra_nand_select_chip(struct
> > mtd_info *mtd, int die_nr)
> >  	struct tegra_nand_chip *nand = to_tegra_chip(chip);
> >  	struct tegra_nand_controller *ctrl = to_tegra_ctrl(chip-
> > >controller);
> >  
> > -	if (die_nr < 0 || die_nr > 1) {
> > +	WARN_ON(die_nr >= ARRAY_SIZE(nand->cs));
> 
> Unfortunately, that has a tiny little issue as die_nr is a signed
> integer and ARRAY_SIZE of course is unsigned. While I could have sworn
> my shirt off that the compiler would have to promote this to signed
> this is not quite what happens and upon deselecting with -1 this
> warning gets triggered!

Sorry, I didn't realize we were passing -1 as die_nr.  I should have
reviewed the code more carefully.

The type is promoted to the which ever side has more positive bits or
a minimum of int.  So if you compare an int to a long long it gets
promoted to long long.  If you compare an int to unsigned int, it is
promoted to unsigned int.  If both sides are smaller than int then it
is type promoted to int.

For compares, I can't think how type promoting to int can be a problem
but where it might matter is that that people sometimes want 0xfe and
they do "~(char)0x1" but it becomes 0xfffffffe.

The other trickiness is that x << shift is type x.  Sometime people
think if they make shift a u64 and x an int, the result will be u64 but
it's still int.

I think that's basically everything with type promotion.

regards,
dan carpenter
