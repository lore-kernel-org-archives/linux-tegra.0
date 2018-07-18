From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: rawnand: tegra: check bounds of die_nr properly
Date: Wed, 18 Jul 2018 09:45:44 +0200
Message-ID: <20180718094544.76607c0f@xps13>
References: <20180717084618.25249-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717084618.25249-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, boris.brezillon@bootlin.com, dev@lynxeye.de, mirza.krak@gmail.com, benjamin.lindqvist@endian.se, krzk@kernel.org, marek.vasut@gmail.com, richard@nod.at, digetx@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org, dan.carpenter@oracle.com, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Marcel,

Marcel Ziswiler <marcel@ziswiler.com> wrote on Tue, 17 Jul 2018
10:46:18 +0200:

> From: Stefan Agner <stefan@agner.ch>
> 
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
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Applied on nand/next in place of the previous one (with my SoB after
yours).

Thanks,
Miquèl
