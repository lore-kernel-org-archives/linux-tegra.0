From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: tegra: do not set transfer desc flag to DMA_CTRL_ACK
 in cyclic mode
Date: Fri, 22 Jun 2012 11:10:25 -0600
Message-ID: <4FE4A701.1040303@wwwdotorg.org>
References: <1340365364-16276-1-git-send-email-ldewangan@nvidia.com> <1340365364-16276-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340365364-16276-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/22/2012 05:42 AM, Laxman Dewangan wrote:
> The sound dmaengine pcm driver uses the dma in cyclic mode and
> it does not ack the transfer descriptor  after transfer stops.
> This may lead to hold that desc in chip's dma driver and does
> not allow to reuse/free that descriptors. Hence not enabling
> flag DMA_CTRL_ACK when dma runs in cyclic mode.

> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> @@ -1093,7 +1093,7 @@ struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
> -	dma_desc->txd.flags = DMA_CTRL_ACK;
> +	dma_desc->txd.flags = 0;

I honestly have no idea about this one. If the dmaengine maintainers
think it's semantically correct, I have no objections.
