From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/6] mtd: rawnand: add Reed-Solomon error correction
 algorithm
Date: Tue, 12 Jun 2018 12:37:12 -0600
Message-ID: <20180612183712.GA24397@rob-hp-laptop>
References: <20180611205224.23340-1-stefan@agner.ch>
 <20180611205224.23340-2-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180611205224.23340-2-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, mark.rutland@arm.com, thierry.reding@gmail.com, dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, gaireg@gaireg.de, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 11, 2018 at 10:52:19PM +0200, Stefan Agner wrote:
> Add Reed-Solomon (RS) to the enumeration of ECC algorithms.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 2 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/raw/nand_base.c               | 1 +
>  include/linux/mtd/rawnand.h                    | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
