From: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [GIT PULL] clk/tegra: Changes for v4.1-rc1
Date: Fri, 10 Apr 2015 18:07:11 -0700
Message-ID: <20150411010711.19585.5769@quantum>
References: <1428675319-23049-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428675319-23049-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2015-04-10 07:15:19)
> Mike, Stephen,
> 
> The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:
> 
>   Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/clk/for-4.1

Thierry,

Pulled!

Regards,
Mike

> 
> for you to fetch changes up to c1d676cec572544616273d5853cb7cc38fbaa62b:
> 
>   clk: tegra: Use the proper parent for plld_dsi (2015-04-10 16:04:22 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> clk/tegra: Changes for v4.1-rc1
> 
> These are mostly cleanups that I've been carrying in my local tree for
> far too long. In addition to those, there are some preparatory patches
> for the upcoming Tegra210 support and a patch to enable clocks needed
> for HDMI audio support.
> 
> ----------------------------------------------------------------
> Dylan Reid (1):
>       clk: tegra: Enable HDA to HDMI clocks on Tegra124
> 
> Thierry Reding (10):
>       clk: tegra: Fix typo tabel -> table
>       clk: tegra: Fix a bunch of sparse warnings
>       clk: tegra: Various whitespace cleanups
>       clk: tegra: Use consistent indentation
>       clk: tegra: Remove needless initializations
>       clk: tegra: Register the proper number of resets
>       clk: tegra: Add peripheral registers for bank Y
>       clk: tegra: Model oscillator as clock
>       clk: tegra: Use generic tegra_osc_clk_init() on Tegra114
>       clk: tegra: Use the proper parent for plld_dsi
> 
>  drivers/clk/tegra/clk-pll.c                     |  7 ++---
>  drivers/clk/tegra/clk-tegra-fixed.c             | 24 +++++++++--------
>  drivers/clk/tegra/clk-tegra-periph.c            |  2 +-
>  drivers/clk/tegra/clk-tegra114.c                | 36 +++----------------------
>  drivers/clk/tegra/clk-tegra124.c                | 22 ++++++++++-----
>  drivers/clk/tegra/clk-tegra30.c                 | 23 ++++++++--------
>  drivers/clk/tegra/clk.c                         | 16 ++++++++++-
>  drivers/clk/tegra/clk.h                         | 10 +++----
>  include/dt-bindings/clock/tegra124-car-common.h |  2 +-
>  9 files changed, 70 insertions(+), 72 deletions(-)
