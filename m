From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra210-adma: Fix an error handling path in
 'tegra_adma_probe()'
Date: Mon, 18 May 2020 12:43:16 +0100
Message-ID: <899a62c8-b4fa-b1cc-6e3a-bbfb680e5d41@nvidia.com>
References: <20200516214205.276266-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200516214205.276266-1-christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 16/05/2020 22:42, Christophe JAILLET wrote:
> Commit b53611fb1ce9 ("dmaengine: tegra210-adma: Fix crash during probe")
> has moved some code in the probe function and reordered the error handling
> path accordingly.
> However, a goto has been missed.
> 
> Fix it and goto the right label if 'dma_async_device_register()' fails, so
> that all resources are released.
> 
> Fixes: b53611fb1ce9 ("dmaengine: tegra210-adma: Fix crash during probe")
> Signed-off-by: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
> ---
>  drivers/dma/tegra210-adma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
> index c4ce5dfb149b..db58d7e4f9fe 100644
> --- a/drivers/dma/tegra210-adma.c
> +++ b/drivers/dma/tegra210-adma.c
> @@ -900,7 +900,7 @@ static int tegra_adma_probe(struct platform_device *pdev)
>  	ret = dma_async_device_register(&tdma->dma_dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "ADMA registration failed: %d\n", ret);
> -		goto irq_dispose;
> +		goto rpm_put;
>  	}
>  
>  	ret = of_dma_controller_register(pdev->dev.of_node,


Thanks for fixing this!

Reviewed-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
