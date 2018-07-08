From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: tegra: check bounds of die_nr properly
Date: Sun, 8 Jul 2018 23:51:31 +0200
Message-ID: <20180708235131.348f95f9@xps13>
References: <20180704091310.22003-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704091310.22003-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, dan.carpenter@oracle.com, dev@lynxeye.de, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, mirza.krak@gmail.com, gaireg@gaireg.de, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Stefan,

Stefan Agner <stefan@agner.ch> wrote on Wed,  4 Jul 2018 11:13:10 +0200:

> The Tegra driver currently only support a single chip select, hence
> check boundaries accordingly. This fixes a off by one issue catched
> with Smatch:
>     drivers/mtd/nand/raw/tegra_nand.c:476 tegra_nand_select_chip()
>     warn: array off by one? 'nand->cs[die_nr]'
> 
> Also warn in case the stack asks for a chip select we currently do
> not support.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---

Applied to nand/next.

Thanks,
Miquèl
