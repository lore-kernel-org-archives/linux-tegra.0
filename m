From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: firmware: enable Trusted Foundations by default
Date: Wed, 22 Jan 2014 13:42:40 -0700
Message-ID: <52E02D40.3090803@wwwdotorg.org>
References: <1390299016-14105-1-git-send-email-acourbot@nvidia.com> <1390299016-14105-4-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390299016-14105-4-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/21/2014 03:10 AM, Alexandre Courbot wrote:
> As discussed previously (https://lkml.org/lkml/2013/11/26/289), enable
> Trusted Foundation support by default since it already depends on a
> supporting architecture being selected.
> 
> Doing so allows us to remove it from tegra_defconfig.

>  arch/arm/configs/tegra_defconfig | 1 -
>  arch/arm/firmware/Kconfig        | 1 +

Can we split out the defconfig and code changes into separate patches?
They need to go through seperate branches, possibly even separate repos.

The defconfig change might not even be necessary; at some point I'll
just rebuild it via "make tegra_defconfig; make savedefconfig" on top of
some linux-next that includes the Kconfig change, and it'll happen
automatically. Still, I guess there's no harm explicitly sending the patch.
