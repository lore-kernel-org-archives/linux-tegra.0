From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 3/8] ARM: tegra: RAM code access for v4.2-rc1
Date: Wed, 13 May 2015 17:58:38 +0200
Message-ID: <2345639.Sj7e0cAmhK@wuerfel>
References: <1431524980-13599-1-git-send-email-thierry.reding@gmail.com> <1431524980-13599-4-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431524980-13599-4-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 13 May 2015 15:49:35 Thierry Reding wrote:
> Note that this is a shared dependency for the tegra-for-4.2-clk and the
> tegra-for-4.2-emc pull requests and they are already based on this, so
> it's sufficient if you pull those in individually.
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> ARM: tegra: RAM code access for v4.2-rc1
> 
> The RAM code is used by the memory and external memory controllers to
> determine which set of timings to use for memory frequency scaling.
> 

I've pulled it into next/drivers separately for documentation purposes,
even if it's not strictly necessary as you say. Thanks!

	Arnd
