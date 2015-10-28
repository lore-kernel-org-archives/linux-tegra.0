From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V3 2/2] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Wed, 28 Oct 2015 13:17:24 +0000
Message-ID: <5630CAE4.4060103@nvidia.com>
References: <1444980919-20331-1-git-send-email-jonathanh@nvidia.com>
 <1444980919-20331-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444980919-20331-3-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 16/10/15 08:35, Jon Hunter wrote:
> Add support for the Tegra210 Audio DMA controller that is used for
> transferring data between system memory and the Audio sub-system.
> The driver only supports cyclic transfers because this is being solely
> used for audio.
> 
> This driver is based upon the work by Dara Ramesh <dramesh@nvidia.com>.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/dma/Kconfig         |  13 +
>  drivers/dma/Makefile        |   1 +
>  drivers/dma/tegra210-adma.c | 909 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 923 insertions(+)
>  create mode 100644 drivers/dma/tegra210-adma.c

[snip]

> +#ifdef CONFIG_PM_SLEEP
> +static int tegra_adma_pm_suspend(struct device *dev)
> +{
> +	return pm_runtime_suspended(dev);
> +}
> +#endif

The above is also wrong. I will fix this up as well.

Jon
