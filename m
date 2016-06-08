From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 7/8] dmaengine: tegra20-apb-dma: Only calculate residue if
 txstate exists.
Date: Wed, 8 Jun 2016 09:51:57 +0100
Message-ID: <5757DCAD.1090106@nvidia.com>
References: <1465321121-22238-1-git-send-email-peter.griffin@linaro.org>
 <1465321121-22238-8-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465321121-22238-8-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org, zw-aYo+Mbtxn2uXDw4h08c5KA@public.gmane.org, baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

On 07/06/16 18:38, Peter Griffin wrote:
> There is no point calculating the residue if there is
> no txstate to store the value.
> 
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 01e316f..7f4af8c 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -814,7 +814,7 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
>  	unsigned int residual;
>  
>  	ret = dma_cookie_status(dc, cookie, txstate);
> -	if (ret == DMA_COMPLETE)
> +	if (ret == DMA_COMPLETE || !txstate)
>  		return ret;

Thanks for reporting this. I agree that we should not do this, however, 
looking at the code for Tegra, I am wondering if this could change the
actual state that is returned. Looking at dma_cookie_status() it will
call dma_async_is_complete() which will return either DMA_COMPLETE or
DMA_IN_PROGRESS. It could be possible that the actual state for the
DMA transfer in the tegra driver is DMA_ERROR, so I am wondering if we
should do something like the following  ...

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 01e316f73559..45edab7418d0 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -822,13 +822,8 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
        /* Check on wait_ack desc status */
        list_for_each_entry(dma_desc, &tdc->free_dma_desc, node) {
                if (dma_desc->txd.cookie == cookie) {
-                       residual =  dma_desc->bytes_requested -
-                                       (dma_desc->bytes_transferred %
-                                               dma_desc->bytes_requested);
-                       dma_set_residue(txstate, residual);
                        ret = dma_desc->dma_status;
-                       spin_unlock_irqrestore(&tdc->lock, flags);
-                       return ret;
+                       goto found;
                }
        }
 
@@ -836,17 +831,23 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
        list_for_each_entry(sg_req, &tdc->pending_sg_req, node) {
                dma_desc = sg_req->dma_desc;
                if (dma_desc->txd.cookie == cookie) {
-                       residual =  dma_desc->bytes_requested -
-                                       (dma_desc->bytes_transferred %
-                                               dma_desc->bytes_requested);
-                       dma_set_residue(txstate, residual);
                        ret = dma_desc->dma_status;
-                       spin_unlock_irqrestore(&tdc->lock, flags);
-                       return ret;
+                       goto found;
                }
        }
 
-       dev_dbg(tdc2dev(tdc), "cookie %d does not found\n", cookie);
+       dev_warn(tdc2dev(tdc), "cookie %d not found\n", cookie);
+       spin_unlock_irqrestore(&tdc->lock, flags);
+       return ret;
+
+found:
+       if (txstate) {
+               residual = dma_desc->bytes_requested -
+                          (dma_desc->bytes_transferred %
+                           dma_desc->bytes_requested);
+               dma_set_residue(txstate, residual);
+       }
+
        spin_unlock_irqrestore(&tdc->lock, flags);
        return ret;
 }

Cheers
Jon

-- 
nvpublic
