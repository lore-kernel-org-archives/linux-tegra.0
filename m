From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [GIT PULL 4/8] clk: tegra: Changes for v4.2-rc1
Date: Wed, 20 May 2015 12:54:59 -0700
Message-ID: <20150520195459.GU31753@codeaurora.org>
References: <1431524980-13599-1-git-send-email-thierry.reding@gmail.com>
 <1431524980-13599-5-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431524980-13599-5-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/13, Thierry Reding wrote:
> Hi Mike, Stephen,
> 
> The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:
> 
>   Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.2-clk
> 
> for you to fetch changes up to 36b7be6d3ea8f434f1e0723f3fb0e85c3e00ebc2:
> 
>   clk: tegra: Fix hda2codec_2x clock name for Tegra30 (2015-05-13 15:17:14 +0200)
> 
> I've based this pull request on top of the tegra-for-4.2-ramcode pull
> request, so pulling only this one should be sufficient to resolve the
> dependency.
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> clk: tegra: Changes for v4.2-rc1
> 
> This contains the EMC clock driver that's been exhaustively reviewed and
> tested. It also includes a change to the clock core that allows a clock
> provider to perform low-level reparenting of clocks. This is required by
> the EMC clock driver because the reparenting needs to be done at a very
> specific point in time during the EMC frequency switch.

Can someone please describe why we need to do software
reparenting at a specific point in time during a frequency
switch? I must have missed out on the conversation somewhere and
looking at the commit that introduces the function, the argument
for why the API is exposed:

      To be used by clock implementations for switching to a new
      parent during rate change.

is lacking in any details about *why* we need it.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
