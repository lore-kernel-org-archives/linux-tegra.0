From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v2 0/5] Per-user clock constraints
Date: Wed, 09 Jul 2014 22:16:29 +0200
Message-ID: <53BDA31D.40502@gmail.com>
References: <1404398323-18934-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404398323-18934-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, rabin-66gdRtMMWGc@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Tomeu,

On 03.07.2014 16:38, Tomeu Vizoso wrote:
> Hello,
> 
> here is another round for commenting, not very different from the first one.
> 
> Something I forgot to mention before is that the function rename was performed
> by the scripts in:
> 
> http://cgit.collabora.com/git/user/tomeu/linux.git/commit/?h=clk-refactoring-4&id=0e983e28864229f2cd525f87d59e034c4876b233
> 
> As before, I have only checked that drivers/clk/ builds with allyesconfig, and
> that a kernel can be built for tegra_defconfig.

This is quite an interesting series. I have reviewed two of five patches
and have plans to look at remaining ones, however here are few general
issues I'd like to raise:

- somehow I don't see patch 2/5 on LAKML. Too big?

- I see the series changing particular clock drivers. A good practice
would be to Cc respective driver maintainers to take a look at those
changes.

- please make sure that all the patches don't have checkpatch errors or
significant warnings.

Will try (myself or by asking someone else) to do some testing on
Samsung platforms.

Best regards,
Tomasz
