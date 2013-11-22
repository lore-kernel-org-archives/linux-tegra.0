From: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 11/31] dma: add channel request API that supports deferred probe
Date: Fri, 22 Nov 2013 15:50:24 -0800
Message-ID: <CAPcyv4iL8LSXfpfAugCAVK11A5fvJ4kYZXneNC6V5HZeTRY+4g@mail.gmail.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
	<1384548866-13141-12-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384548866-13141-12-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A question about the patch:

On Fri, Nov 15, 2013 at 12:54 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[..]
> diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
> index 0b88dd3d05f4..928141f6f21b 100644
> --- a/drivers/dma/of-dma.c
> +++ b/drivers/dma/of-dma.c
> @@ -181,11 +181,13 @@ struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
>
>                 of_node_put(dma_spec.np);
>
> +               if (!ofdma && defer)
> +                       return ERR_PTR(-EPROBE_DEFER);
>                 if (chan)
>                         return chan;
>         }

Why do we need to make this conditional on the value of 'defer'?  If
the client cares it will propagate the error if it does not care then
nothing is gained by converting this to -ENODEV.
