From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [GIT PULL 1/4] clk: tegra: Changes for v4.4-rc1
Date: Tue, 20 Oct 2015 09:14:14 -0700
Message-ID: <20151020161414.20687.98536@quantum>
References: <1445347058-8834-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445347058-8834-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2015-10-20 06:17:35)
> Hi Mike, Stephen,
> 
> The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:
> 
>   Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.4-clk

Pulled.

Regards,
Mike

> 
> for you to fetch changes up to 88d909bedf4df7285d6e8d8730425df0d163512e:
> 
>   clk: tegra: Modify tegra_audio_clk_init to accept more plls (2015-10-20 13:56:55 +0200)
> 
> ----------------------------------------------------------------
> clk: tegra: Changes for v4.4-rc1
> 
> This contains a patch that allows the DFLL to use clock rates higher
> than 2^31-1 Hz by using the ->determine_rate() operation instead of the
> ->round_rate() operation. Other than that there's a couple of cleanups
> in preparation for Tegra210 support.
> 
> ----------------------------------------------------------------
> Mikko Perttunen (1):
>       clk: tegra: Unlock top rates for Tegra124 DFLL clock
> 
> Rhyland Klein (2):
>       clk: tegra: Fix comments for structure definitions
>       clk: tegra: Modify tegra_audio_clk_init to accept more plls
> 
> Thierry Reding (2):
>       clk: tegra: dfll: Monitor code is DEBUG_FS only
>       clk: tegra: Update struct tegra_clk_pll_params kerneldoc
> 
>  drivers/clk/tegra/clk-dfll.c        | 114 ++++++++++++++++++------------------
>  drivers/clk/tegra/clk-tegra-audio.c |  25 +++++---
>  drivers/clk/tegra/clk-tegra114.c    |   8 ++-
>  drivers/clk/tegra/clk-tegra124.c    |   8 ++-
>  drivers/clk/tegra/clk-tegra30.c     |   8 ++-
>  drivers/clk/tegra/clk.h             | 106 +++++++++++++++++++++------------
>  drivers/clk/tegra/cvb.c             |   7 ---
>  7 files changed, 163 insertions(+), 113 deletions(-)
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
