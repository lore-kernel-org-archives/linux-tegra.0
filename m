From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: defconfig fixes
Date: Mon, 20 May 2013 23:51:13 -0700
Message-ID: <20130521065113.GJ20453@quad.lixom.net>
References: <1369076839-31787-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1369076839-31787-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 20, 2013 at 01:07:19PM -0600, Stephen Warren wrote:
> From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> The AK8975 Kconfig option was renamed during the 3.10 merge window.
> Adjust tegra_defconfig to enable the new name, so it's not missing
> useful features.
> 
> Tegra DRM support used to be enabled in the default Tegra configuration,
> but it now depends on CONFIG_TEGRA_HOST1X which is disabled by default.
> Enable CONFIG_TEGRA_HOST1X so that DRM support is compiled in again.
> 
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> [swarren, squashed Alex's and my changes together]
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Olof, Arnd,
> 
> Can this be taken into 3.10? Hopefully Linus won't mind defconfig changes
> sneaking in now. If not, let me know, and I'll for it into Tegra's
> for-3.11/dt branch instead. Thanks.

Since people actually use the defconfigs it does make sense to keep them
working and regression-free.

I think we'll be fine with a rare occurrance of it. We'll find out. :)



-Olof
