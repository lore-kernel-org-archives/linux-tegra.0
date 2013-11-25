From: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3] dma: add channel request API that supports deferred probe
Date: Mon, 25 Nov 2013 13:55:09 -0800
Message-ID: <CAPcyv4i2s=CZMiggxJ+EgTnXqaKEptykRW0DVycneqPQm9e++A@mail.gmail.com>
References: <1385416039-3170-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385416039-3170-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 25, 2013 at 1:47 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> dma_request_slave_channel() simply returns NULL whenever DMA channel
> lookup fails. Lookup could fail for two distinct reasons:
>
> a) No DMA specification exists for the channel name.
>    This includes situations where no DMA specifications exist at all, or
>    other general lookup problems.
>
> b) A DMA specification does exist, yet the driver for that channel is not
>    yet registered.
>
> Case (b) should trigger deferred probe in client drivers. However, since
> they have no way to differentiate the two situations, it cannot.
>
> Implement new function dma_request_slave_channel_or_err(), which performs

Oops, one more s/_or_err/_reason/

Other than that:
Acked-by: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
