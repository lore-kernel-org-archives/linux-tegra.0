From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [RESEND PATCH 2/5] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Date: Thu, 24 May 2018 13:07:31 +0200
Message-ID: <20180524130731.0c00094d@bbrezillon>
References: <cover.1526990589.git.stefan@agner.ch>
        <86fdf19ec92b732709732fb60199f16488b4b727.1526990589.git.stefan@agner.ch>
        <CAGefG55kvShaLhNYsFznbOq0_6RNbb+eJ47DLnnU9qRRpwu-iA@mail.gmail.com>
        <d8d6cb9fcd8ce7ea5c13b227012de6d2@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d8d6cb9fcd8ce7ea5c13b227012de6d2@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Benjamin Lindqvist <benjamin.lindqvist@endian.se>, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, Lucas Stach <dev@lynxeye.de>, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, Mirza Krak <mirza.krak@gmail.com>, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 24 May 2018 13:00:41 +0200
Stefan Agner <stefan@agner.ch> wrote:

> 
> > 
> > Note that we're in fact using this patch set in Linux today, but
> > we had to remove the oobsize inference part. Currently we're
> > simply hard coding it to CFG_TVAL_4, but maybe it would be
> > cleaner to add ECC algo as a board config instead, e.g. in the
> > .dts file or whatever. This seems to be done by other vendors
> > already, see for example excerpt of
> > Documentation/devicetree/bindings/mtd/gpmc-nand.txt below:
> > 
> >  - ti,nand-ecc-opt: A string setting the ECC layout to use. One of:
> > "sw" 1-bit Hamming ecc code via software
> > "hw" <deprecated> use "ham1" instead
> > "hw-romcode" <deprecated> use "ham1" instead
> > "ham1" 1-bit Hamming ecc code
> > "bch4" 4-bit BCH ecc code
> > "bch8" 8-bit BCH ecc code
> > "bch16" 16-bit BCH ECC code
> > Refer below "How to select correct ECC scheme for your device ?"
> > 
> > It seems as if this method would be equally applicable to Tegra NAND.  
> 
> Yeah, ideally we can reuse "nand-ecc-algo". Although, Reed-Solomon is
> not yet in the list.  So using this property would require to extend
> this standard property.

I'm okay with that ;-).
