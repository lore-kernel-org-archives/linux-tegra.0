From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 2/2] dmaengine: tegra-adma: Add support for Tegra210 ADMA
Date: Tue, 06 Oct 2015 11:32:35 +0200
Message-ID: <16524792.BmEijCQ1oc@wuerfel>
References: <1444047007-30494-1-git-send-email-jonathanh@nvidia.com> <1444047007-30494-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444047007-30494-3-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Monday 05 October 2015 13:10:07 Jon Hunter wrote:
> Add support for the Tegra210 Audio DMA controller that is used for
> transferring data between system memory and the Audio sub-system.
> The driver only supports cyclic transfers because this is being solely
> used for audio.
> 
> This driver is based upon the work by Dara Ramesh <dramesh@nvidia.com>.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

This version looks much better!

Just one small comment:

> +	slave_req = dma_spec->args[0];
> +	slave_dir = dma_spec->args[1];
> +
> +	if (slave_req == 0)
> +		return NULL;
> +
> +	switch (slave_dir) {
> +	case ADMA_AHUB_TO_MEM:
> +		if (slave_req > tdma->rx_requests)
> +			return NULL;
> +
> +		if (tdma->rx_requests_reserved & BIT(slave_req))
> +			return NULL;
> +
> +		tdma->rx_requests_reserved |= BIT(slave_req);
> +		break;

The rx_requests_reserved logic looks racy, if you have more than
one concurrent request or release. Better use atomic_test_and_set()
here and turn the variable into an atomic_t.

	Arbd
