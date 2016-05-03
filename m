From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [GIT PULL] clk: tegra: Changes for v4.7-rc1
Date: Mon, 2 May 2016 17:02:48 -0700
Message-ID: <20160503000248.GB3492@codeaurora.org>
References: <1461945596-24090-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461945596-24090-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/29, Thierry Reding wrote:
> Hi Michael, Stephen,
> 
> The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:
> 
>   Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.7-clk
> 
> for you to fetch changes up to 2690e912644e610854c4c3b23d0a0daec9d030ca:
> 
>   clk: tegra: dfll: Reformat CVB frequency table (2016-04-28 12:41:54 +0200)
> 
> Note that the first patch is this pull request is a dependency for a
> larger series that will have to go in through the ARM-SoC tree in order
> to properly handle the dependencies.
> 

Thanks. Pulled.

Are there any thoughts on making that hw control stuff more
generic? Perhaps using something like power domains to do that
instead of having drivers cross-call to the clk driver with
custom tegra APIs?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
