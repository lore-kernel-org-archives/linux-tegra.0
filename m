From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v3 2/6] mtd: rawnand: add an option to specify NAND chip
 as a boot device
Date: Wed, 6 Jun 2018 09:28:44 +0200
Message-ID: <20180606092844.3ab746b2@bbrezillon>
References: <20180531221637.6017-1-stefan@agner.ch>
        <20180531221637.6017-3-stefan@agner.ch>
        <20180605201102.GA22487@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180605201102.GA22487@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, mark.rutland@arm.com, thierry.reding@gmail.com, dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Rob,

On Tue, 5 Jun 2018 14:11:02 -0600
Rob Herring <robh@kernel.org> wrote:

> On Fri, Jun 01, 2018 at 12:16:33AM +0200, Stefan Agner wrote:
> > Allow to define a NAND chip as a boot device. This can be helpful
> > for the selection of the ECC algorithm and strength in case the boot
> > ROM supports only a subset of controller provided options.
> > 
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
> > ---
> >  Documentation/devicetree/bindings/mtd/nand.txt | 4 ++++
> >  drivers/mtd/nand/raw/nand_base.c               | 3 +++
> >  include/linux/mtd/rawnand.h                    | 6 ++++++
> >  3 files changed, 13 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
> > index 8bb11d809429..8daf81b9748c 100644
> > --- a/Documentation/devicetree/bindings/mtd/nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> > @@ -43,6 +43,10 @@ Optional NAND chip properties:
> >  		     This is particularly useful when only the in-band area is
> >  		     used by the upper layers, and you want to make your NAND
> >  		     as reliable as possible.
> > +- nand-is-boot-medium: Whether the NAND chip is a boot medium. Drivers might use
> > +		       this information to select ECC algorithms supported by
> > +		       the boot ROM or similar restrictions.
> > +  
> 
> Shouldn't this be a partition level option? You could conceivably do one 
> ECC type for boot area and something else for the rest of the NAND.

I tried that a long time ago [1]. The result was far from perfect. I'm
not saying it's impossible to do it, but it definitely requires a lot
of work if we want to do it properly.

Also, what about boards that are not defining their partitions in the
DT but through the command line (using mtdparts)? That means patching
the mtdparts part parser to also take the ECC setup into account.

Regards,

Boris

[1]http://lists.infradead.org/pipermail/linux-mtd/2015-July/060600.html
