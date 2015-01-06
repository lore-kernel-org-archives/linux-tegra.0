From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: rely on bootloader pinmux programming
 on nyan-big
Date: Tue, 06 Jan 2015 10:09:04 -0700
Message-ID: <54AC16B0.5050703@wwwdotorg.org>
References: <1420540653-14816-1-git-send-email-tomeu.vizoso@collabora.com> <1420540653-14816-2-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420540653-14816-2-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/06/2015 03:37 AM, Tomeu Vizoso wrote:
> Following 6dbaff2b, the kernel expects that the bootloader has correctly
> programmed the Tegra pinmux.
>
> DTs for the Jetson and the Venice2 had been updated already but this one
> was left behind.

So this setup is true for NVIDIA-controlled development/reference boards 
where we've ensured that the bootloader sets up 100% of the pinmux.

However, I know that Coreboot on this board doesn't set up everything in 
the pinmux, and since it's in r/o flash never will. As such, I'm not 
sure this change is safe for this board. That is, unless you want to 
force upstream kernels to be booted via a chain-loaded path: Coreboot 
(r/o) -> U-Boot (r/w with full pinmux setup) -> kernel.

> Have tested this with the stock vendor firmware (coreboot) and have found no
> issues.

There are presumably a bunch of features which aren't yet supported 
upstream, and hence you couldn't test though? That means we might find 
that parts of the pinmux aren't yet programmed but need to be to enable 
those features.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
