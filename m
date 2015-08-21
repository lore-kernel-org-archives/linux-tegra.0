From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 8/9] ARM: tegra: Devicetree changes for v4.3-rc1
Date: Fri, 21 Aug 2015 09:33:44 -0700
Message-ID: <20150821163344.GA18595@localhost>
References: <1439563720-13189-1-git-send-email-thierry.reding@gmail.com>
 <1439563720-13189-9-git-send-email-thierry.reding@gmail.com>
 <20150821015848.GM4865@localhost>
 <20150821160905.GP4865@localhost>
 <55D75187.8010007@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55D75187.8010007-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 21, 2015 at 05:27:51PM +0100, Jon Hunter wrote:
> 
> On 21/08/15 17:09, Olof Johansson wrote:
> > On Thu, Aug 20, 2015 at 06:58:48PM -0700, Olof Johansson wrote:
> >> On Fri, Aug 14, 2015 at 04:48:39PM +0200, Thierry Reding wrote:
> >>> Hi ARM SoC maintainers,
> >>>
> >>> The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:
> >>>
> >>>   Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)
> >>>
> >>> are available in the git repository at:
> >>>
> >>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.3-dt
> >>>
> >>> for you to fetch changes up to 6909c6632fdbea441b5077b4f882c0bf4b71997e:
> >>>
> >>>   ARM: tegra: Add gpio-ranges property (2015-08-13 16:31:53 +0200)
> >>>
> >>> Thanks,
> >>> Thierry
> >>>
> >>> ----------------------------------------------------------------
> >>> ARM: tegra: Devicetree changes for v4.3-rc1
> >>>
> >>> Enables CPU frequency scaling on Jetson TK1 and enables the GK20A GPU on
> >>> Venice2 and Jetson TK1. This also enables support for the PMU hardware
> >>> found on Tegra124, which among other things, can be used for performance
> >>> measurements.
> >>
> >> Merged, thanks.
> > 
> > This caused build failures due to missing tegra124-car.h:
> 
> Should be included by Paul's patch, "clk: tegra: Add DFLL DVCO reset
> control for Tegra124", which is part of the clk series pull request [0].
> 
> > http://arm-soc.lixom.net/buildlogs/arm-soc/v4.2-rc2-954-g5825349/buildall.arm.tegra_defconfig.log.failed
> > 
> > I've dropped this branch again.
> 
> It is building ok on linux-next today.

Yeah, it builds when the dependent changes from the clk tree are included, but
this breaks bisectability potentially for quite a bit of code, and requires
that we merge after the clk branch goes in or mainline will be busted.

As mentioned just now on IRC too, it might make most sense to rebase on top
of the clk branch to avoid this breakage. Either that or drop the patch in
question for 4.3.


-Olof
