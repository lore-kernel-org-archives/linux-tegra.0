From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v1 3/7] dmaengine: tegra-apb: Prevent race conditions on
 channel's freeing
Date: Mon, 30 Dec 2019 21:45:55 +0100
Message-ID: <20191230204555.GB24135@qmqm.qmqm.pl>
References: <20191228204640.25163-1-digetx@gmail.com>
 <20191228204640.25163-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191228204640.25163-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Dec 28, 2019 at 11:46:36PM +0300, Dmitry Osipenko wrote:
> It's unsafe to check the channel's "busy" state without taking a lock,
> it is also unsafe to assume that tasklet isn't in-fly.

'in-flight'. Also, the patch seems to have two independent bug-fixes
in it. Second one doesn't look right, at least not without an explanation.

First:

> -	if (tdc->busy)
> -		tegra_dma_terminate_all(dc);
> +	tegra_dma_terminate_all(dc);

Second:

> +	tasklet_kill(&tdc->tasklet);
>  
>  	spin_lock_irqsave(&tdc->lock, flags);
>  	list_splice_init(&tdc->pending_sg_req, &sg_req_list);
> @@ -1543,7 +1543,6 @@ static int tegra_dma_probe(struct platform_device *pdev)
>  		struct tegra_dma_channel *tdc = &tdma->channels[i];
>  
>  		free_irq(tdc->irq, tdc);
> -		tasklet_kill(&tdc->tasklet);
>  	}
>  
>  	pm_runtime_disable(&pdev->dev);
> @@ -1563,7 +1562,6 @@ static int tegra_dma_remove(struct platform_device *pdev)
>  	for (i = 0; i < tdma->chip_data->nr_channels; ++i) {
>  		tdc = &tdma->channels[i];
>  		free_irq(tdc->irq, tdc);
> -		tasklet_kill(&tdc->tasklet);
>  	}
>  
>  	pm_runtime_disable(&pdev->dev);

Best Regards,
Micha³ Miros³aw
