From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v6 4/6] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Date: Fri, 22 Jun 2018 00:01:28 +0200
Message-ID: <20180622000128.3ea45ef7@bbrezillon>
References: <20180621203145.7628-1-stefan@agner.ch>
        <20180621203145.7628-5-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180621203145.7628-5-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com, gaireg@gaireg.de, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Stefan,

On Thu, 21 Jun 2018 22:31:43 +0200
Stefan Agner <stefan@agner.ch> wrote:

> Add support for the NAND flash controller found on NVIDIA
> Tegra 2 SoCs. This implementation does not make use of the
> command queue feature. Regular operations using ->exec_op()
> use PIO mode for data transfers. Raw, ECC and OOB read/writes
> make use of the DMA mode for data transfer.
> 
> Signed-off-by: Lucas Stach <dev@lynxeye.de>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  MAINTAINERS                       |    7 +
>  drivers/mtd/nand/raw/Kconfig      |    6 +
>  drivers/mtd/nand/raw/Makefile     |    1 +
>  drivers/mtd/nand/raw/tegra_nand.c | 1225 +++++++++++++++++++++++++++++
>  4 files changed, 1239 insertions(+)
>  create mode 100644 drivers/mtd/nand/raw/tegra_nand.c

I think we're almost good. No big issues spotted in this version.
Can you fix the CHECKs/WARNINGs reported by checkpatch --strict (most
of them are valid)?

> +
> +static int tegra_nand_remove(struct platform_device *pdev)
> +{
> +	struct tegra_nand_controller *ctrl = platform_get_drvdata(pdev);
> +
> +	nand_release(nand_to_mtd(ctrl->chip));

Use mtd_device_unregister() + nand_cleanup() instead of nand_release().
nand_release() is broken in that it does not check the return code of
mtd_device_unregister() before calling nand_cleanup(), and does not
propagate mtd_device_unregister() ret code to its caller. 

> +
> +	clk_disable_unprepare(ctrl->clk);
> +
> +	return 0;
> +}

Thanks for the great work you've done! Yay, another driver implementing
->exec_op()!

Boris
