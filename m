From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v6 11/16] dmaengine: tegra-apb: Keep clock enabled only
 during of DMA transfer
Date: Fri, 31 Jan 2020 09:05:41 +0000
Message-ID: <1b7dd052-20f0-7b38-9578-44967eca1770@nvidia.com>
References: <20200130043804.32243-1-digetx@gmail.com>
 <20200130043804.32243-12-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200130043804.32243-12-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 30/01/2020 04:37, Dmitry Osipenko wrote:
> It's a bit impractical to enable hardware's clock at the time of DMA
> channel's allocation because most of DMA client drivers allocate DMA
> channel at the time of the driver's probing, and thus, DMA clock is kept
> always-enabled in practice, defeating the whole purpose of runtime PM.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/dma/tegra20-apb-dma.c | 47 ++++++++++++++++++++++++-----------
>  1 file changed, 32 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 22b88ccff05d..0ee28d8e3c96 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -436,6 +436,8 @@ static void tegra_dma_stop(struct tegra_dma_channel *tdc)
>  		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
>  	}
>  	tdc->busy = false;
> +
> +	pm_runtime_put(tdc->tdma->dev);

There are only 3 places where tegra_dma_stop is called, does it simplify
the code if we move the pm_runtime_put() outside of tegra_dma_stop? In
other words, everywhere there is a tegra_dma_stop, afterwards we then
call pm_runtime_put?

This would allow us to get rid of the extra pm_runtime_get in
terminate_all.

Jon

-- 
nvpublic
