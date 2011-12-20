From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/9] arm/tegra: Various pinmux-related cleanups
Date: Mon, 19 Dec 2011 18:03:43 -0800
Message-ID: <20111220020343.GF27789@quad.lixom.net>
References: <1324073552-15542-1-git-send-email-swarren@nvidia.com>
 <20111218005702.GA4336@quad.lixom.net>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92A4A@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF176BE92A4A-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 19, 2011 at 09:49:57AM -0800, Stephen Warren wrote:
> Olof Johansson wrote at Saturday, December 17, 2011 5:57 PM:
> > On Fri, Dec 16, 2011 at 03:12:23PM -0700, Stephen Warren wrote:
> > > While working on switching Tegra to a new pinctrl-based pin mux driver,
> > > I made a bunch of small pinmux-related fixes; this patch series.
> > >
> > > This patch series will have a few small context conflicts with Peter
> > > De Schrijver's Tegra30 support. Peter's patch series should have
> > > priority over this one (i.e. be the one merged if it's difficult to
> > > merge both).
> > 
> > Contents of the series as a whole looks good to me, but I did notice a
> > bunch of section mismatches. Instead of commenting on the specific
> > ones, just compile with CONFIG_DEBUG_SECTION_MISMATCH=y and fix up the
> > new ones and repost, please. :)
> 
> Just to close the loop on our IRC conversation, I believe those problems
> were introduced by the pinmux rework in Peter's T30 patches rather than
> my patch series. In particular, some in:
> 
> 6996e08 arm/tegra: prepare pinmux code for multiple tegra variants
> 
> And some in:
> 
> 241682c arm/tegra: pinmux tables and definitions for tegra30
> 
> Although the latter don't show up until:
> 
> 44107d8 arm/tegra: implement support for tegra30
> 
> Since that actually creates the Kconfig option that allows the T30 pinmux
> code to be built.
> 
> I'll take a look and come up with a patch for this that can be applied to
> Tegra's for-3.3/soc branch.

Yep, sounds good. Applied this series to for-3.3/boards -- thanks!


-Olof
