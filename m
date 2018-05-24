From: Benjamin Lindqvist <benjamin.lindqvist@endian.se>
Subject: Re: [RESEND PATCH 2/5] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Date: Thu, 24 May 2018 09:45:35 +0200
Message-ID: <CAGefG55kvShaLhNYsFznbOq0_6RNbb+eJ47DLnnU9qRRpwu-iA@mail.gmail.com>
References: <cover.1526990589.git.stefan@agner.ch> <86fdf19ec92b732709732fb60199f16488b4b727.1526990589.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86fdf19ec92b732709732fb60199f16488b4b727.1526990589.git.stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, Lucas Stach <dev@lynxeye.de>, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, Mirza Krak <mirza.krak@gmail.com>, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Stefan (and all),

First off, I apoloigize in advance if I'm deviating from common
kernel mailing list courtesy -- this is my first time responding.
I just have a comment on the NAND driver that I'd like to bring
to the public.

> +       switch (mtd->oobsize) {
> ...
> +       case 224:
> +               mtd_set_ooblayout(mtd, &tegra_nand_oob_224_ops);
> +               chip->ecc.strength = 8;
> +               chip->ecc.bytes = 18;
> +               value |= CFG_ECC_SEL | CFG_TVAL_8;
> +               break; +       case 224:

I am not sure how you arrived at this oobsize-based inference. I
have not seen any explicit relation between oob size and ECC
algorithm used in the reference manual. Indeed, the U-Boot I was
working on (a fork of the Toradex 2015.04 U-Boot) always has
oobsize == 224 but used either BCH[t=16] or RS[t=4]. In fact, we
tried choosing RS[t=8] in U-Boot but we failed to make the
BootROM decode this at all. So we had to use RS[t=4]. But
changing the algorithm did not automatically change the oobsize,
at least it didn't for us. So maybe you should consider if this
is really the way to go about deciding which algorithm is used.

Note that we're in fact using this patch set in Linux today, but
we had to remove the oobsize inference part. Currently we're
simply hard coding it to CFG_TVAL_4, but maybe it would be
cleaner to add ECC algo as a board config instead, e.g. in the
.dts file or whatever. This seems to be done by other vendors
already, see for example excerpt of
Documentation/devicetree/bindings/mtd/gpmc-nand.txt below:

 - ti,nand-ecc-opt: A string setting the ECC layout to use. One of:
"sw" 1-bit Hamming ecc code via software
"hw" <deprecated> use "ham1" instead
"hw-romcode" <deprecated> use "ham1" instead
"ham1" 1-bit Hamming ecc code
"bch4" 4-bit BCH ecc code
"bch8" 8-bit BCH ecc code
"bch16" 16-bit BCH ECC code
Refer below "How to select correct ECC scheme for your device ?"

It seems as if this method would be equally applicable to Tegra NAND.

Best regards,
Benjamin
