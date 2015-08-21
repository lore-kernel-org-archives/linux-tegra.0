From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 8/9] ARM: tegra: Devicetree changes for v4.3-rc1
Date: Fri, 21 Aug 2015 09:09:05 -0700
Message-ID: <20150821160905.GP4865@localhost>
References: <1439563720-13189-1-git-send-email-thierry.reding@gmail.com>
 <1439563720-13189-9-git-send-email-thierry.reding@gmail.com>
 <20150821015848.GM4865@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150821015848.GM4865@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 20, 2015 at 06:58:48PM -0700, Olof Johansson wrote:
> On Fri, Aug 14, 2015 at 04:48:39PM +0200, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> > 
> > The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:
> > 
> >   Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.3-dt
> > 
> > for you to fetch changes up to 6909c6632fdbea441b5077b4f882c0bf4b71997e:
> > 
> >   ARM: tegra: Add gpio-ranges property (2015-08-13 16:31:53 +0200)
> > 
> > Thanks,
> > Thierry
> > 
> > ----------------------------------------------------------------
> > ARM: tegra: Devicetree changes for v4.3-rc1
> > 
> > Enables CPU frequency scaling on Jetson TK1 and enables the GK20A GPU on
> > Venice2 and Jetson TK1. This also enables support for the PMU hardware
> > found on Tegra124, which among other things, can be used for performance
> > measurements.
> 
> Merged, thanks.

This caused build failures due to missing tegra124-car.h:

http://arm-soc.lixom.net/buildlogs/arm-soc/v4.2-rc2-954-g5825349/buildall.arm.tegra_defconfig.log.failed

I've dropped this branch again.


-Olof
