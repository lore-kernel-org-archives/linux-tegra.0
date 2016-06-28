From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 7/8] dmaengine: tegra20-apb-dma: Only calculate residue
 if txstate exists.
Date: Tue, 28 Jun 2016 09:34:02 +0530
Message-ID: <20160628040402.GP22564@localhost>
References: <1465321121-22238-1-git-send-email-peter.griffin@linaro.org>
 <1465321121-22238-8-git-send-email-peter.griffin@linaro.org>
 <5757DCAD.1090106@nvidia.com>
 <20160621160139.GC16910@localhost>
 <57697736.4050008@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57697736.4050008-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org, zw-aYo+Mbtxn2uXDw4h08c5KA@public.gmane.org, baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jun 21, 2016 at 06:19:50PM +0100, Jon Hunter wrote:
> 
> On 21/06/16 17:01, Vinod Koul wrote:
> > On Wed, Jun 08, 2016 at 09:51:57AM +0100, Jon Hunter wrote:
> >> Hi Peter,
> >>
> >> On 07/06/16 18:38, Peter Griffin wrote:
> >>> There is no point calculating the residue if there is
> >>> no txstate to store the value.
> >>>
> >>> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>> ---
> >>>  drivers/dma/tegra20-apb-dma.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> >>> index 01e316f..7f4af8c 100644
> >>> --- a/drivers/dma/tegra20-apb-dma.c
> >>> +++ b/drivers/dma/tegra20-apb-dma.c
> >>> @@ -814,7 +814,7 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
> >>>  	unsigned int residual;
> >>>  
> >>>  	ret = dma_cookie_status(dc, cookie, txstate);
> >>> -	if (ret == DMA_COMPLETE)
> >>> +	if (ret == DMA_COMPLETE || !txstate)
> >>>  		return ret;
> >>
> >> Thanks for reporting this. I agree that we should not do this, however, 
> >> looking at the code for Tegra, I am wondering if this could change the
> >> actual state that is returned. Looking at dma_cookie_status() it will
> >> call dma_async_is_complete() which will return either DMA_COMPLETE or
> >> DMA_IN_PROGRESS. It could be possible that the actual state for the
> >> DMA transfer in the tegra driver is DMA_ERROR, so I am wondering if we
> >> should do something like the following  ...
> > 
> > This one is stopping code execution when residue is not valid. Do notice
> > that it check for DMA_COMPLETE OR txstate. In other cases, wit will return
> > 'that' state when txstate is NULL.
> 
> Sorry what do you mean by "this one"?

the patch

> 
> My point is that if the status is not DMA_COMPLETE, then it is possible
> that it could be DMA_ERROR (for tegra that is). 

right it can be any state... and we check for only DMA_COMPLETE as residue
has no meaning.

> However,
> dma_cookie_status will only return DMA_IN_PROGRESS or DMA_COMPLETE and
> so if 'txstate' is NULL we will not see the DMA_ERROR status anymore and
> just think it is in progress when it is actually an error.

Yes that is an existing issue, if you are reporting DMA_ERROR then you
should add a check for DMA_ERROR as well and not do residue calculation for
that case.

> 
> I do agree that the driver is broken as we are not checking for
> !txstate, but this also changes the behaviour a bit.

It changes for better and not worse. Btw pls feel free to send a patch
handling DMA_ERROR :)

-- 
~Vinod
