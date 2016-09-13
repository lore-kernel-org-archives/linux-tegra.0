From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dmaengine: squash lines for immediate return
Date: Tue, 13 Sep 2016 09:45:18 +0100
Message-ID: <3c992f57-8397-d46a-59be-55dd9457e890@nvidia.com>
References: <1473708054-30989-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473708054-30989-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 12/09/16 20:20, Masahiro Yamada wrote:
> Remove unneeded variables and assignments.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
> 
>  drivers/dma/cppi41.c          | 30 +++++-------------------------
>  drivers/dma/imx-sdma.c        | 15 ++++-----------
>  drivers/dma/ppc4xx/adma.c     | 15 ++++++---------
>  drivers/dma/tegra20-apb-dma.c |  4 +---
>  4 files changed, 16 insertions(+), 48 deletions(-)

...

> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 6ab9eb9..89795a2 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -337,9 +337,7 @@ static struct tegra_dma_sg_req *tegra_dma_sg_req_get(
>  	}
>  	spin_unlock_irqrestore(&tdc->lock, flags);
>  
> -	sg_req = kzalloc(sizeof(struct tegra_dma_sg_req), GFP_NOWAIT);
> -
> -	return sg_req;
> +	return kzalloc(sizeof(struct tegra_dma_sg_req), GFP_NOWAIT);
>  }
>  
>  static int tegra_dma_slave_config(struct dma_chan *dc,

For the Tegra bit ...

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
