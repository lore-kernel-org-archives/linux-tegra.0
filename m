From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 4/6] dmaengine: tegra-apb: Only save channel state for
 those in use
Date: Mon, 9 Nov 2015 15:58:51 +0200
Message-ID: <CAHp75Ve77TVmc6TE-mDRvH3_jbKZvzYv0dj7WOXF0mRFa=JErg@mail.gmail.com>
References: <1447075429-27311-1-git-send-email-jonathanh@nvidia.com>
	<1447075429-27311-5-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447075429-27311-5-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 9, 2015 at 3:23 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Currently the tegra-apb DMA driver suspend/resume helpers, save and
> restore the registers for all channels regardless of whether they are
> in use or not. Change this so that only channels that have been
> allocated and configured are saved and restored.

Nitpick

> +               /*
> +                * Only save the state of DMA channels that are in use.
> +                */

One line?

> +               /*
> +                * Only restore the state of DMA channels that are in use.
> +                */

Same.

-- 
With Best Regards,
Andy Shevchenko
