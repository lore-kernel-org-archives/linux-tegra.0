From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v8 2/6] mtd: rawnand: add an option to specify NAND chip
 as a boot device
Date: Mon, 25 Jun 2018 08:47:52 -0600
Message-ID: <20180625144752.GA19064@rob-hp-laptop>
References: <20180624212727.21672-1-stefan@agner.ch>
 <20180624212727.21672-3-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180624212727.21672-3-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, mark.rutland@arm.com, thierry.reding@gmail.com, dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, gaireg@gaireg.de, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Jun 24, 2018 at 11:27:23PM +0200, Stefan Agner wrote:
> Allow to define a NAND chip as a boot device. This can be helpful
> for the selection of the ECC algorithm and strength in case the boot
> ROM supports only a subset of controller provided options.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 4 ++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/raw/nand_base.c               | 3 +++
>  include/linux/mtd/rawnand.h                    | 6 ++++++
>  3 files changed, 13 insertions(+)
