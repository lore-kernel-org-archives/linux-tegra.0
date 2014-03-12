From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] pinctrl: tegra: dynamically calculate function list
 of groups
Date: Wed, 12 Mar 2014 15:26:57 +0100
Message-ID: <CACRpkdb5DQ4qm+d3HzJD5wr6ttJdXCb=khumQhU4ebWPvRpjZg@mail.gmail.com>
References: <1394220137-16351-1-git-send-email-swarren@wwwdotorg.org>
	<1394220137-16351-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394220137-16351-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 7, 2014 at 8:22 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The per-SoC data structures for Tegra pinctrl stored some information
> in a redundant way. Specifically, the list of groups that each function
> could be muxed onto was stored once explicitly, and also as part of the
> definition of each group. Eliminate this redundancy, and calculate each
> function's list of valid groups at pinctrl probe time. This removes
> thousands of lines of code from the pinctrl driver and ~16K from the
> vmlinux binary size, and adds only about 500uS to the boot process (on
> Tegra30; newer SoCs will likely be faster still).
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pinctrl/pinctrl-tegra.c    |   38 ++
>  drivers/pinctrl/pinctrl-tegra.h    |    4 +-
>  drivers/pinctrl/pinctrl-tegra114.c |  931 +--------------------------
>  drivers/pinctrl/pinctrl-tegra124.c | 1102 +-------------------------------
>  drivers/pinctrl/pinctrl-tegra20.c  |  627 +-----------------
>  drivers/pinctrl/pinctrl-tegra30.c  | 1242 +-----------------------------------
>  6 files changed, 44 insertions(+), 3900 deletions(-)

You got to love that diffstat.

Excellent patch Stephen, applied.

Yours,
Linus Walleij
