From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V3] dma: tegra: register as an OF DMA controller
Date: Wed, 4 Dec 2013 02:34:09 +0100
Message-ID: <201312040234.09708.arnd@arndb.de>
References: <1386102787-21839-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386102787-21839-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tuesday 03 December 2013, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Call of_dma_controller_register() so that DMA clients can look up the
> Tegra DMA controller using standard APIs. This requires the of_xlate()
> function to save off the DMA slave ID, and for tegra_dma_slave_config()
> not to over-write this information; once DMA client drivers are converted
> to dma_request_slave_channel() and DT-based lookups, they won't set this
> field of struct dma_slave_config anymore.
> 
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Looks great to me.

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

but see my comments about the dma_get_any_slave_channel. If we want to merge
that function with the existing dma_get_slave_channel function (and change
the three existing users of that one), one line here will of course have
to change.

Also, one (long-running, not just for this driver) comment I have is
about this snippet:

> @@ -340,6 +342,8 @@ static int tegra_dma_slave_config(struct dma_chan *dc,
>         }
>  
>         memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
> +       if (!tdc->slave_id)
> +               tdc->slave_id = sconfig->slave_id;
>         tdc->config_init = true;
>         return 0;
>  }

We really need to be better at having a common set of rules regarding what
it actually means to set the slave_id through dma_slave_config(). IMHO
we should just treat it as a bug for any dmaengine driver that is configured
through DT, or we should get rid of this entirely. Looking through the
code now, I only see two dmaengine drivers that actually do this: one is 
the tegra driver (which you are about to change), the other one is shdma,
and that one is already a bit special. Any ideas?

	Arnd
